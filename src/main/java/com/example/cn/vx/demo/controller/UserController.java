package com.example.cn.vx.demo.controller;

import com.example.cn.vx.demo.service.user.UserServiceImpl;
import com.example.cn.vx.demo.service.user.api.LoginImplInput;
import com.example.cn.vx.demo.service.user.api.LoginImplOutput;
import com.example.cn.vx.demo.service.user.impl.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author: dengshuai
 * @Date: 2022/05/16 17:47
 */
@RestController
public class UserController {
    @Autowired
    private UserService userService;

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @RequestMapping("/login")
    private LoginImplOutput login(@RequestParam(required = false,defaultValue = "",value = "userAccount") String userAccount,
                                  @RequestParam(required = true,defaultValue = "",value = "userPassword") String userPassword,
                                  @RequestParam(required = false,defaultValue = "",value = "userPhone") String userPhone){
        logger.info("UserController:login开始");
        LoginImplInput  input = new LoginImplInput();
        LoginImplOutput output = new LoginImplOutput();
        input.setUserAccount(userAccount);
        input.setUserPassword(userPassword);
        input.setUserPhone(userPhone);
        output = userService.login(input);
        logger.info("UserController:login结束");
        return output;
    }

}
