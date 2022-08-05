package com.example.cn.vx.demo.mapper;

import com.example.cn.vx.demo.entity.PhoneInfo;
import java.util.List;

public interface PhoneInfoMapper {
    int deleteByPrimaryKey(Integer phoneId);

    int insert(PhoneInfo record);

    PhoneInfo selectByPrimaryKey(Integer phoneId);

    List<PhoneInfo> selectAll();

    int updateByPrimaryKey(PhoneInfo record);
}