package com.example.cn.vx.demo.controller;

import com.example.cn.vx.demo.common.aop.MyLog;
import com.example.cn.vx.demo.service.album.api.AddAlbumOutput;
import com.example.cn.vx.demo.service.photo.PhotoService;
import com.example.cn.vx.demo.service.photo.api.UploadPhotoOutput;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author: dengshuai
 * @Date: 2022/08/17 10:57
 */
@RestController
public class PhotoController {
    @Autowired
    public PhotoService photoService;

    private static final Logger logger = LoggerFactory.getLogger(PhotoController.class);

    @MyLog(value = "上传相片")
    @RequestMapping("/uploadPhoto")
    public UploadPhotoOutput uploadPhoto(@RequestBody MultiValueMap< String, String > values) {
        logger.info("PhotoController:uploadPhoto开始");
        UploadPhotoOutput output = new UploadPhotoOutput();
        logger.info("PhotoController:uploadPhoto开始");
        return output;
    }
}
