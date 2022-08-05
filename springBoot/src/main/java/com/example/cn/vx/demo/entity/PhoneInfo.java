package com.example.cn.vx.demo.entity;

import java.io.Serializable;

public class PhoneInfo implements Serializable {
    private Integer phoneId;

    private Integer albumId;

    private String phoneShumbnailUrl;

    private String phoneOriginalUrl;

    private Integer phonePraiseNum;

    private static final long serialVersionUID = 1L;

    public Integer getPhoneId() {
        return phoneId;
    }

    public void setPhoneId(Integer phoneId) {
        this.phoneId = phoneId;
    }

    public Integer getAlbumId() {
        return albumId;
    }

    public void setAlbumId(Integer albumId) {
        this.albumId = albumId;
    }

    public String getPhoneShumbnailUrl() {
        return phoneShumbnailUrl;
    }

    public void setPhoneShumbnailUrl(String phoneShumbnailUrl) {
        this.phoneShumbnailUrl = phoneShumbnailUrl == null ? null : phoneShumbnailUrl.trim();
    }

    public String getPhoneOriginalUrl() {
        return phoneOriginalUrl;
    }

    public void setPhoneOriginalUrl(String phoneOriginalUrl) {
        this.phoneOriginalUrl = phoneOriginalUrl == null ? null : phoneOriginalUrl.trim();
    }

    public Integer getPhonePraiseNum() {
        return phonePraiseNum;
    }

    public void setPhonePraiseNum(Integer phonePraiseNum) {
        this.phonePraiseNum = phonePraiseNum;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", phoneId=").append(phoneId);
        sb.append(", albumId=").append(albumId);
        sb.append(", phoneShumbnailUrl=").append(phoneShumbnailUrl);
        sb.append(", phoneOriginalUrl=").append(phoneOriginalUrl);
        sb.append(", phonePraiseNum=").append(phonePraiseNum);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}