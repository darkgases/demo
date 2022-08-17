package com.example.cn.vx.demo.entity;

import java.io.Serializable;

public class UserOtherAlbum implements Serializable {
    private Integer id;

    private Integer userId;

    private Integer otherAlbumId;

    private Integer otherUserId;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getOtherAlbumId() {
        return otherAlbumId;
    }

    public void setOtherAlbumId(Integer otherAlbumId) {
        this.otherAlbumId = otherAlbumId;
    }

    public Integer getOtherUserId() {
        return otherUserId;
    }

    public void setOtherUserId(Integer otherUserId) {
        this.otherUserId = otherUserId;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", userId=").append(userId);
        sb.append(", otherAlbumId=").append(otherAlbumId);
        sb.append(", otherUserId=").append(otherUserId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}