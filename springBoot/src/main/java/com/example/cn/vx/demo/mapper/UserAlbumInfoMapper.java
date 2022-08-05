package com.example.cn.vx.demo.mapper;

import com.example.cn.vx.demo.entity.UserAlbumInfo;
import java.util.List;

public interface UserAlbumInfoMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(UserAlbumInfo record);

    UserAlbumInfo selectByPrimaryKey(Integer userId);

    List<UserAlbumInfo> selectAll();

    int updateByPrimaryKey(UserAlbumInfo record);
}