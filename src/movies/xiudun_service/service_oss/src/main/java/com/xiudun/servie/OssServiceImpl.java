package com.xiudun.servie;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.xiudun.util.ConstantPropertiesUtils;
import org.joda.time.DateTime;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.InputStream;
import java.util.UUID;

@Service
public class OssServiceImpl implements OssService{

    //演员的头像或影视的海报上传
    @Override
    public String uploadFileAvatar(MultipartFile file) {
        //通过工具类获取配置数据
        String endPoint = ConstantPropertiesUtils.END_POINT;
        String accessKeyId = ConstantPropertiesUtils.ACCESS_KEY_ID;
        String accessKeySecret = ConstantPropertiesUtils.ACCESS_KEY_SECRET;
        String bucketName = ConstantPropertiesUtils.BUCKET_NAME;
        //完成上传
        try {
            //获取上传的输入流
            InputStream inputStream = file.getInputStream();
            //获取文件名称
            String filename = file.getOriginalFilename();
            //为文件起一个唯一的名称
            /*CRC32 crc32 = new CRC32();
            crc32.update(UUID.randomUUID().toString().getBytes());
            crc32.getValue();*/
            filename = UUID.randomUUID().toString().replaceAll("-","")+filename;
            //按照年月日创建上传的目录存放图片:2021/02/25
            String datePath = new DateTime().toString("yyyy/MM/dd");
            //拼接
            filename = datePath+"/"+filename;
            /*
            * 调用oss实现上传
            * 第一个参数  bucket名称
            * 第二个参数  文件名称
            * 第三个参数  输入流
            */
            OSS ossClient = new OSSClientBuilder().build(endPoint, accessKeyId, accessKeySecret);
            ossClient.putObject(bucketName,filename,inputStream);
            //关闭ossclient
            ossClient.shutdown();
            //上传文件后需要获取文件的路径
            //https://xiudun.oss-cn-beijing.aliyuncs.com/01.jpeg
            String url = "https://"+bucketName+"."+endPoint+"/"+filename;
            return url;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}




































