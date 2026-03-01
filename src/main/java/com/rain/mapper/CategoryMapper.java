package com.rain.mapper;

import com.rain.entity.Category;
import com.rain.util.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryMapper {
    // 加载所有的分类
    public List<Category> getCategoryList() throws SQLException {
        String sql = "select * from category";
        try(Connection conn = JdbcUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {
            //执行sql
            ResultSet rs = pstmt.executeQuery();
            // 构建一个集合用于存储所有的分类
            List<Category> categories = new ArrayList<>();
            while (rs.next()){
                Category category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                category.setDescription(rs.getString("description"));
                category.setCreateTime(rs.getDate("create_time"));
                //存入集合
                categories.add(category);
            }
            // 返回集合
            return categories;
        }
    }

}