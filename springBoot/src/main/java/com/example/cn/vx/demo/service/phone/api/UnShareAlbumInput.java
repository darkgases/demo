package com.example.cn.vx.demo.service.phone.api;

import com.example.cn.vx.demo.common.ServiceCommonInput;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author: dengshuai
 * @Date: 2022/08/17 9:41
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class UnShareAlbumInput extends ServiceCommonInput {
    private String albumId;
    private String userId;
    private String unShareUserId;
}
