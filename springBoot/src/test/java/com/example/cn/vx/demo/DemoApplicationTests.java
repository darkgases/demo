package com.example.cn.vx.demo;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@SpringBootTest
class DemoApplicationTests {

    @Autowired
    DataSource dataSource;

    @Test
    public void contextLoads() {

    }

}
