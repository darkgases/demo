package com.example.cn.vx.demo.service.user.api;

import com.example.cn.vx.demo.common.ServiceCommonOutput;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author: dengshuai
 * @Date: 2022/05/24 15:21
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class GetPublicKeyImplOutput extends ServiceCommonOutput {
    private String publicKey;
}
