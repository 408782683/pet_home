package com.rain.controller;

import com.alibaba.fastjson2.JSONObject;
import com.rain.entity.ForumPost;
import com.rain.entity.ForumPostComment;
import com.rain.service.ForumService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/api/forum/*")
public class ForumServlet extends BaseServlet {
    ForumService forumService = new ForumService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, IOException {
        String path = req.getPathInfo();
        if (path.equals("/findByPage")) {
            //分页查询论坛帖子
            findByPage(req, resp);

        } else if (path.equals("/createPost")) {
            //写入论坛帖子
            createPost(req, resp);
        }
        else if(path.equals("/detail")){
            findDetailById(req,resp);
        }
        else if(path.equals("/comment/list")){
            findCommentListByPid(req,resp);
        }
        else if(path.equals("/like/check")){
            checkPostIsLike(req,resp);
        }
        else {
            writeJson(resp, error("接口不存在！"));
        }
    }

    private void findByPage(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        JSONObject params = JSONObject.parseObject(req.getReader().readLine());
        Integer pageNum = params.getIntValue("page");
        Integer pageSize = params.getIntValue("size");
        Integer currentUserId = params.getIntValue("currentUserId");
        String keywords = params.getString("keywords");
        String title = params.getString("title");
        String publisher = params.getString("publisher");
        String orderBy = params.getString("orderBy");
        try {
            //分页查询论坛帖子数据
            List<ForumPost> forumPostList = forumService.findByPage(currentUserId, title,
                    keywords, publisher, orderBy,
                    pageNum, pageSize);
            //查询总数据量
            Integer total = forumService.findForumCount(currentUserId, title,
                    keywords, publisher, orderBy);
            JSONObject result = new JSONObject();
            result.put("total", total);
            result.put("forumPostList", forumPostList);
            writeJson(resp, success(result));
        } catch (IOException e) {
            writeJson(resp, error("系统繁忙，请稍后尝试。"));
        }
    }

    // 发布论坛帖子的方法
    private void createPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        JSONObject params = JSONObject.parseObject(req.getReader().readLine());
        // 获取参数列表
        String title = params.getString("title");
        String description = params.getString("description");
        String content = params.getString("content");
        String keywords = params.getString("keywords");
        String images = params.getString("images");
        Integer userId = params.getIntValue("userId");
        String username = params.getString("username");
        System.out.println("username的值为" + username);
        //封装为ForumPost对象
        ForumPost forumPost = new ForumPost();
        forumPost.setTitle(title);
        forumPost.setDescription(description);
        forumPost.setContent(content);
        forumPost.setKeywords(keywords);
        forumPost.setImages(images);
        forumPost.setUserId(userId);
        forumPost.setUsername(username);
        try {
            //将论坛帖子内容的数据插入到forum_post表中
            forumService.createForumPost(forumPost);
            writeJson(resp,success("论坛帖子发布成功"));
        } catch (SQLException e) {
            e.printStackTrace();
            writeJson(resp,error("系统繁忙,请稍后尝试123"));
        }
    }


    // 根据帖子的id查看帖子的详情
    private void findDetailById(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        //获取帖子的id
        Integer id =Integer.parseInt(req.getParameter("id"));
        try {
            ForumPost forumPost = forumService.findDetailById(id);
            //构建返回的结果
            JSONObject result = new JSONObject();
            result.put("forumDetail",forumPost);
            writeJson(resp,success(result));
        } catch (Exception e) {
            e.printStackTrace();
            writeJson(resp,error("系统繁忙,请稍后尝试"));
        }
    }

    // 根据帖子id查询对应的评论列表数据
    private void findCommentListByPid(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        //获取帖子的id
        Integer id =Integer.parseInt(req.getParameter("id"));
        try {
            // 根据帖子id查询出了对应的评论列表数据
            List<ForumPostComment> forumPostCommentList =
                    forumService.findCommentListByPid(id);
            JSONObject result = new JSONObject();
            result.put("commentList",forumPostCommentList);
            writeJson(resp,success(result));
        } catch (Exception e) {
            e.printStackTrace();
            writeJson(resp,error("系统繁忙,请稍后尝试"));
        }
    }


    // 根据帖子id以及用户id检查是否点赞
    private void checkPostIsLike(HttpServletRequest req, HttpServletResponse resp) {
        Integer pid = Integer.parseInt(req.getParameter("id"));//帖子id
        Integer userId  = Integer.parseInt(req.getParameter("userId"));//用户id
        try {
            boolean flag = forumService.checkPostIsLike(pid, userId);
            if(flag){
                writeJson(resp,success(""));
            }else{
                writeJson(resp,error(""));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
