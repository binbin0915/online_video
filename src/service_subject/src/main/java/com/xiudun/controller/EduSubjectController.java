package com.xiudun.controller;


import com.xiudun.service.EduSubjectService;
import com.xiudun.util.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 * <p>
 * 影视科目 前端控制器
 * </p>
 *
 * @author xiudun
 * @since 2021-02-28
 */
@Api("影片分类管理")
@RestController
@RequestMapping("/edu-subject")
public class EduSubjectController {

    //注入业务
    @Autowired
    private EduSubjectService subjectService;

    @ApiOperation("excel批量导入数据")
    @PostMapping("addSubject")
    public R addSubject(MultipartFile file){
        //上传文件
        subjectService.batchImport(file,subjectService);
        return R.ok();
    }

    @ApiOperation("分类数据Tree")
    @GetMapping("getListTree")
    public R listTree(){
        return R.ok().data("items", subjectService.listTree());
    }
}

















































