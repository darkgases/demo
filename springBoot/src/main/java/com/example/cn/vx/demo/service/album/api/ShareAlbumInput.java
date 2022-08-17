package com.example.cn.vx.demo.service.album.api;

import com.example.cn.vx.demo.common.ServiceCommonInput;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author: dengshuai
 * @Date: 2022/08/17 9:31
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class ShareAlbumInput extends ServiceCommonInput {
    private String albumId;
    private String userId;
    private String shareUserId;
}
