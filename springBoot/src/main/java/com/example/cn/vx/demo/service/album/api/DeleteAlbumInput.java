package com.example.cn.vx.demo.service.album.api;

import com.example.cn.vx.demo.common.ServiceCommonInput;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author: dengshuai
 * @Date: 2022/08/16 17:02
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class DeleteAlbumInput extends ServiceCommonInput {
    public String userId;
    public String albumId;
}
