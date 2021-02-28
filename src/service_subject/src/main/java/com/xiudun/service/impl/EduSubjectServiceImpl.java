package com.xiudun.service.impl;

import com.alibaba.excel.EasyExcel;
import com.xiudun.entity.EduSubject;
import com.xiudun.mapper.EduSubjectMapper;
import com.xiudun.service.EduSubjectService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xiudun.util.ExcelLisener;
import com.xiudun.vo.ReadData;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 影视科目 服务实现类
 * </p>
 *
 * @author xiudun
 * @since 2021-02-28
 */
@Service
public class EduSubjectServiceImpl extends ServiceImpl<EduSubjectMapper, EduSubject> implements EduSubjectService {

    @Override
    public void batchImport(MultipartFile file, EduSubjectService subjectService) {
        try {
            //文件输入流
            InputStream inputStream = file.getInputStream();

            //需要指定读取那个Class，读取默认sheet，文件流自动关闭
            EasyExcel.read(inputStream, ReadData.class,new ExcelLisener(subjectService)).sheet().doRead();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public List<EduSubject> listTree() {
        //获取所有分类数据
        List<EduSubject> entities = baseMapper.selectList(null);
        //找到一级分类
        return entities.stream().filter(categoryEntity->categoryEntity.getParentId().equals("0"))
                .map(menu-> menu.setChildren(getChildrens(menu,entities)))
                .sorted((m1,m2)->(m1.getSort()==null?0:m1.getSort())-(m2.getSort()==null?0:m2.getSort()))
                .collect(Collectors.toList());
    }

    //编写一个读取树形的递归方法
    private List<EduSubject> getChildrens(EduSubject root,List<EduSubject> all){
        //递归查找
        List<EduSubject> list = all.stream().filter(categoryEntity -> {
            return categoryEntity.getParentId().equals(root.getId());//找子节点
        }).map(categoryEntity -> {//子节点
            categoryEntity.setChildren(getChildrens(categoryEntity, all));
            return categoryEntity;
        }).sorted((m1, m2) -> {
            return (m1.getSort() == null ? 0 : m1.getSort()) - (m2.getSort() == null ? 0 : m2.getSort());
        }).collect(Collectors.toList());

        //返回子节点集合
        return list;
    }
}



































