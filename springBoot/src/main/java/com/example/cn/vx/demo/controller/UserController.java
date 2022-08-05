package com.example.cn.vx.demo.controller;

import com.example.cn.vx.demo.common.ReturnCode;
import com.example.cn.vx.demo.common.ReturnMsg;
import com.example.cn.vx.demo.common.aop.MyLog;
import com.example.cn.vx.demo.common.until.CommonUtil;
import com.example.cn.vx.demo.service.user.UserService;
import com.example.cn.vx.demo.service.user.api.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import static com.example.cn.vx.demo.common.until.CommonUtil.checkNull;

/**
 * @author: dengshuai
 * @Date: 2022/05/16 17:47
 */
@RestController
public class UserController {

    @Autowired
    public  UserService userService;

    private ResourceBundle rb = ResourceBundle.getBundle("static/customizeParam");

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @MyLog(value = "注册")
    @RequestMapping("/userAdd")
    public UserAddImplOutput userAdd(@RequestBody MultiValueMap< String, String > values){
        logger.info("UserController:userAdd开始");
        UserAddImplInput input = new UserAddImplInput();
        UserAddImplOutput output = new UserAddImplOutput();
        List<String> signInType = values.get("signInType");
        List<String> userAccount = values.get("userAccount");
        List<String> userPassword = values.get("userPassword");
        List<String> userPhone = values.get("userPhone");
        List<String> userName = values.get("userName");
        List<String> userAge = values.get("userAge");
        List<String> userSex = values.get("userSex");
        List<String> userOpenid = values.get("userOpenid");
        List<String> createTime = values.get("createTime");
        List<String> updateTime = values.get("updateTime");
        if (checkNull(signInType)){
            output.setCode(ReturnCode.FAIL);
            output.setMsg("必须参数signInType缺失");
            logger.info("UserController:userAdd结束");
            return output;
        }
        if ("1".equals(signInType.get(0))){
            //手机号注册
            if (checkNull(userPhone)){
                output.setCode(ReturnCode.FAIL);
                output.setMsg("手机号不能为空");
                return output;
            }
        }else if ("2".equals(signInType.get(0))){
            //账号注册
            if (checkNull(userAccount)){
                output.setCode(ReturnCode.FAIL);
                output.setMsg("账号不能为空");
                return output;
            }
        }else {
            output.setCode(ReturnCode.FAIL);
            output.setMsg("无此注册渠道");
            return output;
        }
        if (checkNull(userPassword)){
            output.setCode(ReturnCode.FAIL);
            output.setMsg("密码不能为空");
            logger.info("UserController:userAdd结束");
            return output;
        }
        if (!checkNull(signInType)){
            input.setSignInType(signInType.get(0));
        }
        if (!checkNull(userPassword)){
            input.setUserPassword(userPassword.get(0));
        }
        if (!checkNull(userAccount)){
            input.setUserAccount(userAccount.get(0));
        }
        if (!checkNull(userPhone)){
            input.setUserPhone(userPhone.get(0));
        }
        if (!checkNull(userName)){
            input.setUserName(userName.get(0));
        }
        if (!checkNull(userAge)){
            input.setUserAge(userAge.get(0));
        }
        if (!checkNull(userSex)){
            input.setUserSex(userSex.get(0));
        }
        if (!checkNull(userOpenid)){
            input.setUserOpenid(userOpenid.get(0));
        }
        if (!checkNull(createTime)){
            input.setCreateTime(createTime.get(0));
        }
        if (!checkNull(updateTime)){
            input.setUpdateTime(updateTime.get(0));
        }
        output = userService.userAdd(input);
        logger.info("UserController:userAdd结束");
        return output;
    }

    @MyLog(value = "登陆")
    @RequestMapping("/login")
    public LoginImplOutput login(@RequestBody MultiValueMap< String, String > values){
        logger.info("UserController:login开始");
        LoginImplInput  input = new LoginImplInput();
        LoginImplOutput output = new LoginImplOutput();
        List<String> userAccount = values.get("account");
        List<String> userPhone = values.get("phone");
        List<String> userPassword = values.get("password");
        List<String> userOpenId = values.get("openId");
        if (checkNull(userAccount) && checkNull(userPhone)){
            output.setCode(ReturnCode.FAIL);
            output.setMsg("登陆：账号或手机号不能为空");
            logger.info("UserController:login结束");
            return output;
        }
        if (checkNull(userPassword)){
            output.setCode(ReturnCode.FAIL);
            output.setMsg("登陆：密码不能为空");
            logger.info("UserController:login结束");
            return output;
        }
        if (!checkNull(userAccount)){
            input.setUserAccount(userAccount.get(0));
        }
        if (!checkNull(userPassword)){
            input.setUserPassword(userPassword.get(0));
        }
        if (!checkNull(userPhone)){
            input.setUserPhone(userPhone.get(0));
        }
        if (!checkNull(userOpenId)){
            input.setUserOpenId(userOpenId.get(0));
        }
        output = userService.login(input);
        logger.info("UserController:login结束");
        return output;
    }

    @MyLog(value = "更新用户信息")
    @RequestMapping("/updateUserInfo")
    public UpdateUserInfoImplOutput updateUserInfo(@RequestBody MultiValueMap< String, String > values){
        logger.info("UserController:updateUserInfo开始");
        UpdateUserInfoImplInput  input = new UpdateUserInfoImplInput();
        UpdateUserInfoImplOutput output = new UpdateUserInfoImplOutput();
        List<String> updateType = values.get("updateType");
        List<String> userId = values.get("userId");
        List<String> userPhone = values.get("userPhone");
        List<String> oldUserPhone = values.get("oldUserPhone");
        List<String> userName = values.get("userName");
        List<String> userAge = values.get("userAge");
        List<String> userSex = values.get("userSex");
        if (checkNull(updateType)){
            output.setCode(ReturnCode.FAIL);
            output.setMsg("必须参数updateType缺失");
            logger.info("UserController:updateUserInfo结束");
            return output;
        }
        if (checkNull(userId)){
            output.setCode(ReturnCode.FAIL);
            output.setMsg("必须参数userId缺失");
            logger.info("UserController:updateUserInfo结束");
            return output;
        }

        if ("2".equals(values.get("updateType").get(0)) ){
            if (checkNull(userPhone)){
                output.setCode(ReturnCode.FAIL);
                output.setMsg("修改手机号：新手机号不能为空");
                logger.info("UserController:updateUserInfo结束");
                return output;
            }
            if (checkNull(oldUserPhone)){
                output.setCode(ReturnCode.FAIL);
                output.setMsg("修改手机号：旧手机号不能为空");
                logger.info("UserController:updateUserInfo结束");
                return output;
            }
        }
        if (!checkNull(updateType)){
            input.setUpdateType(updateType.get(0));
        }
        if (!checkNull(userId)){
            input.setUserId(userId.get(0));
        }
        if (!checkNull(userName)){
            input.setUserName(userName.get(0));
        }
        if (!checkNull(userAge)){
            input.setUserAge(userAge.get(0));
        }
        if (!checkNull(userSex)){
            input.setUserSex(userSex.get(0));
        }
        if (!checkNull(userPhone)){
            input.setUserPhone(userPhone.get(0));
        }
        if (!checkNull(oldUserPhone)){
            input.setOldUserPhone(oldUserPhone.get(0));
        }
        output = userService.updateUserInfo(input);
        logger.info("UserController:updateUserInfo结束");
        return output;
    }

    @MyLog(value = "获取公钥")
    @RequestMapping("/getPublicKey")
    public GetPublicKeyImplOutput getPublicKeyInfo(@RequestBody MultiValueMap< String, String > values){
        logger.info("UserController:updateUserInfo开始");
        GetPublicKeyImplOutput output = new GetPublicKeyImplOutput();
        String publicKey = rb.getString("RSAPublicKey");
        output.setPublicKey(publicKey);
        output.setCode(ReturnCode.SUCCESS);
        output.setMsg(ReturnMsg.SUCCESS);
        logger.info("UserController:updateUserInfo结束");
        return output;
    }

    @MyLog(value = "获取openId")
    @RequestMapping("/getOpenId")
    public GetOpenIdOutput getOpenId(@RequestBody MultiValueMap< String, String > values){
        logger.info("UserController:getSecurityQuestionList开始");
        GetOpenIdOutput output = new GetOpenIdOutput();
        GetOpenIdInput input = new GetOpenIdInput();
        List<String> code = values.get("code");
        if (checkNull(code)){
            output.setCode(ReturnCode.FAIL);
            output.setMsg("前端上传code为空");
            logger.info("UserController:getSecurityQuestionList结束");
            return output;
        }
        if (!checkNull(code)){
            input.setCode(code.get(0));
        }
        output = userService.getOpenId(input);
        logger.info("UserController:getSecurityQuestionList结束");
        return output;
    }


}
