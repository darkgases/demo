package com.example.cn.vx.demo.common.until;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Map;

/**
 * @author: dengshuai
 * @Date: 2022/05/18 11:24
 */
@Configuration
public class DruidConfig {

    //绑定yml文件,注入yml里面datasource的属性值，并且注入到spring容器
    @ConfigurationProperties(prefix = "spring.datasource")
    @Bean
    public DataSource druidDataSource(){
        return new DruidDataSource();
    }

    //后台监控页面，这里的写法是写死的，相当于web.xml，因为springboot内置了servlet容器，所以没有web.xml，因此替代方法为实现ServletRegistrationBean
    @Bean
    public ServletRegistrationBean a(){
        ServletRegistrationBean<StatViewServlet> bean = new ServletRegistrationBean<>(new StatViewServlet(), "/druid/*");
        //后台需要有人登陆，账号密码配置
        Map<String, String> initParameters = new HashMap<>();
        //增加配置
        initParameters.put("loginUsername","admin");//登陆的key是固定的loginUsername
        initParameters.put("loginPassword","123456");//登陆的key是固定的loginPassword
        //允许谁可以访问
        initParameters.put("allow","");//value为空则所有人都可以访问
        //不允许谁访问
        //initParameters.put("kuangshen","192.168.11.123");
        //设置初始化参数
        bean.setInitParameters(initParameters);
        return bean;
    }


    //filter
    @Bean
    public FilterRegistrationBean b(){
        FilterRegistrationBean bean = new FilterRegistrationBean();
        bean.setFilter(new WebStatFilter());
        //过滤那些请求？
        Map<String, String> initParameters = new HashMap<>();
        //这些东西不进行统计
        initParameters.put("exclusions","*,js,*.css,/druid/*");
        bean.setInitParameters(initParameters);
        return bean;
    }
}


