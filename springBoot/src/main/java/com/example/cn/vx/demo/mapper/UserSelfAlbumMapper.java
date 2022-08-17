package com.example.cn.vx.demo.mapper;

import com.example.cn.vx.demo.entity.UserSelfAlbum;

import java.util.HashMap;
import java.util.List;

public interface UserSelfAlbumMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserSelfAlbum record);

    UserSelfAlbum selectByPrimaryKey(Integer id);

    List<UserSelfAlbum> selectAll();

    int updateByPrimaryKey(UserSelfAlbum record);

    List<UserSelfAlbum> selectByParam(HashMap param);

    int deleteByParam(HashMap param);
}
