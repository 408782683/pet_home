package com.rain.controller;
import com.alibaba.fastjson2.JSONObject;
import com.rain.entity.Cart;
import com.rain.service.CartService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
//购物车模块
@WebServlet("/api/cart/*")
public class CartServlet extends BaseServlet{
    private CartService cartService = new CartService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        if("/addToCart".equals(pathInfo)){
            //添加购物车
            addToCart(req,resp);
        }else if("/findCartList".equals(pathInfo)){
            // 根据用户id加载对应的购物车数据
           // findCartList(req,resp);
        }else{
            writeJson(resp,error("接口不存在!!!"));
        }
    }

    //添加购物车
    private void addToCart(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        JSONObject params = JSONObject.parseObject(req.getReader().readLine());
        // 商品id
        int productId = params.getIntValue("productId");
        // 用户id
        int userId = params.getIntValue("userId");
        // 数量
        int quantity = params.getIntValue("quantity");
        try {
            // 添加购物车
            cartService.addToCart(productId,userId,quantity);
            writeJson(resp,success("添加购物车成功"));
        } catch (SQLException e) {
            e.printStackTrace();
            writeJson(resp,error("系统繁忙,请稍后尝试"));
        }
    }

}