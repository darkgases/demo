package com.example.cn.vx.demo.common;

import lombok.Data;

/**
 * @author: dengshuai
 * @Date: 2022/05/17 15:50
 */
@Data
public class ServiceCommonOutput {
//    /**
//     * 交易流水号
//     */
//    private String tranSeq;
    /**
     * 返回码
     */
    private String code;
    /**
     * 返回信息
     */
    private String msg;
}
