package com.example.cn.vx.demo.controller;

import com.example.cn.vx.demo.service.user.api.LoginImplInput;
import com.example.cn.vx.demo.service.user.api.LoginImplOutput;
import com.example.cn.vx.demo.service.user.api.UserAddImplInput;
import com.example.cn.vx.demo.service.user.api.UserAddImplOutput;
import com.example.cn.vx.demo.service.user.impl.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * @author: dengshuai
 * @Date: 2022/05/16 17:47
 */
@RestController
public class UserController {
    @Autowired
    private UserService userService;

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @RequestMapping("/userAdd")
    private UserAddImplOutput userAdd(HttpServletRequest request){
        logger.info("UserController:userAdd开始");
        UserAddImplInput input = new UserAddImplInput();
        UserAddImplOutput output = new UserAddImplOutput();
        String userAccount = request.getParameter("userAccount");
        String userPassword = request.getParameter("userPassword");
        String userPhone = request.getParameter("userPhone");
        String userName = request.getParameter("userName");
        String userAge = request.getParameter("userAge");
        String userSex = request.getParameter("userSex");
        String userOpenid = request.getParameter("userOpenid");
        String createTime = request.getParameter("createTime");
        String updateTime = request.getParameter("updateTime");
        input.setUserAccount(userAccount);
        input.setUserPassword(userPassword);
        input.setUserPhone(userPhone);
        input.setUserName(userName);
        input.setUserAge(userAge);
        input.setUserSex(userSex);
        input.setUserOpenid(userOpenid);
        input.setCreateTime(createTime);
        input.setUpdateTime(updateTime);
        output = userService.userAdd(input);
        logger.info("UserController:userAdd结束");
        return output;
    }

    @RequestMapping("/login")
    private LoginImplOutput login(HttpServletRequest request){
        logger.info("UserController:login开始");
        String userAccount = request.getParameter("userAccount");
        String userPassword = request.getParameter("userPassword");
        String userPhone = request.getParameter("userPhone");
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
