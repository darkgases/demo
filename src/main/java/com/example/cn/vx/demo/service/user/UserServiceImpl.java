package com.example.cn.vx.demo.service.user;

import com.example.cn.vx.demo.entity.User;
import com.example.cn.vx.demo.mapper.UserMapper;
import com.example.cn.vx.demo.service.user.api.LoginImplInput;
import com.example.cn.vx.demo.service.user.api.LoginImplOutput;
import com.example.cn.vx.demo.service.user.impl.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @author: dengshuai
 * @Date: 2022/05/16 17:43
 */
@Transactional(rollbackFor = Exception.class)
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    @Override
    public LoginImplOutput login(LoginImplInput input){
        logger.info("UserServiceImpl服务开始");
        LoginImplOutput out = new LoginImplOutput();
        String userAccount = input.getUserAccount();
        String userPassword = input.getUserPassword();
        String userPhone = input.getUserPhone();
        User where = new User();
        if ("".equals(userAccount)){
            where.setUserPhone(userPhone);
        }else{
            where.setUserAccount(userAccount);
        }
        where.setUserPassword(userPassword);
        logger.info("userAccount:" + userAccount);
        logger.info("userPassword:" + userPassword);
        User user = userMapper.selectOne(where);
        System.out.println(user);
        if (user!=null){
            if (user.getUserPassword().equals(userPassword)){
                logger.info("密码正确");
                out.setCode("000000");
                out.setMsg("密码正确");
            }else{
                logger.info("密码错误");
                out.setCode("100001");
                out.setMsg("密码错误");
            }
        }else{
            out.setCode("100002");
            out.setMsg("无法查询到该用户信息");
        }
        logger.info("UserServiceImpl服务结束");
        return out;
    };
}
