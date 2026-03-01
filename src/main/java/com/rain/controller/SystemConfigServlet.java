package com.rain.controller;
import com.alibaba.fastjson2.JSONObject;
import com.rain.entity.SystemConfig;
import com.rain.service.SystemConfigService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
// 这是系统配置的servlet
@WebServlet("/api/systemconfig/*")
public class SystemConfigServlet extends BaseServlet{
    private SystemConfigService systemConfigService = new SystemConfigService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        if("/get".equals(pathInfo)){
            getSystemConfig(req,resp);
        }else{
            writeJson(resp,error("接口不存在!!!!"));
        }
    }
    // 获取所有的系统配置信息
    private void getSystemConfig(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        try {
            // 获取所有的配置信息
            List<SystemConfig> configs = systemConfigService.getAllSystemcConfig();
            JSONObject result = new JSONObject();
            result.put("systemCongList",configs.get(0));
            writeJson(resp,success(result));


            System.out.println("已成功写入配置。");
        } catch (Exception e) {
            e.printStackTrace();
            writeJson(resp,error("系统异常,请稍后尝试"));
        }
    }

}