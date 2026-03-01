package com.rain.mapper;
import com.rain.entity.SystemConfig;
import com.rain.util.JdbcUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
public class SystemConfigMapper {


    // 获取所有的配置信息
    public List<SystemConfig> getAllSystemConfig() throws SQLException {
        String sql = "select * from system_config";
        try (Connection conn = JdbcUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){
            //执行sql
            ResultSet rs = pstmt.executeQuery();
            //处理结果集
            ArrayList<SystemConfig> list = new ArrayList<>();
            while (rs.next()){
                Integer id = rs.getInt("id");
                String systemName = rs.getString("system_name");
                String carouselImages = rs.getString("carousel_images");
                Date createTime = rs.getDate("create_time");
                //封装成SystemConfig对象
                SystemConfig systemConfig = new SystemConfig();
                systemConfig.setId(id);
                systemConfig.setSystemName(systemName);
                systemConfig.setCarouselImages(carouselImages);
                systemConfig.setCreateTime(createTime);
                //存入集合
                list.add(systemConfig);
            }
            return list;
        }
    }

}