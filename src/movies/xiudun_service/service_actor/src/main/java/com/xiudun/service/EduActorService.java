package com.xiudun.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xiudun.entity.EduActor;
import com.baomidou.mybatisplus.extension.service.IService;
import com.xiudun.query.ActorQuery;

import java.util.Map;

/**
 * <p>
 * 演员 服务类
 * </p>
 *
 * @author xiudun
 * @since 2021-02-21
 */
public interface EduActorService extends IService<EduActor> {

    //分页
    Map<String,Object> getActorList(Page<EduActor> page);

}
