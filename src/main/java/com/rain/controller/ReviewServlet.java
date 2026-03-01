package com.rain.controller;
import com.alibaba.fastjson2.JSONObject;
import com.rain.entity.Review;
import com.rain.service.ReviewService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
@WebServlet("/api/review/*")
public class ReviewServlet extends BaseServlet{
    private ReviewService reviewService = new ReviewService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        if("/findByPid".equals(pathInfo)){
            //根据商品id查询对应的评论数据
            findByPid(req,resp);
        }else{
            writeJson(resp,error("接口不存在!!!!"));
        }
    }

    // 分页查询商品对应的评论数据
    private void findByPid(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        //商品的id
        Integer pid = Integer.parseInt(req.getParameter("pid"));
        JSONObject params = JSONObject.parseObject(req.getReader().readLine());
        // 当前页
        Integer page = params.getIntValue("page");
        // 每页展示多少条评论
        Integer size = params.getIntValue("size");
        try {
            // 分页查询
            List<Review> reviewList = reviewService.findReviewByPid(pid, page, size);
            //评论的数量
            Integer total = reviewService.findCountByPid(pid);
            JSONObject result = new JSONObject();
            result.put("total",total);
            result.put("reviewList",reviewList);
            writeJson(resp,success(result));
        } catch (SQLException e) {
            e.printStackTrace();
            writeJson(resp,error("系统繁忙,请稍后尝试"));
        }
    }

}