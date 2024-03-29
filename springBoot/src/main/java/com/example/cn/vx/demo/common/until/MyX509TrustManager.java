package com.example.cn.vx.demo.common.until;


import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

import javax.net.ssl.X509TrustManager;

/**
* 类名: MyX509TrustManager </br>
* 包名： com.souvc.weixin.util
* 描述: 证书信任管理器（用于https请求）  </br>
* 开发人员：souvc  </br>
* 创建时间：  2015-12-1 </br>
* 发布版本：V1.0  </br>
 */
public class MyX509TrustManager implements X509TrustManager {

    @Override
    public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
    }

    @Override
    public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
    }

    @Override
    public X509Certificate[] getAcceptedIssuers() {
        return null;
    }
}
