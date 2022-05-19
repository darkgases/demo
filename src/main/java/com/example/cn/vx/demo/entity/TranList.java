package com.example.cn.vx.demo.entity;

import lombok.Data;

/**
 * @author: dengshuai
 * @Date: 2022/05/16 17:25
 */
@Data
public class TranList {
    /**
     * 交易流水id
     */
    private int tranListId;
    /**
     * 用户id
     **/
    private int userId;
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
     * 交易流水
     **/
    private String tranSeq;
    /**
     * 交易回执码
     **/
    private String hostCode;
    /**
     * 交易回执信息
     **/
    private String hostMsg;
    /**
     * 用户IP
     **/
    private String hostIp;
    /**
     * 创建时间
     **/
    private String createTime;
    /**
     * 更新日期
     **/
    private String updateTime;

}
