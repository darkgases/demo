package com.example.cn.vx.demo.entity;

import java.io.Serializable;

public class UserAlbumInfo implements Serializable {
    private Integer userId;

    private String selfAlbumId;

    private String otherAlbumId;

    private static final long serialVersionUID = 1L;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getSelfAlbumId() {
        return selfAlbumId;
    }

    public void setSelfAlbumId(String selfAlbumId) {
        this.selfAlbumId = selfAlbumId == null ? null : selfAlbumId.trim();
    }

    public String getOtherAlbumId() {
        return otherAlbumId;
    }

    public void setOtherAlbumId(String otherAlbumId) {
        this.otherAlbumId = otherAlbumId == null ? null : otherAlbumId.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", userId=").append(userId);
        sb.append(", selfAlbumId=").append(selfAlbumId);
        sb.append(", otherAlbumId=").append(otherAlbumId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}