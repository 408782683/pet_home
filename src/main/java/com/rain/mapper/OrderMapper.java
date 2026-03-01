package com.rain.mapper;
import com.rain.entity.Order;
import com.rain.entity.OrderDetail;
import com.rain.util.JdbcUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class OrderMapper {
    // 往orders表中出插入数据
    public void addOrders(Order order, Connection conn) throws SQLException {
        String sql = "INSERT INTO \n" +
                " orders(order_no,user_id,total_amount,receiver_name,receiver_phone,receiver_address,STATUS,create_time)\n" +
                "VALUES(?,?,?,?,?,?,?,NOW())";
        try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
            //处理参数
            pstmt.setString(1,order.getOrderNo());
            pstmt.setInt(2,order.getUserId());
            pstmt.setBigDecimal(3,order.getTotalAmount());
            pstmt.setString(4, order.getReceiverName());
            pstmt.setString(5, order.getReceiverPhone());
            pstmt.setString(6, order.getReceiverAddress());
            pstmt.setString(7, order.getStatus());
            //执行sql
            pstmt.executeUpdate();
        }
    }

    // 往order_detail表中插入数据
    public void addOrderDetail(OrderDetail orderDetail,Connection conn) throws SQLException {
        String sql = "INSERT INTO \n" +
                " order_detail(order_id,product_id,product_name,product_image,price,quantity,create_time)\n" +
                "VALUES(?,?,?,?,?,?,NOW())";
        try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setLong(1,orderDetail.getOrderId());
            pstmt.setLong(2,orderDetail.getProductId());
            pstmt.setString(3,orderDetail.getProductName());
            pstmt.setString(4,orderDetail.getProductImage());
            pstmt.setBigDecimal(5,orderDetail.getPrice());
            pstmt.setInt(6,orderDetail.getQuantity());
            //执行sql
            pstmt.executeUpdate();
        }
    }

    //根据order_no来获取对应的订单id
    public Long getOrderIdByOrderNo(String orderNo) throws SQLException {
        String sql = "select id from orders where order_no = ?";
        try(Connection conn = JdbcUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {
            //处理参数
            pstmt.setString(1,orderNo);
            //执行sql
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                return rs.getLong("id");
            }else{
                return null;
            }
        }
    }

}