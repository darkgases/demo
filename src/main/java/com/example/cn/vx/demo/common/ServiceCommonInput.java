package com.example.cn.vx.demo.common;

import lombok.Data;

/**
 * @author: dengshuai
 * @Date: 2022/05/17 15:56
 */
@Data
public class ServiceCommonInput {
    /**
     * 流水号
     */
    private String tranSeq;
    /**
     * 交易日期
     **/
    private String tranDate;
    /**
     * 交易时间
     **/
    private String tranTime;
    /**
     * 交易类型
     **/
    private String tranType;
    /**
     * 用户IP
     **/
    private String hostIp;
}
