package com.rain.mapper;
import com.rain.entity.Cart;
import com.rain.util.JdbcUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class CartMapper {
    //添加购物车
    public void addToCart(Integer productId,Integer userId,Integer quantity) throws SQLException {
        String sql = "insert into cart(product_id,user_id,quantity,create_time) " +
                "values(?,?,?,now())";
        try(Connection conn = JdbcUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {
            //处理参数
            pstmt.setInt(1,productId);
            pstmt.setInt(2,userId);
            pstmt.setInt(3,quantity);
            //执行sql
            pstmt.executeUpdate();
        }
    }

    // 判断该商品是否被当前用户所添加
    public boolean idAddCart(Integer productId,Integer userId) throws SQLException {
        String sql = "select * from cart where product_id =  ? and user_id = ?";
        try(Connection conn = JdbcUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {
            //处理参数
            pstmt.setInt(1,productId);
            pstmt.setInt(2,userId);
            //执行sql
            ResultSet rs = pstmt.executeQuery();
            return rs.next();
        }
    }

    // 修改购物车中数量
    public void updateCartQuantity(Integer productId,Integer userId,Integer quantity) throws SQLException {
        String sql = "update cart set quantity = quantity + ? " +
                "where product_id = ? and user_id = ?";
        try(Connection conn = JdbcUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {
            //处理参数
            pstmt.setInt(1,quantity);
            pstmt.setInt(2,productId);
            pstmt.setInt(3,userId);
            //执行sql
            pstmt.executeUpdate();
        }
    }

//根据id来删除购物车数据
    public void deleteById(Integer id,Connection conn) throws SQLException {
        String sql = "delete from cart where id = ?";
        try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
            //处理参数
            pstmt.setLong(1,id);
            //执行sql
            pstmt.executeUpdate();
        }
    }
}