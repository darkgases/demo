package com.example.cn.vx.demo.service.user.api;

import com.example.cn.vx.demo.common.until.CommonUtil;
import com.example.cn.vx.demo.common.ServiceCommonInput;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author: dengshuai
 * @Date: 2022/05/17 16:08
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class LoginImplInput extends ServiceCommonInput {
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

    public LoginImplInput(){
        String tranSeq = CommonUtil.getTranSeq();
        super.setTranSeq(tranSeq);
        super.setTranDate(tranSeq.substring(0,8));
        super.setTranTime(tranSeq.substring(8,14));
    }
}
