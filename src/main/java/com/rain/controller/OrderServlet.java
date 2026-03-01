package com.rain.controller;
import com.alibaba.fastjson2.JSONObject;
import com.rain.entity.Order;
import com.rain.entity.OrderDetail;
import com.rain.entity.Product;
import com.rain.service.OrderService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;
// 订单相关的servlet
@WebServlet("/api/orders/*")
public class OrderServlet extends BaseServlet{
    private OrderService orderService = new OrderService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        if("/createOrder".equals(pathInfo)){
            //创建订单
            createOrder(req,resp);
        }else{
            writeJson(resp,error("接口不存在!!!!"));
        }
    }
    // 创建订单
    private void createOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        JSONObject params = JSONObject.parseObject(req.getReader().readLine());
        //userId
        Integer userId = params.getIntValue("userId");
        // totalAmount
        BigDecimal totalAmount = params.getBigDecimal("totalAmount");
        // receiverName
        String receiverName = params.getString("receiverName");
        String receiverPhone = params.getString("receiverPhone");
        String receiverAddress = params.getString("receiverAddress");
        //封装为Order对象
        Order order = new Order();
        order.setUserId(userId);
        order.setTotalAmount(totalAmount);
        order.setReceiverName(receiverName);
        order.setReceiverPhone(receiverPhone);
        order.setReceiverAddress(receiverAddress);
        order.setStatus("待发货");
        String orderNo = "ORD";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        orderNo+=sdf.format(new Date());//ORD20260123
        Random random = new Random();
        orderNo+=random.nextInt(900000)+100000;// 100000 - 999999   [1,25]
        order.setOrderNo(orderNo); // ORD20260123xxxxxx
        // cartIds
        Object cartIds = params.get("cartIds"); // [13,15]
        List<Integer> ids = (List<Integer>) cartIds;
        // orderDetails
        Object orderDetails = params.get("orderDetails");
        //System.out.println(orderDetails);
        List<Map<String,Object>> orderDetailList = (List<Map<String,Object>>) orderDetails;
        try {
            // 创建订单
            orderService.createOrder(order,ids,orderDetailList);
            writeJson(resp,success("订单成成功"));
        } catch (SQLException e) {
            e.printStackTrace();
            writeJson(resp,error("订单创建失败"));
        }
    }

}