package com.example.cn.vx.demo;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author: dengshuai
 * @Date: 2022/05/18 11:52
 */
@SpringBootTest
public class DruidTest {
    @Autowired
    DataSource dataSource;

    @Test
    public void contextLoads() throws SQLException {
        System.out.println("------------------------------");
        System.out.println(dataSource.getClass());
        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();// 创建SQL命令对象
        ResultSet rs = statement.executeQuery("select * from user_info");// 返回SQL语句查询结果集
        //循环输出结果集
        while (rs.next()) {
            //此处的列名需要和数据库中的列名相同
            System.out.println(rs.getString("user_Id"));
        }
        System.out.println(connection);
        connection.close();
    }
}
