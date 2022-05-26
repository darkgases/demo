package com.example.cn.vx.demo.common.until;

import org.apache.commons.lang3.time.DateUtils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author: dengshuai
 * @Date: 2022/05/25 15:17
 */
public class CommonUtil {
    //获取流水号
    public static String getTranSeq() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssms");
        Date now = new Date();
        String dateString = sdf.format(now);
        int random = (int) ((Math.random()*9+1)*100000);
        return dateString.concat(String.valueOf(random));
    }

}
