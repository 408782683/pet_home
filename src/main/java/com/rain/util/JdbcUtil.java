package com.rain.util;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

//获取配置文件，建立链接
public class JdbcUtil {
    private static DataSource ds;
    static {
        InputStream is = JdbcUtil.class.getClassLoader()
                .getResourceAsStream("druid.properties");
        Properties prop = new Properties();
        //properties是一个特殊的map集合
        try {
            prop.load(is);
            ds = DruidDataSourceFactory.createDataSource(prop);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static Connection getConnection() throws SQLException {
        return ds.getConnection();
    }
}
