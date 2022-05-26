package com.example.cn.vx.demo.des;

import com.example.cn.vx.demo.common.des.RSACoder;
import org.junit.Test;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
        String outputStrR = new String(encodedData);
        System.out.println("outputStr:"+outputStrR);

        //String转byte
        BASE64Decoder dec=new BASE64Decoder();
        byte[] tranData = new byte[0];
        try {
            tranData = dec.decodeBuffer(encrypt);
        } catch (IOException e1) {
            e1.printStackTrace();
        }
        byte[] decodedData = RSACoder.decryptByPrivateKey(tranData,
                privateKey);
        String decrypt=enc.encode(decodedData);
        System.out.println("decrypt:"+decrypt);
        String outputStr = new String(decodedData);
        System.out.println("outputStr:"+outputStr);
    }
    @Test
    public void  getTranSeq() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssms");
        Date now = new Date();
        String dateString = sdf.format(now);
        int random = (int) ((Math.random()*9+1)*100000);
        String txnSeq = dateString.concat(String.valueOf(random));
        System.out.println(txnSeq.substring(0,8));
        System.out.println(txnSeq.substring(8,14));
        System.out.println(txnSeq);
    }
}
