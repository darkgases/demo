package com.example.cn.vx.demo.service.phone;

import com.example.cn.vx.demo.service.phone.api.AddAlbumInput;
import com.example.cn.vx.demo.service.phone.api.AddAlbumOutput;
import com.example.cn.vx.demo.service.user.api.LoginImplInput;
import com.example.cn.vx.demo.service.user.api.LoginImplOutput;

/**
 * @author: dengshuai
 * @Date: 2022/08/04 15:21
 */
public interface PhoneService {
    /**
     * @param input
     * @return
     * @ps:新建相册
     */
    AddAlbumOutput addAlbum(AddAlbumInput input);
}
