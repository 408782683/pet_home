package com.rain.controller;

import com.alibaba.fastjson2.JSONObject;
import com.rain.entity.Product;
import com.rain.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

// 商品的servlet
@WebServlet("/api/product/*")
public class ProductServlet extends BaseServlet{
    private ProductService productService = new ProductService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        if("/getProductList".equals(pathInfo)){
            // 加载所有的商品数据
            getProductList(req,resp);
        }else if("/productListByPage".equals(pathInfo)){
            // 分页展示商品的数据
            productListByPage(req,resp);
        }
        else if("/findById".equals(pathInfo)){
            //根据商品id查询商品详情
            findById(req,resp);
        }
        else{
            writeJson(resp,error("接口不存在!!!!"));
        }
    }

    //根据商品ID查询商品详情
    private void findById(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        //获取商品id
        Integer pid = Integer.parseInt(req.getParameter("pid"));
        try {
            //调用即可
            Product product = productService.findById(pid);
            JSONObject result = new JSONObject();
            result.put("productInfo", product);
            writeJson(resp, success(result));
        }catch (Exception e){
            e.printStackTrace();
            writeJson(resp,error("系统繁忙，请稍后再试"));
        }
    }

    // 加载所有的商品列表数据
    private void getProductList(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            List<Product> productList = productService.getProductList();
            JSONObject result = new JSONObject();
            result.put("productList",productList);
            writeJson(resp,success(result));
        } catch (Exception e) {
            e.printStackTrace();
            writeJson(resp,error("系统繁忙,请稍后尝试"));
        }
    }


    // 分页展示商品的数据列表
    private void productListByPage(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // 获取从前端传递过来的8个参数
        JSONObject params = JSONObject.parseObject(req.getReader().readLine());
        int pageNum = params.getIntValue("page"); //传入当前页面默认为1
        int pageSize = params.getIntValue("size");//传入每页展示的数据量默认为6
        String name = params.getString("name");//商品的名称
        String brand = params.getString("brand");//品牌
        String petType = params.getString("petType");//宠物类型
        int categoryId = params.getIntValue("categoryId");//分类的id
        System.out.println(categoryId +" ........");
        BigDecimal minPrice = params.getBigDecimal("minPrice");//最低价
        BigDecimal maxPrice = params.getBigDecimal("maxPrice");// 最高价
        try {
            // 分页查询商品的列表数据
            List<Product> productList  = productService
                    .getProductByPage(pageNum,pageSize,name,brand,minPrice,maxPrice,categoryId,petType);
            // 分页查询商品的数量
            Integer total = productService.getProductCount(name,brand,minPrice,maxPrice,categoryId,petType);
            // 创建返回的json数据
            JSONObject result = new JSONObject();
            result.put("total",total);
            result.put("productList",productList);
            writeJson(resp,success(result));
        } catch (SQLException e) {
            e.printStackTrace();
            writeJson(resp,error("系统繁忙,请稍后尝试"));
        }
    }
}