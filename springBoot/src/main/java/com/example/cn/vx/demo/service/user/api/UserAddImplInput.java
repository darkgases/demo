package com.example.cn.vx.demo.service.user.api;

import com.example.cn.vx.demo.common.until.CommonUtil;
import com.example.cn.vx.demo.common.ServiceCommonInput;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author: dengshuai
 * @Date: 2022/05/19 15:03
 */

@EqualsAndHashCode(callSuper = true)
@Data
public class UserAddImplInput extends ServiceCommonInput {
    /**
     * 用户注册类型
     **/
    private String signInType;
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
     * 更新时间
     **/
    private String updateTime;

    public UserAddImplInput(){
        String tranSeq = CommonUtil.getTranSeq();
        super.setTranSeq(tranSeq);
        super.setTranDate(tranSeq.substring(0,8));
        super.setTranTime(tranSeq.substring(8,14));
    }
}
