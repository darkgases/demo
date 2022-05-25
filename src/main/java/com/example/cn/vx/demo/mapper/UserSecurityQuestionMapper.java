package com.example.cn.vx.demo.mapper;

import com.example.cn.vx.demo.entity.UserSecurityQuestion;
import java.util.List;

public interface UserSecurityQuestionMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(UserSecurityQuestion record);

    UserSecurityQuestion selectByPrimaryKey(Integer userId);

    List<UserSecurityQuestion> selectAll();

    int updateByPrimaryKey(UserSecurityQuestion record);
}