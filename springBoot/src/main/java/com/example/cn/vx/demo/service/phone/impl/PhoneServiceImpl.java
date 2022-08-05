package com.example.cn.vx.demo.service.phone.impl;

import com.example.cn.vx.demo.common.ReturnCode;
import com.example.cn.vx.demo.common.ReturnMsg;
import com.example.cn.vx.demo.entity.AlbumInfo;
import com.example.cn.vx.demo.entity.PhoneInfo;
import com.example.cn.vx.demo.mapper.AlbumInfoMapper;
import com.example.cn.vx.demo.mapper.PhoneInfoMapper;
import com.example.cn.vx.demo.service.phone.PhoneService;
import com.example.cn.vx.demo.service.phone.api.AddAlbumInput;
import com.example.cn.vx.demo.service.phone.api.AddAlbumOutput;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author: dengshuai
 * @Date: 2022/08/04 15:22
 */
@Transactional(rollbackFor = Exception.class)
@Service
public class PhoneServiceImpl implements PhoneService {
    @Autowired
    private PhoneInfoMapper phoneInfoMapper;

    @Autowired
    private AlbumInfoMapper albumInfoMapper;

    private static final Logger logger = LoggerFactory.getLogger(PhoneServiceImpl.class);

    @Override
    public AddAlbumOutput addAlbum(AddAlbumInput input) {
        logger.info("PhoneServiceImpl-addAlbum服务开始");
        AddAlbumOutput output = new AddAlbumOutput();
        AlbumInfo albumInfo = new AlbumInfo();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date now = new Date();
        albumInfo.setAlbumName(input.getAlbumName());
        albumInfo.setAlbumDescribe(input.getAlbumDescribe());
        albumInfo.setCreateTime(sdf.format(now));
        albumInfo.setUpdateTime(sdf.format(now));
        albumInfoMapper.insert(albumInfo);
        output.setCode(ReturnCode.SUCCESS);
        output.setMsg(ReturnMsg.SUCCESS);
        logger.info("PhoneServiceImpl-addAlbum服务结束");
        return output;
    }
}
