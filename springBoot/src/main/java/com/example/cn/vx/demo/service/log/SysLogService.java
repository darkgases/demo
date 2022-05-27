package com.example.cn.vx.demo.service.log;

import com.example.cn.vx.demo.entity.TranList;
import com.example.cn.vx.demo.service.log.api.SysLogImplInput;

/**
 * @author: dengshuai
 * @Date: 2022/05/25 11:16
 */
public interface SysLogService {
    /**
     * 插入日志信息
     */
    void save(TranList input);
    /**
    * 根据tranSeq更新返回信息、更新时间
    */
    void update(TranList input);
}
