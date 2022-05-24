package com.example.cn.vx.demo.common.enums;

/**
 * @author: dengshuai
 * @Date: 2022/05/23 12:01
 * @des: 用户状态
 */
public enum UserState {
    NORMAL ("1"),LOCK ("2"),CANCEL ("3");
    private final String userState;
    private UserState(String userState){
        this.userState = userState;
    }
    public String getUserState(){
        return userState;
    }
}
