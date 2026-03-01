package com.rain.mapper;
import com.rain.entity.Review;
import com.rain.util.JdbcUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.alibaba.fastjson2.JSONObject;
import java.util.List;
public class ReviewMapper {
    public List<JSONObject> findReviewListByUser(Integer userId,Integer page,Integer size) throws SQLException {
        String sql = "select r.*,p.name product_name,p.images product_images from review r left join product p on r.product_id=p.id where r.user_id=? order by r.id desc limit ?,?";
        try(Connection conn = JdbcUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1,userId); pstmt.setInt(2,(page-1)*size); pstmt.setInt(3,size);
            ResultSet rs = pstmt.executeQuery();
            List<JSONObject> list = new ArrayList<>();
            while(rs.next()){
                JSONObject o = new JSONObject();
                o.put("id", rs.getLong("id"));
                o.put("orderId", rs.getLong("order_id"));
                o.put("productId", rs.getLong("product_id"));
                o.put("productName", rs.getString("product_name"));
                o.put("productImages", rs.getString("product_images"));
                o.put("content", rs.getString("content"));
                o.put("rating", rs.getInt("rating"));
                o.put("createTime", rs.getTimestamp("create_time"));
                list.add(o);
            }
            return list;
        }
    }
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