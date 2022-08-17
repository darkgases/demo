package com.example.cn.vx.demo.entity;

import java.io.Serializable;

public class PhotoInfo implements Serializable {
    private Integer photoId;

    private Integer albumId;

    private String photoShumbnailUrl;

    private String photoOriginalUrl;

    private Integer photoPraiseNum;

    private static final long serialVersionUID = 1L;

    public Integer getPhotoId() {
        return photoId;
    }

    public void setPhotoId(Integer photoId) {
        this.photoId = photoId;
    }

    public Integer getAlbumId() {
        return albumId;
    }

    public void setAlbumId(Integer albumId) {
        this.albumId = albumId;
    }

    public String getPhotoShumbnailUrl() {
        return photoShumbnailUrl;
    }

    public void setPhotoShumbnailUrl(String photoShumbnailUrl) {
        this.photoShumbnailUrl = photoShumbnailUrl == null ? null : photoShumbnailUrl.trim();
    }

    public String getPhotoOriginalUrl() {
        return photoOriginalUrl;
    }

    public void setPhotoOriginalUrl(String photoOriginalUrl) {
        this.photoOriginalUrl = photoOriginalUrl == null ? null : photoOriginalUrl.trim();
    }

    public Integer getPhotoPraiseNum() {
        return photoPraiseNum;
    }

    public void setPhotoPraiseNum(Integer photoPraiseNum) {
        this.photoPraiseNum = photoPraiseNum;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", photoId=").append(photoId);
        sb.append(", albumId=").append(albumId);
        sb.append(", photoShumbnailUrl=").append(photoShumbnailUrl);
        sb.append(", photoOriginalUrl=").append(photoOriginalUrl);
        sb.append(", photoPraiseNum=").append(photoPraiseNum);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}