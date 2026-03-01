package com.rain.mapper;

import com.rain.entity.Product;
import com.rain.util.JdbcUtil;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductMapper {
    // 加载所有的商品列表
    public List<Product> getProductList() throws SQLException {
        String sql = "select * from product";
        try(Connection conn = JdbcUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {
            //执行sql
            ResultSet rs = pstmt.executeQuery();
            // 创建一个集合来存储商品
            List<Product> products = new ArrayList<>();
            while (rs.next()){
                // 创建一个Product对象
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setImages(rs.getString("images"));
                product.setName(rs.getString("name"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setDescription(rs.getString("description"));
                product.setBrand(rs.getString("brand"));
                product.setPetType(rs.getString("pet_type"));
                product.setPrice(rs.getBigDecimal("price"));
                product.setStatus(rs.getString("status"));
                product.setCreateTime(rs.getDate("create_time"));
                //存入集合
                products.add(product);
            }
            // 返回集合
            return products;
        }

    }


    // 分页查询商品列表的时候商品的数量
    public Integer getProductCount(String name, String brand,
                                   BigDecimal minPrice,BigDecimal maxPrice,
                                   Integer categoryId,String petType) throws SQLException {
        // 编写一个sql语句来实现动态的拼接
        String sql = "select count(*) num from product where 1=1 ";
        // 创建一个集合用于存储我们的参数列表
        List<Object> params = new ArrayList<>();
        if(name!=null){
            sql+= " and name like ?";
            params.add("%"+name+"%");
        }
        if(brand!=null){
            sql+= " and brand = ?";
            params.add(brand);
        }
        if(minPrice!=null){
            sql+= " and price >= ?";
            params.add(minPrice);
        }
        if(maxPrice!=null){
            sql+= " and price <= ?";
            params.add(maxPrice);
        }
        if(categoryId!=0){
            sql+=" and category_id = ?";
            params.add(categoryId);
        }
        if(petType!=null){
            sql+=" and pet_type=?";
            params.add(petType);
        }
        try(Connection conn = JdbcUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {
            //处理参数
            for (int i = 0; i < params.size(); i++) {
                pstmt.setObject(i+1,params.get(i));
            }
            //执行sql
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                return rs.getInt("num");
            }else{
                return 0;
            }
        }
    }

    // 分页查询商品的列表数据
    public List<Product> getProductByPage(Integer pageNum, Integer pageSize,
                                          String name, String brand,
                                          BigDecimal minPrice, BigDecimal maxPrice,
                                          Integer categoryId, String petType) throws SQLException {
        //构建动态sql语句
        String sql = "select * from product where 1=1 ";
        //构建集合来存储参数列表
        List<Object> params = new ArrayList<>();
        if(name!=null){
            sql+= " and name like ?";
            params.add("%"+name+"%");
        }
        if(brand!=null){
            sql+= " and brand = ?";
            params.add(brand);
        }
        if(minPrice!=null){
            sql+= " and price >= ?";
            params.add(minPrice);
        }
        if(maxPrice!=null){
            sql+= " and price <= ?";
            params.add(maxPrice);
        }
        if(categoryId!=0){
            sql+=" and category_id = ?";
            params.add(categoryId);
        }
        if(petType!=null){
            sql+=" and pet_type=?";
            params.add(petType);
        }
        // limit分页sql处理
        sql+= " limit ? ,?";
        params.add((pageNum-1)*pageSize);
        params.add(pageSize);
        try(Connection conn = JdbcUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {
            // 处理参数
            for (int i = 0; i < params.size(); i++) {
                pstmt.setObject(i+1,params.get(i));
            }
            //执行sql
            ResultSet rs = pstmt.executeQuery();
            //创建一个list集合用户返回的结果
            List<Product> products = new ArrayList<>();
            while (rs.next()){
                // 创建一个Product对象
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setImages(rs.getString("images"));
                product.setName(rs.getString("name"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setDescription(rs.getString("description"));
                product.setBrand(rs.getString("brand"));
                product.setPetType(rs.getString("pet_type"));
                product.setPrice(rs.getBigDecimal("price"));
                product.setStatus(rs.getString("status"));
                product.setCreateTime(rs.getDate("create_time"));
                //存入集合
                products.add(product);
            }
            //返回集合
            return products;
        }
    }
    //根据商品id查询商品详情
    public Product findById(Integer id) throws SQLException {
        String sql = "select * from product where id = ?";
        try(Connection conn = JdbcUtil.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1,id);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setImages(rs.getString("images"));
                product.setName(rs.getString("name"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setDescription(rs.getString("description"));
                product.setBrand(rs.getString("brand"));
                product.setPetType(rs.getString("pet_type"));
                product.setPrice(rs.getBigDecimal("price"));
                product.setStatus(rs.getString("status"));
                product.setCreateTime(rs.getDate("create_time"));
                return product;
            }
            return null;
        }
    }

}