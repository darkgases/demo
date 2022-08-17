package com.example.cn.vx.demo.service.album.api;

import com.example.cn.vx.demo.common.ServiceCommonInput;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author: dengshuai
 * @Date: 2022/08/05 17:53
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class UpdateAlbumInput extends ServiceCommonInput {
    public String userId;
    public String albumId;
    public String albumName;
    public String albumDescribe;
}
