package com.example.cn.vx.demo.service.log.api;

import com.example.cn.vx.demo.common.CommonUtil;
import com.example.cn.vx.demo.common.ServiceCommonInput;

/**
 * @author: dengshuai
 * @Date: 2022/05/25 11:20
 */
public class SysLogImplInput extends ServiceCommonInput {
    public SysLogImplInput(){
        String tranSeq = CommonUtil.getTranSeq();
        super.setTranSeq(tranSeq);
        super.setTranDate(tranSeq.substring(0,8));
        super.setTranTime(tranSeq.substring(8,14));
    }
}
