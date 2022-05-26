package com.example.cn.vx.demo.service.user;

import com.example.cn.vx.demo.service.user.api.*;

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

    /**
     * @param input
     * @return
     * @ps:用户信息更新
     */
    UpdateUserInfoImplOutput updateUserInfo(UpdateUserInfoImplInput input);

}
