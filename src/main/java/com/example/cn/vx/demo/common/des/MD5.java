package com.example.cn.vx.demo.common.des;

import java.security.MessageDigest;

import static com.example.cn.vx.demo.common.des.Coder.KEY_MD5;

/**
 * @author: dengshuai
 * @Date: 2022/05/24 11:00
 */
public class MD5 {
    /**
     * MD5加密
     * @param data
     * @return
     * @throws Exception
     * 通常我们不直接使用上述MD5加密。通常将MD5产生的字节数组交给BASE64再加密一把，得到相应的字符串。
     */
    public static byte[] encryptMD5(byte[] data) throws Exception {

        MessageDigest md5 = MessageDigest.getInstance(KEY_MD5);
        md5.update(data);

        return md5.digest();

    }
}
