package service;

import annotation.Log;
import org.springframework.web.multipart.MultipartFile;

public interface UploadService {
    @Log(desc = "上传文件")
    void upload(String realPath ,String webPath,MultipartFile upload,String uuName) throws Exception;
}
