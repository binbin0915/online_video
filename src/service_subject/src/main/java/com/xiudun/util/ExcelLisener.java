package com.xiudun.util;
import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xiudun.entity.EduSubject;
import com.xiudun.service.EduSubjectService;
import com.xiudun.vo.ReadData;
import java.util.Map;

//excel监听器
public class ExcelLisener extends AnalysisEventListener<ReadData> {

    //注入业务
    private EduSubjectService subjectService;

    //构造方法
    public ExcelLisener() {}

    public ExcelLisener(EduSubjectService subjectService) {
        this.subjectService = subjectService;
    }

    //判断一级分类是否重复
    private EduSubject existOneSubject(EduSubjectService subjectService,String name){
        //查询条件
        QueryWrapper<EduSubject> wrapper = new QueryWrapper<>();
        wrapper.eq("title",name);
        wrapper.eq("parent_id","0");
        //添加判断条件
        EduSubject subject = subjectService.getOne(wrapper);
        return subject;
    }

    //判断二级分类是否重复
    private EduSubject existTwoSubject(EduSubjectService subjectService,String name,String pid){
        //创建条件对象
        QueryWrapper<EduSubject> wrapper = new QueryWrapper<>();
        //添加添加条件
        wrapper.eq("title",name);
        wrapper.eq("parent_id",pid);
        //获取二级的对象
        EduSubject subject = subjectService.getOne(wrapper);
        return subject;
    }

    //读取excel数据
    public void invoke(ReadData readData, AnalysisContext analysisContext) {
        //判断
        if (readData==null) {
            throw new RuntimeException("添加数据失败");
        }

        //添加一级分类
        EduSubject existOneSubject = existOneSubject(subjectService, readData.getOneSubjectName());
        if (existOneSubject==null) {//没有相同的
            existOneSubject = new EduSubject();
            existOneSubject.setTitle(readData.getOneSubjectName());
            existOneSubject.setParentId("0");
            subjectService.save(existOneSubject);
        }

        //获取一级分类的id
        String pid = existOneSubject.getId();

        //添加二级分类
        EduSubject existTwoSubject = existTwoSubject(subjectService, readData.getTwoSubjectName(), pid);
        if (existTwoSubject==null) {
            existTwoSubject = new EduSubject();
            existTwoSubject.setTitle(readData.getTwoSubjectName());
            existTwoSubject.setParentId(pid);
            subjectService.save(existTwoSubject);
        }
    }

    @Override//读取头信息
    public void invokeHeadMap(Map<Integer, String> headMap, AnalysisContext context) {
        System.out.println("表头:"+headMap);
    }

    //读取后
    public void doAfterAllAnalysed(AnalysisContext analysisContext) { }
}


































