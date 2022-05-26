package com.example.cn.vx.demo.service.log.impl;

import com.example.cn.vx.demo.entity.TranList;
import com.example.cn.vx.demo.mapper.TranListMapper;
import com.example.cn.vx.demo.service.log.api.SysLogImplInput;
import com.example.cn.vx.demo.service.log.SysLogService;
import com.example.cn.vx.demo.service.user.impl.UserServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author: dengshuai
 * @Date: 2022/05/25 11:17
 */
@Transactional(rollbackFor = Exception.class)
@Service
public class sysLogServiceImpl implements SysLogService {
    @Autowired
    private TranListMapper tranListMapper;

    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    @Override
    public void save(TranList input) {
        tranListMapper.insert(input);
    }
}
