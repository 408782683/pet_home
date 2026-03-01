package com.rain.mapper;
import com.rain.entity.Review;
import com.rain.util.JdbcUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class ReviewMapper {
    //分页展示商品对应的评论数据
    public List<Review> getReviewByPid(Integer pid ,Integer pageNum,Integer pageSize) throws SQLException {
        String sql = "select * from review where product_id = ? limit ? ,?";
        try(Connection conn = JdbcUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {
            //处理参数
            pstmt.setInt(1,pid);
            pstmt.setInt(2,(pageNum-1)*pageSize);
            pstmt.setInt(3,pageSize);
            //执行sql
            ResultSet rs = pstmt.executeQuery();
            //创建一个集合用于存储评论数据
            List<Review> reviews = new ArrayList<>();
            while (rs.next()){
                //创建review对象
                Review review = new Review();
                review.setId(rs.getInt("id"));
                review.setOrderId(rs.getInt("order_id"));
                review.setUserId(rs.getInt("user_id"));;
                review.setProductId(pid);
                review.setContent(rs.getString("content"));
                review.setRating(rs.getInt("rating"));
                review.setCreateTime(rs.getDate("create_time"));
                //存入集合
                reviews.add(review);
            }
            //返回集合
            return reviews;
        }
    }

    //根据pid查询评论的数量
    public Integer findCountByPid(Integer pid) throws SQLException {
        String sql = "select count(*) num from review where product_id = ?";
        try(Connection conn = JdbcUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            //处理参数
            pstmt.setInt(1,pid);
            //执行sql
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                return rs.getInt("num");
            }else{
                return 0;
            }
        }
    }

}