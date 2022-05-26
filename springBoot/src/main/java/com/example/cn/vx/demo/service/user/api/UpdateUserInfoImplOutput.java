package com.example.cn.vx.demo.service.user.api;

import com.example.cn.vx.demo.common.ServiceCommonOutput;
import com.example.cn.vx.demo.entity.UserInfo;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author: dengshuai
 * @Date: 2022/05/23 16:16
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class UpdateUserInfoImplOutput extends ServiceCommonOutput {
    private UserInfo userInfo;
}
