package com.xiudun.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.xiudun.entity.EduSubject;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * <p>
 * 影视科目 服务类
 * </p>
 *
 * @author xiudun
 * @since 2021-02-28
 */
public interface EduSubjectService extends IService<EduSubject> {
    //上传excel
    void batchImport(MultipartFile file,EduSubjectService subjectService);

    //树形
    List<EduSubject> listTree();
}
