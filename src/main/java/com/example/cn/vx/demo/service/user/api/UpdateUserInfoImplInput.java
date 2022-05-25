package com.example.cn.vx.demo.service.user.api;

import com.example.cn.vx.demo.common.CommonUtil;
import com.example.cn.vx.demo.common.ServiceCommonInput;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author: dengshuai
 * @Date: 2022/05/23 16:16
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class UpdateUserInfoImplInput extends ServiceCommonInput {
    /**
     * 更新类型
     **/
    private String updateType;
    /**
     * 用户账号
     **/
    private String userAccount;
    /**
     * 用户旧手机号
     **/
    private String userPhone;
    /**
     * 用户手机号
     **/
    private String oldUserPhone;
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

    public UpdateUserInfoImplInput(){
        String tranSeq = CommonUtil.getTranSeq();
        super.setTranSeq(tranSeq);
        super.setTranDate(tranSeq.substring(0,8));
        super.setTranTime(tranSeq.substring(8,14));
    }
}

