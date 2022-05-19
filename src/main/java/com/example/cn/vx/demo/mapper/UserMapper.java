package com.example.cn.vx.demo.mapper;

import com.example.cn.vx.demo.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author: dengshuai
 * @Date: 2022/05/16 17:39
 */
@Mapper
public interface UserMapper {
    User selectOne(User where);

}
