package com.example.cn.vx.demo.common.des;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 * @author: dengshuai
 * @Date: 2022/05/24 11:00
 */
public class Base64 {
    /**
     * BASE64解密
     *
     * @param key
     * @return
     * @throws Exception
     * 主要就是BASE64Encoder、BASE64Decoder两个类，我们只需要知道使用对应的方法即可。另，BASE加密后产生的字节位数是8的倍数，如果不够位数以=符号填充
     */
    public static byte[] decryptBASE64(String key) throws Exception {
        return (new BASE64Decoder()).decodeBuffer(key);
    }

    /**
     * BASE64加密
     *
     * @param key
     * @return
     * @throws Exception
     */
    public static String encryptBASE64(byte[] key) throws Exception {
        return (new BASE64Encoder()).encodeBuffer(key);
    }
}
