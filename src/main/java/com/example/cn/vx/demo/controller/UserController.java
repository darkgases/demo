package com.example.cn.vx.demo.controller;

import com.example.cn.vx.demo.common.MyLog;
import com.example.cn.vx.demo.common.ReturnCode;
import com.example.cn.vx.demo.common.ReturnMsg;
import com.example.cn.vx.demo.common.CommonUtil;
import com.example.cn.vx.demo.service.user.api.*;
import com.example.cn.vx.demo.service.user.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.ResourceBundle;

/**
 * @author: dengshuai
 * @Date: 2022/05/16 17:47
 */
@RestController
public class UserController {

    @Autowired
    public  UserService userService;

    public ResourceBundle rb = ResourceBundle.getBundle("customizeParam");

    public static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @RequestMapping("/userAdd")
    public UserAddImplOutput userAdd(HttpServletRequest request){
        logger.info("UserController:userAdd开始");
        UserAddImplInput input = new UserAddImplInput();
        UserAddImplOutput output = new UserAddImplOutput();
        String signInType = request.getParameter("signInType");
        String userAccount = request.getParameter("userAccount");
        String userPassword = request.getParameter("userPassword");
        String userPhone = request.getParameter("userPhone");
        String userName = request.getParameter("userName");
        String userAge = request.getParameter("userAge");
        String userSex = request.getParameter("userSex");
        String userOpenid = request.getParameter("userOpenid");
        String createTime = request.getParameter("createTime");
        String updateTime = request.getParameter("updateTime");
        if (signInType == null || signInType == ""){
            output.setCode(ReturnCode.FAIL);
            output.setMsg("必须参数signInType缺失");
            logger.info("UserController:userAdd结束");
            return output;
        }
        if (userAccount == null || userAccount == ""){
            if (userPhone == null || userPhone == ""){
                output.setCode(ReturnCode.FAIL);
                output.setMsg("账号手机号必须上传一项");
                logger.info("UserController:userAdd结束");
                return output;
            }
        }
        if (userPassword == null || userPassword == ""){
            output.setCode(ReturnCode.FAIL);
            output.setMsg("密码不能为空");
            logger.info("UserController:userAdd结束");
            return output;
        }
        input.setSignInType(signInType);
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

    @MyLog(value = "登陆")
    @RequestMapping("/login")
    public LoginImplOutput login(HttpServletRequest request){
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

    @MyLog(value = "登陆")
    @RequestMapping("/updateUserInfo")
    public UpdateUserInfoImplOutput updateUserInfo(HttpServletRequest request){
        logger.info("UserController:updateUserInfo开始");
        UpdateUserInfoImplInput  input = new UpdateUserInfoImplInput();
        UpdateUserInfoImplOutput output = new UpdateUserInfoImplOutput();
        if (request.getParameter("updateType") == null || "".equals(request.getParameter("updateType"))){
            output.setCode(ReturnCode.FAIL);
            output.setMsg("必须参数updateType缺失");
            logger.info("UserController:updateUserInfo结束");
            return output;
        }
        if (request.getParameter("userAccount") == null || "".equals(request.getParameter("userAccount"))){
            if (request.getParameter("oldUserPhone") == null || "".equals(request.getParameter("oldUserPhone"))){
                output.setCode(ReturnCode.FAIL);
                output.setMsg("账号手机号必须上传一项");
                logger.info("UserController:updateUserInfo结束");
                return output;
            }
        }
        input.setUpdateType(request.getParameter("updateType"));
        input.setUserAccount(request.getParameter("userAccount"));
        input.setUserName(request.getParameter("userName"));
        input.setUserAge(request.getParameter("userAge"));
        input.setUserSex(request.getParameter("userSex"));
        input.setUserPhone(request.getParameter("userPhone"));
        input.setOldUserPhone(request.getParameter("oldUserPhone"));
        output = userService.updateUserInfo(input);
        logger.info("UserController:updateUserInfo结束");
        return output;
    }

    @RequestMapping("/getPublicKey")
    public GetPublicKeyImplOutput getPublicKeyInfo(HttpServletRequest request){
        logger.info("UserController:updateUserInfo开始");
        GetPublicKeyImplOutput output = new GetPublicKeyImplOutput();
        String publicKey = rb.getString("RSAPublicKey");
        output.setPublicKey(publicKey);
        output.setCode(ReturnCode.SUCCESS);
        output.setMsg(ReturnMsg.SUCCESS);
        logger.info("UserController:updateUserInfo结束");
        return output;
    }

}
