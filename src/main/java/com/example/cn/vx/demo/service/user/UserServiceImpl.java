package com.example.cn.vx.demo.service.user;

import com.example.cn.vx.demo.common.ReturnCode;
import com.example.cn.vx.demo.common.ReturnMsg;
import com.example.cn.vx.demo.entity.User;
import com.example.cn.vx.demo.entity.UserInfo;
import com.example.cn.vx.demo.mapper.UserInfoMapper;
import com.example.cn.vx.demo.mapper.UserMapper;
import com.example.cn.vx.demo.service.user.api.LoginImplInput;
import com.example.cn.vx.demo.service.user.api.LoginImplOutput;
import com.example.cn.vx.demo.service.user.api.UserAddImplInput;
import com.example.cn.vx.demo.service.user.api.UserAddImplOutput;
import com.example.cn.vx.demo.service.user.impl.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.Dictionary;

/**
 * @author: dengshuai
 * @Date: 2022/05/16 17:43
 */
@Transactional(rollbackFor = Exception.class)
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserInfoMapper userInfoMapper;


    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    @Override
    public UserAddImplOutput userAdd(UserAddImplInput input){
        logger.info("UserServiceImpl-userAdd服务开始");
        //signInType注册方式 1：手机号注册 2：账号方式注册
        String signInType = "";
        UserAddImplOutput out = new UserAddImplOutput();
        UserInfo userInfo = new UserInfo();
        if (input.getUserAccount() == null || "".equals(input.getUserAccount())){
            signInType="1";
            userInfo.setUserPhone(input.getUserPhone());
        }else{
            signInType="2";
            userInfo.setUserAccount(input.getUserAccount());
        }
        UserInfo user = userInfoMapper.selectOne(userInfo);
        if (user == null){
            if (input.getUserPassword() != null && input.getUserPassword() != ""){
                userInfo.setUserPassword(input.getUserPassword());
            }
            if (input.getUserName() != null && input.getUserName() != ""){
                userInfo.setUserName(input.getUserName());
            }
            if (input.getUserAge() != null && input.getUserAge() != ""){
                userInfo.setUserAge(input.getUserAge());
            }
            if (input.getUserSex() != null && input.getUserSex() != ""){
                userInfo.setUserSex(input.getUserSex());
            }
            if (input.getUserOpenid() != null && input.getUserOpenid() != ""){
                userInfo.setUserOpenid(input.getUserOpenid());
            }
            int userId = userInfoMapper.insert(userInfo);
            if (userId == 1){
                out.setCode(ReturnCode.SUCCESS);
                out.setMsg(ReturnMsg.SUCCESS);
            }else{
                out.setCode(ReturnCode.THE_USER_INSERT_FAIL);
                out.setMsg(ReturnMsg.THE_USER_INSERT_FAIL);
            }
        }else {
            if ("1".equals(signInType)){
                out.setCode(ReturnCode.THE_PHONE_IS_EXIST);
                out.setMsg(ReturnMsg.THE_PHONE_IS_EXIST);
            }else if("2".equals(signInType)){
                out.setCode(ReturnCode.THE_ACCOUNT_IS_EXIST);
                out.setMsg(ReturnMsg.THE_ACCOUNT_IS_EXIST);
            }
        }
        logger.info("UserServiceImpl-userAdd服务结束");
        return out;
    }

    @Override
    public LoginImplOutput login(LoginImplInput input){
        logger.info("UserServiceImpl-login服务开始");
        LoginImplOutput out = new LoginImplOutput();
        String userAccount = input.getUserAccount();
        String userPassword = input.getUserPassword();
        String userPhone = input.getUserPhone();
        UserInfo where = new UserInfo();
        if (userAccount == null || "".equals(userAccount)){
            where.setUserPhone(userPhone);
        }else{
            where.setUserAccount(userAccount);
        }
        UserInfo user = userInfoMapper.selectOne(where);
        System.out.println(user);
        if (user!=null){
            if (user.getUserPassword().equals(userPassword)){
                out.setCode(ReturnCode.SUCCESS);
                out.setMsg(ReturnMsg.SUCCESS);
            }else{
                out.setCode(ReturnCode.THE_PASSWORD_ERROR);
                out.setMsg(ReturnMsg.THE_PASSWORD_ERROR);
            }
        }else{
            out.setCode(ReturnCode.THE_USER_IS_NOT_EXIST);
            out.setMsg(ReturnMsg.THE_USER_IS_NOT_EXIST);
        }
        logger.info("UserServiceImpl-login服务结束");
        return out;
    }
}
