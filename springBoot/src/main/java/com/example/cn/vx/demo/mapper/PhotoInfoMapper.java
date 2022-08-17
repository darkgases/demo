package com.example.cn.vx.demo.mapper;

import com.example.cn.vx.demo.entity.PhotoInfo;
import java.util.List;

public interface PhotoInfoMapper {
    int deleteByPrimaryKey(Integer photoId);

    int insert(PhotoInfo record);

    PhotoInfo selectByPrimaryKey(Integer photoId);

    List<PhotoInfo> selectAll();

    int updateByPrimaryKey(PhotoInfo record);
}