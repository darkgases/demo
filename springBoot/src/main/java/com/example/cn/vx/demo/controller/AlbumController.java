package com.example.cn.vx.demo.controller;

import com.example.cn.vx.demo.common.ReturnCode;
import com.example.cn.vx.demo.common.aop.MyLog;
import com.example.cn.vx.demo.service.album.AlbumService;
import com.example.cn.vx.demo.service.album.api.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import static com.example.cn.vx.demo.common.until.CommonUtil.checkNull;

/**
 * @author: dengshuai
 * @Date: 2022/08/04 15:17
 */
@RestController
public class AlbumController {
    @Autowired
    public AlbumService albumService;

    private static final Logger logger = LoggerFactory.getLogger(AlbumController.class);

    @MyLog(value = "新建相册")
    @RequestMapping("/addAlbum")
    public AddAlbumOutput addAlbum(@RequestBody MultiValueMap< String, String > values){
        logger.info("AlbumController:addAlbum开始");
        AddAlbumInput input = new AddAlbumInput();
        AddAlbumOutput output = new AddAlbumOutput();
        List<String> userId = values.get("userId");
        List<String> albumName = values.get("albumName");
        List<String> albumDescribe = values.get("albumDescribe");
        if (!checkNull(userId)){
            input.setUserId(userId.get(0));
        }else{
            output.setCode(ReturnCode.FAIL);
            output.setMsg("新建相册：用户ID不能为空");
            logger.info("AlbumController:addAlbum结束");
            return output;
        }
        if (!checkNull(albumName)){
            input.setAlbumName(albumName.get(0));
        }
        if (!checkNull(albumDescribe)){
            input.setAlbumDescribe(albumDescribe.get(0));
        }
        output = albumService.addAlbum(input);
        logger.info("AlbumController:addAlbum结束");
        return output;
    }

    @MyLog(value = "修改相册")
    @RequestMapping("/updateAlbum")
    public UpdateAlbumOutput updateAlbum(@RequestBody MultiValueMap< String, String > values){
        logger.info("AlbumController:updateAlbum开始");
        UpdateAlbumInput input = new UpdateAlbumInput();
        UpdateAlbumOutput output = new UpdateAlbumOutput();
        List<String> userId = values.get("userId");
        List<String> albumId = values.get("albumId");
        List<String> albumName = values.get("albumName");
        List<String> albumDescribe = values.get("albumDescribe");
        if (!checkNull(userId)){
            input.setUserId(userId.get(0));
        }else{
            output.setCode(ReturnCode.FAIL);
            output.setMsg("修改相册：用户ID不能为空");
            logger.info("AlbumController:updateAlbum结束");
            return output;
        }
        if (!checkNull(albumId)){
            input.setAlbumId(albumId.get(0));
        }else{
            output.setCode(ReturnCode.FAIL);
            output.setMsg("修改相册：相册ID不能为空");
            logger.info("AlbumController:updateAlbum结束");
            return output;
        }
        if (!checkNull(albumName)){
            input.setAlbumName(albumName.get(0));
        }
        if (!checkNull(albumDescribe)){
            input.setAlbumDescribe(albumDescribe.get(0));
        }
        output = albumService.updateAlbum(input);
        logger.info("AlbumController:updateAlbum结束");
        return output;
    }

    @MyLog(value = "删除相册")
    @RequestMapping("/deleteAlbum")
    public DeleteAlbumOutput deleteAlbum(@RequestBody MultiValueMap< String, String > values){
        logger.info("AlbumController:deleteAlbum开始");
        DeleteAlbumInput input = new DeleteAlbumInput();
        DeleteAlbumOutput output = new DeleteAlbumOutput();
        List<String> userId = values.get("userId");
        List<String> albumId = values.get("albumId");
        if (!checkNull(userId)){
            input.setUserId(userId.get(0));
        }else{
            output.setCode(ReturnCode.FAIL);
            output.setMsg("删除相册：用户ID不能为空");
            logger.info("AlbumController:deleteAlbum结束");
            return output;
        }
        if (!checkNull(albumId)){
            input.setAlbumId(albumId.get(0));
        }else{
            output.setCode(ReturnCode.FAIL);
            output.setMsg("删除相册：相册ID不能为空");
            logger.info("AlbumController:deleteAlbum结束");
            return output;
        }
        output = albumService.daleteAlbum(input);
        logger.info("AlbumController:updateAlbum结束");
        return output;
    }

    @MyLog(value = "对用户分享相册")
    @RequestMapping("/shareAlbum")
    public ShareAlbumOutput shareAlbum(@RequestBody MultiValueMap< String, String > values){
        logger.info("AlbumController:shareAlbum开始");
        ShareAlbumOutput output = new ShareAlbumOutput();
        ShareAlbumInput input = new ShareAlbumInput();
        List<String> userId = values.get("userId");
        List<String> albumId = values.get("albumId");
        List<String> shareUserId = values.get("shareUserId");
        if (!checkNull(userId)){
            input.setUserId(userId.get(0));
        }else{
            output.setCode(ReturnCode.FAIL);
            output.setMsg("分享相册：用户ID不能为空");
            logger.info("AlbumController:shareAlbum结束");
            return output;
        }
        if (!checkNull(albumId)){
            input.setAlbumId(albumId.get(0));
        }else{
            output.setCode(ReturnCode.FAIL);
            output.setMsg("分享相册：用户ID相册ID不能为空");
            logger.info("AlbumController:shareAlbum结束");
            return output;
        }
        if (!checkNull(shareUserId)){
            input.setShareUserId(shareUserId.get(0));
        }else{
            output.setCode(ReturnCode.FAIL);
            output.setMsg("分享相册：被分享用户ID不能为空");
            logger.info("AlbumController:shareAlbum结束");
            return output;
        }
        if (userId.get(0).equals(shareUserId.get(0))){
            output.setCode(ReturnCode.FAIL);
            output.setMsg("分享相册：无法对自己发起分享操作");
            logger.info("AlbumController:shareAlbum结束");
            return output;
        }
        output = albumService.shareAlbum(input);
        logger.info("AlbumController:shareAlbum结束");
        return output;
    }

    @MyLog(value = "取消对用户分享相册")
    @RequestMapping("/unShareAlbum")
    public UnShareAlbumOutput unShareAlbum(@RequestBody MultiValueMap< String, String > values){
        logger.info("AlbumController:unShareAlbum开始");
        UnShareAlbumOutput output = new UnShareAlbumOutput();
        UnShareAlbumInput input = new UnShareAlbumInput();
        List<String> userId = values.get("userId");
        List<String> albumId = values.get("albumId");
        List<String> unShareUserId = values.get("unShareUserId");
        if (!checkNull(userId)){
            input.setUserId(userId.get(0));
        }else{
            output.setCode(ReturnCode.FAIL);
            output.setMsg("取消对用户分享相册：用户ID不能为空");
            logger.info("AlbumController:unShareAlbum结束");
            return output;
        }
        if (!checkNull(albumId)){
            input.setAlbumId(albumId.get(0));
        }else{
            output.setCode(ReturnCode.FAIL);
            output.setMsg("取消对用户分享相册：用户ID相册ID不能为空");
            logger.info("AlbumController:unShareAlbum结束");
            return output;
        }
        if (!checkNull(unShareUserId)){
            input.setUnShareUserId(unShareUserId.get(0));
        }else{
            output.setCode(ReturnCode.FAIL);
            output.setMsg("取消对用户分享相册：被分享用户ID不能为空");
            logger.info("AlbumController:unShareAlbum结束");
            return output;
        }
        output = albumService.unShareAlbum(input);
        logger.info("AlbumController:unShareAlbum结束");
        return output;
    }

    @MyLog(value = "获取我的相册列表！")
    @RequestMapping("/getMyAlbumList")
    public GetMyAlbumListOutput getMyAlbumList(@RequestBody MultiValueMap< String, String > values) {
        logger.info("AlbumController:getMyAlbumList开始");
        GetMyAlbumListOutput output = new GetMyAlbumListOutput();
        GetMyAlbumListInput input = new GetMyAlbumListInput();
        List<String> userId = values.get("userId");
        if (!checkNull(userId)){
            input.setUserId(userId.get(0));
        }else{
            output.setCode(ReturnCode.FAIL);
            output.setMsg("获取我的相册列表：用户ID不能为空");
            logger.info("AlbumController:getMyAlbumList结束");
            return output;
        }
        output = albumService.getMyAlbumList(input);
        logger.info("AlbumController:getMyAlbumList结束");
        return output;
    }
}
