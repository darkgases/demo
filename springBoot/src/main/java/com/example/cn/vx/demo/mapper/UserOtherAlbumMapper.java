package com.example.cn.vx.demo.mapper;

import com.example.cn.vx.demo.entity.UserOtherAlbum;

import java.util.HashMap;
import java.util.List;

public interface UserOtherAlbumMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserOtherAlbum record);

    UserOtherAlbum selectByPrimaryKey(Integer id);

    List<UserOtherAlbum> selectAll();

    int updateByPrimaryKey(UserOtherAlbum record);

    List<UserOtherAlbum> selectByParam(HashMap param);

    int deleteByParam(HashMap param);
}
