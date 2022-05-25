package com.example.cn.vx.demo.mapper;

import com.example.cn.vx.demo.entity.SecurityQuestion;
import java.util.List;

public interface SecurityQuestionMapper {
    int deleteByPrimaryKey(Integer questionId);

    int insert(SecurityQuestion record);

    SecurityQuestion selectByPrimaryKey(Integer questionId);

    List<SecurityQuestion> selectAll();

    int updateByPrimaryKey(SecurityQuestion record);
}