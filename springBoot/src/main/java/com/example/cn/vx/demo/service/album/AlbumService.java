package com.example.cn.vx.demo.service.album;

import com.example.cn.vx.demo.service.album.api.*;

/**
 * @author: dengshuai
 * @Date: 2022/08/04 15:21
 */
public interface AlbumService {
    /**
     * @param input
     * @return
     * @ps:新建相册
     */
    AddAlbumOutput addAlbum(AddAlbumInput input);

    /**
     * @param input
     * @return
     * @ps:修改相册
     */
    UpdateAlbumOutput updateAlbum(UpdateAlbumInput input);

    /**
     * @param input
     * @return
     * @ps:删除相册
     */
    DeleteAlbumOutput daleteAlbum(DeleteAlbumInput input);

    /**
     * @param input
     * @return
     * @ps:对用户分享相册
     */
    ShareAlbumOutput shareAlbum(ShareAlbumInput input);

    /**
     * @param input
     * @return
     * @ps:取消对用户分享相册
     */
    UnShareAlbumOutput unShareAlbum(UnShareAlbumInput input);

    /**
     * @param input
     * @return
     * @ps:获取我的相册列表
     */
    GetMyAlbumListOutput getMyAlbumList(GetMyAlbumListInput input);





}
