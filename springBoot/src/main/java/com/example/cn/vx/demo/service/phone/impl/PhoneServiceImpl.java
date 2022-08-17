package com.example.cn.vx.demo.service.phone.impl;

import com.example.cn.vx.demo.common.ReturnCode;
import com.example.cn.vx.demo.common.ReturnMsg;
import com.example.cn.vx.demo.entity.AlbumInfo;
import com.example.cn.vx.demo.entity.UserAlbumInfo;
import com.example.cn.vx.demo.entity.UserOtherAlbum;
import com.example.cn.vx.demo.entity.UserSelfAlbum;
import com.example.cn.vx.demo.mapper.*;
import com.example.cn.vx.demo.service.phone.PhoneService;
import com.example.cn.vx.demo.service.phone.api.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * @author: dengshuai
 * @Date: 2022/08/04 15:22
 */
@Transactional(rollbackFor = Exception.class)
@Service
public class PhoneServiceImpl implements PhoneService {
    @Autowired
    private PhoneInfoMapper phoneInfoMapper;

    @Autowired
    private AlbumInfoMapper albumInfoMapper;

//    @Autowired
//    private UserAlbumInfoMapper userAlbumInfoMapper;

    @Autowired
    private UserSelfAlbumMapper userSelfAlbumMapper;

    @Autowired
    private UserOtherAlbumMapper userOtherAlbumMapper;

    private static final Logger logger = LoggerFactory.getLogger(PhoneServiceImpl.class);

    @Override
    public AddAlbumOutput addAlbum(AddAlbumInput input) {
        logger.info("PhoneServiceImpl-addAlbum服务开始");
        AddAlbumOutput output = new AddAlbumOutput();
        AlbumInfo albumInfo = new AlbumInfo();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date now = new Date();
        albumInfo.setAlbumName(input.getAlbumName());
        albumInfo.setAlbumDescribe(input.getAlbumDescribe());
        albumInfo.setCreateTime(sdf.format(now));
        albumInfo.setUpdateTime(sdf.format(now));
//        AlbumState 0正常 1停用
        albumInfo.setAlbumState("0");
        int returnAlbumInfoRow = albumInfoMapper.insert(albumInfo);
        if (returnAlbumInfoRow != 0){
            UserSelfAlbum userSelfAlbum = new UserSelfAlbum();
            userSelfAlbum.setUserId(Integer.valueOf(input.getUserId()));
            userSelfAlbum.setAlbumId(albumInfo.getAlbumId());
            userSelfAlbumMapper.insert(userSelfAlbum);
            output.setCode(ReturnCode.SUCCESS);
            output.setMsg(ReturnMsg.SUCCESS);
        }else{
            output.setCode(ReturnCode.CREATE_ALBUM_FAIL);
            output.setMsg(ReturnMsg.CREATE_ALBUM_FAIL);
        }
        logger.info("PhoneServiceImpl-addAlbum服务结束");
        return output;
    }

    @Override
    public UpdateAlbumOutput updateAlbum(UpdateAlbumInput input){
        logger.info("PhoneServiceImpl-updateAlbum服务开始");
        UpdateAlbumOutput out = new UpdateAlbumOutput();
        HashMap param = new HashMap();
        param.put("userId",input.getUserId());
        param.put("albumId",input.getAlbumId());
        List<UserSelfAlbum> userAlbumInfo = userSelfAlbumMapper.selectByParam(param);
        if (userAlbumInfo.size() == 0){
            out.setCode(ReturnCode.THE_ALBUM_NOT_BELONG_TO_THIS_USER);
            out.setMsg(ReturnMsg.THE_ALBUM_NOT_BELONG_TO_THIS_USER);
        }else{
            AlbumInfo albumInfo = new AlbumInfo();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date now = new Date();
            albumInfo = albumInfoMapper.selectByPrimaryKey(Integer.valueOf(input.getAlbumId()));
            if (albumInfo != null){
                String albumName = input.getAlbumName();
                String albumDescribe = input.getAlbumDescribe();
                if (albumName != null && albumName != ""){
                    albumInfo.setAlbumName(albumName);
                }
                if (albumDescribe != null && albumDescribe != ""){
                    albumInfo.setAlbumDescribe(albumDescribe);
                }
                albumInfo.setUpdateTime(sdf.format(now));
                albumInfoMapper.updateByPrimaryKey(albumInfo);
                out.setCode(ReturnCode.SUCCESS);
                out.setMsg(ReturnMsg.SUCCESS);
            }else{
                out.setCode(ReturnCode.THE_ALBUM_IS_NOT_EXIST);
                out.setMsg(ReturnMsg.THE_ALBUM_IS_NOT_EXIST);
            }
        }


        logger.info("PhoneServiceImpl-updateAlbum服务结束");
        return out;
    }

    @Override
    public DeleteAlbumOutput daleteAlbum(DeleteAlbumInput input){
        logger.info("PhoneServiceImpl-daleteAlbum服务开始");
        DeleteAlbumOutput out = new DeleteAlbumOutput();
        HashMap param = new HashMap();
        param.put("userId",input.getUserId());
        param.put("albumId",input.getAlbumId());
        List<UserSelfAlbum> userAlbumInfo = userSelfAlbumMapper.selectByParam(param);
        if (userAlbumInfo.size() == 0){
            out.setCode(ReturnCode.THE_ALBUM_NOT_BELONG_TO_THIS_USER);
            out.setMsg(ReturnMsg.THE_ALBUM_NOT_BELONG_TO_THIS_USER);
        }else{
            HashMap otherParam = new HashMap();
            for (int i=0;i<userAlbumInfo.size();i++){
                userSelfAlbumMapper.deleteByPrimaryKey(userAlbumInfo.get(i).getId());
                otherParam.put("otherAlbumId",userAlbumInfo.get(i).getAlbumId());
                userOtherAlbumMapper.deleteByParam(otherParam);
            }
            out.setCode(ReturnCode.SUCCESS);
            out.setMsg(ReturnMsg.SUCCESS);
        }
        logger.info("PhoneServiceImpl-daleteAlbum服务结束");
        return out;
    }

    @Override
    public ShareAlbumOutput shareAlbum(ShareAlbumInput input){
        logger.info("PhoneServiceImpl-shareAlbum服务开始");
        ShareAlbumOutput out = new ShareAlbumOutput();
        HashMap param = new HashMap();
        param.put("userId",input.getUserId());
        param.put("albumId",input.getAlbumId());
        List<UserSelfAlbum> userAlbumInfo = userSelfAlbumMapper.selectByParam(param);
        if (userAlbumInfo.size() == 0){
            out.setCode(ReturnCode.THE_ALBUM_NOT_BELONG_TO_THIS_USER);
            out.setMsg(ReturnMsg.THE_ALBUM_NOT_BELONG_TO_THIS_USER);
        }else{
            UserOtherAlbum shareAlbum = new UserOtherAlbum();
            shareAlbum.setUserId(Integer.valueOf(input.getUserId()));
            shareAlbum.setOtherAlbumId(Integer.valueOf(input.getAlbumId()));
            shareAlbum.setOtherUserId(Integer.valueOf(input.getShareUserId()));
            int returnId = userOtherAlbumMapper.insert(shareAlbum);
            if (returnId > 0){
                out.setCode(ReturnCode.SUCCESS);
                out.setMsg(ReturnMsg.SUCCESS);
            }else{
                out.setCode(ReturnCode.FAIL);
                out.setMsg(ReturnMsg.FAIL);
            }

        }
        logger.info("PhoneServiceImpl-shareAlbum服务结束");
        return out;
    }

    @Override
    public UnShareAlbumOutput unShareAlbum(UnShareAlbumInput input){
        logger.info("PhoneServiceImpl-unShareAlbum服务开始");
        UnShareAlbumOutput out = new UnShareAlbumOutput();
        HashMap param = new HashMap();
        param.put("userId",input.getUserId());
        param.put("albumId",input.getAlbumId());
        List<UserSelfAlbum> userAlbumInfo = userSelfAlbumMapper.selectByParam(param);
        if (userAlbumInfo.size() == 0){
            out.setCode(ReturnCode.THE_ALBUM_NOT_BELONG_TO_THIS_USER);
            out.setMsg(ReturnMsg.THE_ALBUM_NOT_BELONG_TO_THIS_USER);
        }else{
            HashMap unShareParam = new HashMap();
            unShareParam.put("userId",Integer.valueOf(input.getUserId()));
            unShareParam.put("otherAlbumId",Integer.valueOf(input.getAlbumId()));
            unShareParam.put("otherUserId",Integer.valueOf(input.getUnShareUserId()));
            List<UserOtherAlbum> userOtherAlbumList = userOtherAlbumMapper.selectByParam(unShareParam);
            if (userOtherAlbumList.size() > 0){
                for (int i=0;i<userOtherAlbumList.size();i++){
                    userOtherAlbumMapper.deleteByPrimaryKey(userOtherAlbumList.get(i).getId());
                }
            }
        }
        out.setCode(ReturnCode.SUCCESS);
        out.setMsg(ReturnMsg.SUCCESS);
        logger.info("PhoneServiceImpl-unShareAlbum服务结束");
        return out;
    }
}
