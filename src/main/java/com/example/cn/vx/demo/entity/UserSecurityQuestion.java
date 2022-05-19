package com.example.cn.vx.demo.entity;

import lombok.Data;

/**
 * @author: dengshuai
 * @Date: 2022/05/16 16:20
 */
@Data
public class UserSecurityQuestion {
    /**
     * 用户id
     **/
    private int userId;
    /**
     * 用户密保问题id
     **/
    private int questionId;
    /**
     * 用户密保答案
     **/
    private String answer;
    /**
     * 创建时间
     **/
    private String createTime;
    /**
     * 更新日期
     **/
    private String updateTime;
}
