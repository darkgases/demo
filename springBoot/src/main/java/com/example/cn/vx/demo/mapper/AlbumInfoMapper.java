package com.example.cn.vx.demo.mapper;

import com.example.cn.vx.demo.entity.AlbumInfo;
import com.example.cn.vx.demo.entity.AlbumInfoList;

import java.util.HashMap;
import java.util.List;

public interface AlbumInfoMapper {
    int deleteByPrimaryKey(Integer albumId);

    int insert(AlbumInfo record);

    AlbumInfo selectByPrimaryKey(Integer albumId);

    List<AlbumInfo> selectAll();

    int updateByPrimaryKey(AlbumInfo record);

    List<AlbumInfo> selectByParam(HashMap param);

    List<AlbumInfoList> selectUserOwnAlbumList(HashMap param);
}
