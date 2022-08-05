package com.example.cn.vx.demo.service.phone.api;

import com.example.cn.vx.demo.common.ServiceCommonInput;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author: dengshuai
 * @Date: 2022/08/04 15:51
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class AddAlbumInput extends ServiceCommonInput {
    public String albumName;
    public String albumDescribe;
}
