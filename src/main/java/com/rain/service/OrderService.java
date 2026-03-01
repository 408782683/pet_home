package com.rain.service;
import com.rain.entity.Order;
import com.rain.entity.OrderDetail;
import com.rain.entity.Product;
import com.rain.mapper.CartMapper;
import com.rain.mapper.OrderMapper;
import com.rain.util.JdbcUtil;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
public class OrderService {
    private OrderMapper orderMapper = new OrderMapper();
    private CartMapper cartMapper = new CartMapper();

    //创建订单
    public void createOrder(Order order, List<Integer> ids,List<Map<String,Object>> orderDetails) throws SQLException {
        Connection conn = null;
        try{
            conn = JdbcUtil.getConnection();
            //往订单表中插入数据
            orderMapper.addOrders(order,conn);
            conn.setAutoCommit(false);//手动开启事务
            //需要把刚刚生成的订单id返回来---根据orderno来获取对应的主键id
            Long orderId = orderMapper.getOrderIdByOrderNo(order.getOrderNo());
            System.out.println(orderId+".......");
            //往订单详情表中出入数据
            //遍历orderDetails集合
            for (Map<String, Object> map : orderDetails) {
                //手动封装OrderDetail对象
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrderId(orderId);
                orderDetail.setProductId(Long.valueOf((Integer) map.get("productId")));
                orderDetail.setProductName((String) map.get("productName"));
                orderDetail.setProductImage((String) map.get("productImage"));
                orderDetail.setPrice(new BigDecimal(map.get("price")+""));
                orderDetail.setQuantity((Integer) map.get("quantity"));
                //将我们的orderDetail对象插入到order_detail表中
                orderMapper.addOrderDetail(orderDetail,conn);
            }
            //删除购物车中对应的数据
            for (Integer id : ids) {
                cartMapper.deleteById(id,conn);
            }
            //提交事务
            conn.commit();
        }catch (SQLException e){
            e.printStackTrace();
            //回滚事务
            conn.rollback();
        }finally {
            conn.close();
        }
    }

}