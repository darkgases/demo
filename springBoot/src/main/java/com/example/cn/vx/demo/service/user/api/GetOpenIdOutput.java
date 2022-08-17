package com.example.cn.vx.demo.service.user.api;

import com.example.cn.vx.demo.common.ServiceCommonOutput;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author: dengshuai
 * @Date: 2022/06/01 15:36
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class GetOpenIdOutput extends ServiceCommonOutput {
    private String openId;
}
