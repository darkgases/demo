package com.example.cn.vx.demo.service.user.api;

import com.example.cn.vx.demo.common.ServiceCommonOutput;
import com.example.cn.vx.demo.entity.UserInfo;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author: dengshuai
 * @Date: 2022/05/19 15:03
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class UserAddImplOutput extends ServiceCommonOutput {
    private UserInfo userInfo;
}
