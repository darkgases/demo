package com.example.cn.vx.demo.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * @author: dengshuai
 * @Date: 2022/08/17 16:48
 */
@Data
public class AlbumInfoList implements Serializable {

    private Integer userId;

    private Integer albumId;

    private String albumName;

    private String albumDescribe;

    private String createTime;

    private String updateTime;

    private String albumState;
}
