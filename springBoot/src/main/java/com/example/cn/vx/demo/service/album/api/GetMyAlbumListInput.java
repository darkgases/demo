package com.example.cn.vx.demo.service.album.api;

import com.example.cn.vx.demo.common.ServiceCommonInput;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author: dengshuai
 * @Date: 2022/08/17 16:22
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class GetMyAlbumListInput extends ServiceCommonInput {
    private String userId;
}
