package com.example.cn.vx.demo.service.album.api;

import com.example.cn.vx.demo.common.ServiceCommonOutput;
import com.example.cn.vx.demo.entity.AlbumInfoList;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * @author: dengshuai
 * @Date: 2022/08/17 16:22
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class GetMyAlbumListOutput extends ServiceCommonOutput {
    private List<AlbumInfoList> albumInfoList;
}
