package com.xiudun.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xiudun.entity.EduActor;
import com.xiudun.mapper.EduActorMapper;
import com.xiudun.query.ActorQuery;
import com.xiudun.service.EduActorService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 演员 服务实现类
 * </p>
 *
 * @author xiudun
 * @since 2021-02-21
 */
@Service
public class EduActorServiceImpl extends ServiceImpl<EduActorMapper, EduActor> implements EduActorService {
    @Override
    public Map<String, Object> getActorList(Page<EduActor> page) {
        //分页条件
        QueryWrapper<EduActor> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("id");
        baseMapper.selectPage(page,wrapper);
        //当前页、总的页数、每页记录数、总的记录数
        long current = page.getCurrent();
        long pages = page.getPages();
        long size = page.getSize();
        long total = page.getTotal();
        //记录
        List<EduActor> records = page.getRecords();
        //上一页、下一页
        boolean hasPrevious = page.hasPrevious();
        boolean hasNext = page.hasNext();
        //添加一下分页条件
        Map<String, Object> map = new HashMap<>();
        map.put("records",records);
        map.put("current",current);
        map.put("pages",pages);
        map.put("size",size);
        map.put("total",total);
        map.put("hasPrevious",hasPrevious);
        map.put("hasNext",hasNext);

        return map;
    }

}






























