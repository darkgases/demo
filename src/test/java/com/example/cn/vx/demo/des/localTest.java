package com.example.cn.vx.demo.des;

import com.example.cn.vx.demo.common.des.RSACoder;
import org.junit.Test;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import java.io.IOException;
import java.util.ResourceBundle;

/**
 * @author: dengshuai
 * @Date: 2022/05/24 16:50
 */
public class localTest {
    private ResourceBundle rb = ResourceBundle.getBundle("customizeParam");

    @Test
    public void test() throws Exception {
        String publicKey = rb.getString("RSAPublicKey");
        String privateKey = rb.getString("RSAPrivateKey");
        String inputStr = "123456";
        byte[] data = inputStr.getBytes();
        byte[] encodedData = RSACoder.encryptByPublicKey(data, publicKey);
        //byte转String
        BASE64Encoder enc=new BASE64Encoder();
        String encrypt=enc.encode(encodedData);
        System.out.println("encrypt:"+encrypt);

        //String转byte
        BASE64Decoder dec=new BASE64Decoder();
        byte[] tranData = new byte[0];
        try {
            tranData = dec.decodeBuffer(encrypt);
        } catch (IOException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        byte[] decodedData = RSACoder.decryptByPrivateKey(tranData,
                privateKey);
        String decrypt=enc.encode(decodedData);
        System.out.println("decrypt:"+decrypt);
        String outputStr = new String(decodedData);
        System.out.println("outputStr:"+outputStr);
    }
}
