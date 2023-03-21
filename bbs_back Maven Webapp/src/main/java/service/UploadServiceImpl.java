package service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;


@Service
@Transactional
public class UploadServiceImpl implements UploadService {
    public void upload(String realPath,String webPath, MultipartFile upload,String uuName) throws Exception{
        File file=new File(realPath);
        /*
        * 1.上传到webApps 防止数据丢失
        * 2.启动idea中的tomcat  无法访问webapps中其他资源   解决方案   将资源目录部署到 idea中的tomcat下
        * */
        File parentFile = file.getParentFile();
        //webApps的路径
        String absolutePath = parentFile.getAbsolutePath();
        String s = absolutePath + webPath;
        System.out.println(s+"----------");
        File file1=new File(s);
        //判断/img文件夹是否存在，不存在则创建
        if (!file1.exists()){
            file1.mkdir();
        }
        // 1.jpg
        //String originalFilename = upload.getOriginalFilename();
        //UUID.jpg
        //String s1 = UUID.randomUUID().toString()+"."+ FilenameUtils.getExtension(originalFilename);
        //webapp/img/UUID.jpg
        File file2=new File(s+uuName);

        //写入服务器
        upload.transferTo(file2);

    }
}
