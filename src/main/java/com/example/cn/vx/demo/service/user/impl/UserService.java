package com.example.cn.vx.demo.service.user.impl;

import com.example.cn.vx.demo.service.user.api.LoginImplInput;
import com.example.cn.vx.demo.service.user.api.LoginImplOutput;
import com.example.cn.vx.demo.service.user.api.UserAddImplInput;
import com.example.cn.vx.demo.service.user.api.UserAddImplOutput;

/**
 * @author: dengshuai
 * @Date: 2022/05/16 17:41
 */
public interface UserService {
    /**
     * @param input
     * @return
     * @ps:登陆
     */
    LoginImplOutput login(LoginImplInput input);

    /**
     * @param input
     * @return
     * @ps:用户注册
     */
    UserAddImplOutput userAdd(UserAddImplInput input);
}
