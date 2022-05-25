package com.example.cn.vx.demo.mapper;

import com.example.cn.vx.demo.entity.UserRole;
import java.util.List;

public interface UserRoleMapper {
    int deleteByPrimaryKey(Integer userRoleId);

    int insert(UserRole record);

    UserRole selectByPrimaryKey(Integer userRoleId);

    List<UserRole> selectAll();

    int updateByPrimaryKey(UserRole record);
}