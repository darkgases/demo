package com.example.cn.vx.demo.service.user.impl;

import com.example.cn.vx.demo.common.ReturnCode;
import com.example.cn.vx.demo.common.ReturnMsg;
import com.example.cn.vx.demo.common.des.RSACoder;
import com.example.cn.vx.demo.common.enums.UserState;
import com.example.cn.vx.demo.entity.UserInfo;
import com.example.cn.vx.demo.mapper.UserInfoMapper;
import com.example.cn.vx.demo.service.user.UserService;
import com.example.cn.vx.demo.service.user.api.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ResourceBundle;

/**
 * @author: dengshuai
 * @Date: 2022/05/16 17:43
 */
@Transactional(rollbackFor = Exception.class)
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserInfoMapper userInfoMapper;

    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    ResourceBundle rb = ResourceBundle.getBundle("static/customizeParam");

    @Override
    public UserAddImplOutput userAdd(UserAddImplInput input){
        logger.info("UserServiceImpl-userAdd服务开始");
        //signInType注册方式 1：手机号注册 2：账号方式注册
        String signInType = input.getSignInType();
        UserAddImplOutput out = new UserAddImplOutput();
        UserInfo userInfo = new UserInfo();
        UserInfo user;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date now = new Date();
        if ("1".equals(signInType)){
            user = getUserInfo("","",input.getUserPhone());
            if (user == null){
                userInfo.setUserPhone(input.getUserPhone());
            }else{
                out.setCode(ReturnCode.THE_PHONE_IS_EXIST);
                out.setMsg(ReturnMsg.THE_PHONE_IS_EXIST);
                logger.info("UserServiceImpl-userAdd服务结束");
                return out;
            }
        }else {
            user = getUserInfo("",input.getUserAccount(),"");
            if (user == null){
                userInfo.setUserAccount(input.getUserAccount());
            }else{
                out.setCode(ReturnCode.THE_ACCOUNT_IS_EXIST);
                out.setMsg(ReturnMsg.THE_ACCOUNT_IS_EXIST);
                logger.info("UserServiceImpl-userAdd服务结束");
                return out;
            }
        }
        //密码公钥加密、后期放入前端处理
        if (input.getUserPassword() != null && input.getUserPassword() != ""){
            String rsaPublicKey = rb.getString("RSAPublicKey");
            byte[] passwordByte = input.getUserPassword().getBytes();
            byte[] encodedData = new byte[0];
            try {
                encodedData = RSACoder.encryptByPublicKey(passwordByte, rsaPublicKey);
            } catch (Exception e) {
                logger.error("UserServiceImpl-userAdd密码加密失败");
                e.printStackTrace();
            }
            //byte转String
            BASE64Encoder enc=new BASE64Encoder();
            String encrypt=enc.encode(encodedData);
            System.out.println("encrypt:"+encrypt);
            userInfo.setUserPassword(encrypt);
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
        userInfo.setUserRoleId(2);
        userInfo.setPasswordErrTime("0");
        userInfo.setUserState(UserState.valueOf("NORMAL").getUserState());
        userInfo.setUserInfoState(userInfo.checkInfoState(userInfo));
        userInfo.setCreateTime(sdf.format(now));
        userInfo.setUpdateTime(sdf.format(now));
        int userId = userInfoMapper.insert(userInfo);
        if (userId > 0){
            out.setUserInfo(userInfo);
            out.setCode(ReturnCode.SUCCESS);
            out.setMsg(ReturnMsg.SUCCESS);
        }else{
            out.setCode(ReturnCode.THE_USER_INSERT_FAIL);
            out.setMsg(ReturnMsg.THE_USER_INSERT_FAIL);
        }
        logger.info("UserServiceImpl-userAdd服务结束");
        return out;
    }

    @Override
    public UpdateUserInfoImplOutput updateUserInfo(UpdateUserInfoImplInput input) {
        logger.info("UserServiceImpl-updateUserInfo服务开始");
        UpdateUserInfoImplOutput out = new UpdateUserInfoImplOutput();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date now = new Date();
        UserInfo userInfo = getUserInfo(input.getUserId(),"","");
        if (userInfo == null){
            out.setCode(ReturnCode.THE_USER_IS_NOT_EXIST);
            out.setMsg(ReturnMsg.THE_USER_IS_NOT_EXIST);
            logger.info("UserServiceImpl-updateUserInfo服务结束");
            return out;
        }
        switch (input.getUpdateType()){
            case "1":
                logger.info("完善资料");
                userInfo.setUserAge(input.getUserAge());
                userInfo.setUserName(input.getUserName());
                userInfo.setUserSex(input.getUserSex());
                userInfo.setUserInfoState(userInfo.checkInfoState(userInfo));
                userInfo.setUpdateTime(sdf.format(now));
                userInfoMapper.updateByPrimaryKey(userInfo);
                out.setCode(ReturnCode.SUCCESS);
                out.setMsg("完善资料"+ReturnMsg.SUCCESS);
                break;
            case  "2":
                logger.info("更换手机号");
                userInfo.setUserPhone(input.getUserPhone());
                userInfo.setUpdateTime(sdf.format(now));
                userInfoMapper.updateByPrimaryKey(userInfo);
                out.setCode(ReturnCode.SUCCESS);
                out.setMsg("更换手机号"+ReturnMsg.SUCCESS);
                break;
            case  "3":
                logger.info("账户状态初始化");
                userInfo.setUserState(UserState.valueOf("NORMAL").getUserState());
                userInfo.setUserStateMsg("");
                userInfo.setPasswordErrTime("0");
                userInfo.setUpdateTime(sdf.format(now));
                userInfoMapper.updateByPrimaryKey(userInfo);
                out.setCode(ReturnCode.SUCCESS);
                out.setMsg("账户状态初始化"+ReturnMsg.SUCCESS);
                break;
            default:
                logger.info("暂无内容");
                out.setCode(ReturnCode.SUCCESS);
                out.setMsg(ReturnMsg.SUCCESS);
        }
        out.setUserInfo(userInfo);
        logger.info("UserServiceImpl-updateUserInfo服务结束");
        return out;
    }

    @Override
    public LoginImplOutput login(LoginImplInput input){
        logger.info("UserServiceImpl-login服务开始");
        LoginImplOutput out = new LoginImplOutput();
        String userAccount = input.getUserAccount();
        String userPassword = input.getUserPassword();
        String userPhone = input.getUserPhone();
        UserInfo user = getUserInfo("",userAccount,userPhone);
        if (user!=null){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date now = new Date();
            if (!user.getUserState().equals(UserState.valueOf("NORMAL").getUserState())){
                out.setCode(ReturnCode.THE_STATE_ABNORMAL);
                out.setMsg(ReturnMsg.THE_STATE_ABNORMAL);
                logger.info("UserServiceImpl-login服务结束");
                return out;
            }
            int maxErrTime = Integer.parseInt(rb.getString("THE_PASSWORD_MAX_ERR_TIME"));
            String dbPassword = user.getUserPassword();
            Boolean check = false;
            try {
                check = checkPassword(dbPassword, userPassword);
            } catch (Exception e) {
                logger.error("UserServiceImpl-login服务密码解密错误");
                e.printStackTrace();
            }
            if (check){
                out.setCode(ReturnCode.SUCCESS);
                out.setMsg(ReturnMsg.SUCCESS);
                out.setUserInfo(user);
            }else{
                int nowErroTime = Integer.parseInt(user.getPasswordErrTime()) + 1;
                if (nowErroTime >= maxErrTime){
                    user.setUserState(UserState.valueOf("LOCK").getUserState());
                    user.setUserStateMsg(ReturnMsg.THE_STATE_LOCK);
                    user.setPasswordErrTime(String.valueOf(nowErroTime));
                    user.setUpdateTime(sdf.format(now));
                    userInfoMapper.updateByPrimaryKey(user);
                    out.setCode(ReturnCode.THE_STATE_LOCK);
                    out.setMsg(ReturnMsg.THE_STATE_LOCK);
                }else{
                    user.setPasswordErrTime(String.valueOf(nowErroTime));
                    user.setUpdateTime(sdf.format(now));
                    userInfoMapper.updateByPrimaryKey(user);
                    out.setCode(ReturnCode.THE_PASSWORD_ERROR);
                    out.setMsg(ReturnMsg.THE_PASSWORD_ERROR);
                }
            }
        }else{
            out.setCode(ReturnCode.THE_USER_IS_NOT_EXIST);
            out.setMsg(ReturnMsg.THE_USER_IS_NOT_EXIST);
        }
        logger.info("UserServiceImpl-login服务结束");
        return out;
    }

    /**
     * 传入账号、手机号获取用户信息
     */
    public UserInfo getUserInfo(String userId,String userAccount, String userPhone){
        UserInfo userInfo = new UserInfo();
        if (userId != null && userId!=""){
            userInfo.setUserId(Integer.valueOf(userId));
        }
        if (userAccount != null && userAccount!=""){
            userInfo.setUserAccount(userAccount);
        }
        if (userPhone != null && userPhone!=""){
            userInfo.setUserPhone(userPhone);
        }
        userInfo = userInfoMapper.selectOne(userInfo);
        return userInfo;
    }

    public Boolean checkPassword(String dbPassword,String paramPassword) throws Exception {
        Boolean check = false;
        String rsaPrivateKey = rb.getString("RSAPrivateKey");
        //传入的密码String转byte
        BASE64Decoder dec=new BASE64Decoder();
        //数据库存储的内容
        byte[] dbByte = new byte[0];
        //前端上传的内容
        byte[] paramByte = new byte[0];
        try {
            dbByte = dec.decodeBuffer(dbPassword);
            paramByte = dec.decodeBuffer(paramPassword);
        } catch (IOException e1) {
            e1.printStackTrace();
        }
        //私钥解密
        byte[] dbByteDec = RSACoder.decryptByPrivateKey(dbByte, rsaPrivateKey);
        byte[] paramByteDec = RSACoder.decryptByPrivateKey(dbByte, rsaPrivateKey);
        //byte转String
        BASE64Encoder enc=new BASE64Encoder();
        //数据库存储、解密后的内容
//        String dbStringDec=enc.encode(dbByteDec);
        String dbStringDec = new String(dbByteDec);
        System.out.println("数据库存储、解密后的内容:"+dbStringDec);
//        前端上送、解密后的内容
//        String paramStringDec=enc.encode(paramByteDec);
        String paramStringDec = new String(paramByteDec);
        System.out.println("前端上送、解密后的内容:"+paramStringDec);
        if (dbStringDec.equals(paramStringDec)){
            check = true;
        }
        return check;
    }
}
