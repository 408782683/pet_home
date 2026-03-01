package com.rain.controller;
import com.alibaba.fastjson2.JSONObject;
import com.rain.entity.Category;
import com.rain.service.CategoryService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
@WebServlet("/api/category/*")
public class CategoryServlet extends BaseServlet{
    private CategoryService categoryService = new CategoryService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        if("/getCategoryList".equals(pathInfo)){
            // 加载所有的商品分类
            getCategoryList(req,resp);
        }else{
            writeJson(resp,error("接口不存在!!!"));
        }
    }
    // 加载所有的分类
    private void getCategoryList(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            List<Category> categoryList = categoryService.getCategoryList();
            JSONObject result = new JSONObject();
            result.put("categoryList",categoryList);
            writeJson(resp,success(result));
        } catch (Exception e) {
            e.printStackTrace();
            writeJson(resp,error("系统繁忙,请稍后尝试"));
        }
    }

}