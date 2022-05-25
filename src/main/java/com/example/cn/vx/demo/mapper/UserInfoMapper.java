package com.example.cn.vx.demo.mapper;

import com.example.cn.vx.demo.entity.UserInfo;
import java.util.List;

public interface UserInfoMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(UserInfo record);

    UserInfo selectByPrimaryKey(Integer userId);

    List<UserInfo> selectAll();

    int updateByPrimaryKey(UserInfo record);

    UserInfo selectOne(UserInfo info);
}
