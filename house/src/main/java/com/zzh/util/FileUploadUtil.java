package com.zzh.util;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.File;
import java.io.IOException;

/**
 * Created by ZZH_PC on 2019/12/30.
 */
@Component
public class FileUploadUtil {
    public static final String path = "G:\\images\\";

    public static String fileUpload(String fileName,@RequestParam(value = "pfile",required = false) CommonsMultipartFile com){
        //获取后缀名
        String sufName = fileName.substring(fileName.lastIndexOf("."));
        //新文件名
        String newName = System.currentTimeMillis() + sufName;
        //存储位置
        String savePath = path + newName;

        File file = new File(savePath);
        try {
            com.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return newName;
    }
}
