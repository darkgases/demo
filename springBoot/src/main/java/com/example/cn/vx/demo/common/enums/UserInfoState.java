package com.example.cn.vx.demo.common.enums;

/**
 * @author: dengshuai
 * @Date: 2022/05/23 12:01
 * @des: 用户信息是否完整 FULL:完整 NO_FULL：不完整
 */
public enum UserInfoState {
    NO_FULL ("0"),FULL ("1");
    private final String infoState;
    private UserInfoState(String infoState){
        this.infoState = infoState;
    }
    public String getInfoState(){
        return infoState;
    }
}
