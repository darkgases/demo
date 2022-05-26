package com.example.cn.vx.demo.service.user.api;

import com.example.cn.vx.demo.common.until.CommonUtil;
import com.example.cn.vx.demo.common.ServiceCommonInput;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author: dengshuai
 * @Date: 2022/05/24 15:21
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class GetPublicKeyImplInput extends ServiceCommonInput {
    public GetPublicKeyImplInput(){
        String tranSeq = CommonUtil.getTranSeq();
        super.setTranSeq(tranSeq);
        super.setTranDate(tranSeq.substring(0,8));
        super.setTranTime(tranSeq.substring(8,14));
    }
}
