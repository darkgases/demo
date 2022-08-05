package com.example.cn.vx.demo.controller;

import com.example.cn.vx.demo.common.aop.MyLog;
import com.example.cn.vx.demo.service.phone.PhoneService;
import com.example.cn.vx.demo.service.phone.api.AddAlbumInput;
import com.example.cn.vx.demo.service.phone.api.AddAlbumOutput;
import com.example.cn.vx.demo.service.user.api.UserAddImplOutput;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import static com.example.cn.vx.demo.common.until.CommonUtil.checkNull;

/**
 * @author: dengshuai
 * @Date: 2022/08/04 15:17
 */
@RestController
public class PhoneController {
    @Autowired
    public PhoneService phoneService;

    private static final Logger logger = LoggerFactory.getLogger(PhoneController.class);

    @MyLog(value = "新建相册")
    @RequestMapping("/addAlbum")
    public AddAlbumOutput addAlbum(@RequestBody MultiValueMap< String, String > values){
        logger.info("PhoneController:addAlbum开始");
        AddAlbumInput input = new AddAlbumInput();
        AddAlbumOutput output = new AddAlbumOutput();
        List<String> albumName = values.get("albumName");
        List<String> albumDescribe = values.get("albumDescribe");
        if (!checkNull(albumName)){
            input.setAlbumName(albumName.get(0));
        }
        if (!checkNull(albumDescribe)){
            input.setAlbumDescribe(albumDescribe.get(0));
        }
        output = phoneService.addAlbum(input);
        logger.info("PhoneController:addAlbum结束");
        return output;
    }
}
