package com.rain.controller;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * 基础 Servlet，使用 Fastjson2 处理 JSON
 */
public abstract class BaseServlet extends HttpServlet {

    /**
     * 将对象转为 JSON 并写入响应
     */
    protected void writeJson(HttpServletResponse resp, Object data) throws IOException {
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.print(JSON.toJSONString(data));
        out.flush();
    }

    /**
     * 构造通用 JSON 响应（成功）
     */
    protected JSONObject success(Object data) {
        JSONObject result = new JSONObject();
        result.put("success", true);
        result.put("data", data);
        return result;
    }

    /**
     * 构造通用 JSON 响应（失败）
     */
    protected JSONObject error(String message) {
        JSONObject result = new JSONObject();
        result.put("success", false);
        result.put("message", message);
        return result;
    }

}
