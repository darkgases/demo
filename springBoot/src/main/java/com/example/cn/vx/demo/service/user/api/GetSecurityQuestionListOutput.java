package com.example.cn.vx.demo.service.user.api;

import com.example.cn.vx.demo.common.ServiceCommonOutput;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * @author: dengshuai
 * @Date: 2022/05/30 15:01
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class GetSecurityQuestionListOutput extends ServiceCommonOutput {
    private List securityQuestionList;
}
