package com.example.cn.vx.demo.service.log;

import com.example.cn.vx.demo.entity.TranList;
import com.example.cn.vx.demo.service.log.api.SysLogImplInput;

/**
 * @author: dengshuai
 * @Date: 2022/05/25 11:16
 */
public interface SysLogService {
    void save(TranList input);
}
