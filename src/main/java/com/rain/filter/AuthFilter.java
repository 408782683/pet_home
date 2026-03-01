package com.rain.filter;
import com.alibaba.fastjson2.JSONObject;
import com.rain.controller.BaseServlet;
import com.rain.util.JwtUtil;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebFilter("/*")
public class AuthFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest)servletRequest;
        HttpServletResponse resp = (HttpServletResponse)servletResponse;
        //获取请求资源地址
        String uri = req.getRequestURI();
        System.out.println(uri);
        if(uri.startsWith("/css") ||
                uri.startsWith("/js") ||
                uri.startsWith("/html") ||
                uri.equals("/index.html") ||
                uri.equals("/api/captcha/generate") ||
                uri.startsWith("/api/user") ||
                uri.equals("/")){
            //放行
            filterChain.doFilter(req,resp);
            return;
        }
        // 如果是其他资源来访问
        String authToken = req.getHeader("Authorization");
        if(authToken == null){
            JSONObject result = new JSONObject();
            result.put("success",false);
            result.put("message","您还未登录,请先完成登录");
            resp.setContentType("application/json;charset=utf8");
            resp.getWriter().write(JSONObject.toJSONString(result));
            return;
        }

        try {
            //如果authToken不为空
            Claims claims = Jwts.parser()
                    .setSigningKey(JwtUtil.getSigningKey()) // 从 JwtUtil 获取签名密钥
                    .parseClaimsJws(authToken) // 解析 JWT
                    .getBody();// 获取 JWT 主体

            //放行
            filterChain.doFilter(req,resp);
        }catch (Exception e){
            e.printStackTrace();
            JSONObject result = new JSONObject();
            result.put("success",false);
            result.put("message","您还未登录,请先完成登录");
            resp.setContentType("application/json;charset=utf8");
            resp.getWriter().write(JSONObject.toJSONString(result));
        }

    }

}