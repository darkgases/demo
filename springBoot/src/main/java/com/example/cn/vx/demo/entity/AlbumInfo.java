package com.example.cn.vx.demo.entity;

import java.io.Serializable;

public class AlbumInfo implements Serializable {
    private Integer albumId;

    private String albumName;

    private String albumDescribe;

    private String createTime;

    private String updateTime;

    private String albumState;

    private static final long serialVersionUID = 1L;

    public Integer getAlbumId() {
        return albumId;
    }

    public void setAlbumId(Integer albumId) {
        this.albumId = albumId;
    }

    public String getAlbumName() {
        return albumName;
    }

    public void setAlbumName(String albumName) {
        this.albumName = albumName == null ? null : albumName.trim();
    }

    public String getAlbumDescribe() {
        return albumDescribe;
    }

    public void setAlbumDescribe(String albumDescribe) {
        this.albumDescribe = albumDescribe == null ? null : albumDescribe.trim();
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime == null ? null : createTime.trim();
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime == null ? null : updateTime.trim();
    }

    public String getAlbumState() {
        return albumState;
    }

    public void setAlbumState(String albumState) {
        this.albumState = albumState == null ? null : albumState.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", albumId=").append(albumId);
        sb.append(", albumName=").append(albumName);
        sb.append(", albumDescribe=").append(albumDescribe);
        sb.append(", createTime=").append(createTime);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", albumState=").append(albumState);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}