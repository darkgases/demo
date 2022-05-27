package com.example.cn.vx.demo.mapper;

import com.example.cn.vx.demo.entity.TranList;
import java.util.List;

public interface TranListMapper {
    int deleteByPrimaryKey(Integer tranId);

    int insert(TranList record);

    TranList selectByPrimaryKey(Integer tranId);

    List<TranList> selectAll();

    int updateByPrimaryKey(TranList record);

    int updateByTranSeq(TranList record);
}
