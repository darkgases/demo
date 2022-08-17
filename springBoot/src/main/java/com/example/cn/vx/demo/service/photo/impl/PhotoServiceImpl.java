package com.example.cn.vx.demo.service.photo.impl;

import com.example.cn.vx.demo.mapper.PhotoInfoMapper;
import com.example.cn.vx.demo.service.photo.PhotoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author: dengshuai
 * @Date: 2022/08/17 11:01
 */
@Transactional(rollbackFor = Exception.class)
@Service
public class PhotoServiceImpl implements PhotoService {

    @Autowired
    private PhotoInfoMapper photoInfoMapper;

    private static final Logger logger = LoggerFactory.getLogger(PhotoServiceImpl.class);
}
