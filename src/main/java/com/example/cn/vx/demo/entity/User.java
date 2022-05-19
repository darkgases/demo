package com.example.cn.vx.demo.entity;

import lombok.Data;

/**
 * @author: dengshuai
 * @Date: 2022/05/16 15:25
 */

@Data
public class User {
    /**
     * 用户id
     **/
    private int userId;
    /**
     * 用户账号
     **/
    private String userAccount;
    /**
     * 用户手机号
     **/
    private String userPhone;
    /**
     * 用户密码
     **/
    private String userPassword;
    /**
     * 用户姓名
     **/
    private String userName;
    /**
     * 用户年龄
     **/
    private String userAge;
    /**
     * 用户性别
     **/
    private String userSex;
    /**
     * 用户openid
     **/
    private String userOpenid;
    /**
     * 创建时间
     **/
    private String createTime;
    /**
     * 更新日期
     **/
    private String updateTime;

}
