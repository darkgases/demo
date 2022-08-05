package com.example.cn.vx.demo.mapper;

import com.example.cn.vx.demo.entity.AlbumInfo;
import java.util.List;

public interface AlbumInfoMapper {
    int deleteByPrimaryKey(Integer albumId);

    int insert(AlbumInfo record);

    AlbumInfo selectByPrimaryKey(Integer albumId);

    List<AlbumInfo> selectAll();

    int updateByPrimaryKey(AlbumInfo record);

    AlbumInfo selectOne(AlbumInfo albumInfo);
}
