package com.rain.controller;

import com.alibaba.fastjson2.JSONObject;
import com.rain.service.PortalService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/api/breeding/*")
public class BreedingServlet extends BaseServlet {
    private final PortalService service = new PortalService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String path = req.getPathInfo();
        JSONObject body = JSONObject.parseObject(req.getReader().readLine());
        try {
            if ("/listByPage".equals(path)) {
                JSONObject result = service.pageQuery("breeding_post", body, body.getIntValue("page", 1), body.getIntValue("size", 12), "id desc");
                JSONObject data = new JSONObject();
                data.put("breedingList", result.getJSONArray("list"));
                data.put("total", result.getInteger("total"));
                writeJson(resp, success(data));
            } else if ("/add".equals(path)) {
                service.savePost("breeding_post", body, false, body.getInteger("userId"));
                writeJson(resp, success("发布成功"));
            } else if ("/update".equals(path)) {
                int n = service.savePost("breeding_post", body, true, body.getInteger("currentUserId"));
                writeJson(resp, n > 0 ? success("更新成功") : error("未找到可更新帖子"));
            } else if ("/detail".equals(path)) {
                writeJson(resp, success(service.getById("breeding_post", req.getParameter("id") == null ? body.getLongValue("id") : Long.parseLong(req.getParameter("id")))));
            } else {
                writeJson(resp, error("接口不存在"));
            }
        } catch (Exception e) {
            writeJson(resp, error("系统繁忙，请稍后再试"));
        }
    }
}
