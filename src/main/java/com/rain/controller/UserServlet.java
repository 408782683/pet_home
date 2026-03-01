package com.rain.controller;

import com.alibaba.fastjson2.JSONObject;
import com.rain.entity.User;
import com.rain.service.UserService;
import com.rain.util.JwtUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.Objects;

@WebServlet("/api/user/*")
public class UserServlet extends BaseServlet {

    //创建全局UserService
    UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();// /isUsernameExists
        if ("/isUsernameExists".equals(pathInfo)) {
            //此处检查用户名是否存在
            try {
                isUsernameExist(req, resp);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if ("/register".equals(pathInfo)) {
            //执行用户注册
            try {
                registerUser(req, resp);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if ("/login".equals(pathInfo)) {
            //执行用户登录
            try {
                loginUser(req, resp);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else {
            writeJson(resp, error("接口不存在！！！"));
        }
    }

    private void loginUser(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
        JSONObject params = JSONObject.parseObject(req.getReader().readLine());
        String username = params.getString("username");
        String password = params.getString("password");
        String role = params.getString("role");
        String captcha = params.getString("captcha");
        //先校验验证码是否正确
        //获取session中存储的验证码
        String session_captcha = req.getSession().getAttribute("captcha").toString();
        if (captcha.equals(session_captcha)) {
            //验证正确则登录
            User user = userService.loginUser(username,password,role);
            //System.out.println(username + password + role);
            if(user == null){
                writeJson(resp,error("用户名或密码有误"));
                System.out.println("用户返回值为空");
            }
            else{
                JSONObject result = new JSONObject();
                result.put("userInfo",user);//用户信息
                //生成token令牌传递给客户端
                int roleNum = Objects.equals(role, "普通用户") ?0:1;
                String token = JwtUtil.generateToken(username,roleNum);
                result.put("Authorization",token);//Bearer 张三
                result.put("role",role);
                writeJson(resp,success(result));//响应给客户端
            }
        }
        else{
            //验证码错误提示
            writeJson(resp,error("验证码有误！！！"));
    }
}

    private void registerUser(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
        //获取用户名参数
        JSONObject params = JSONObject.parseObject(req.getReader().readLine());
        String username = params.getString("username");
        String password = params.getString("password");
        String nickname = params.getString("nickname");
        String email = params.getString("email");
        String phone = params.getString("phone");
        String captcha = params.getString("captcha");
        //先校验验证码是否正确
        //获取session中存储的验证码
        String session_captcha = req.getSession().getAttribute("captcha").toString();
        //创建一个响应结果对象
        JSONObject result = new JSONObject();
        if(captcha.equals(session_captcha)) {
            //说明验证码输入正确
            User user = new User();
            user.setUsername(username);
            user.setRole("普通用户");
            user.setAvatar("");
            user.setNickname(nickname);
            user.setEmail(email);
            user.setPhone(phone);
            user.setStatus("正常");
            user.setMoney(new BigDecimal("0.00"));
            // 给password进行加密处理
            String newPassword = BCrypt.hashpw(password, BCrypt.gensalt());//采用默认家宴方式给密码进行加密处理
            user.setPassword(newPassword);
            try {
                userService.registerUser(user);
                writeJson(resp,success("注册成功！！！"));
            } catch (SQLException e) {
                e.printStackTrace();
                writeJson(resp,error("注册失败"));
            }
        }
        else{
            //不正确
            writeJson(resp,error("验证码有误！！！"));
        }

    }

    private void isUsernameExist(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
        //获取用户名参数
        JSONObject params = JSONObject.parseObject(req.getReader().readLine());
        String username = params.getString("username");
        try {
            boolean flag = userService.isUsernameExists(username);
            //构建返回结果
            JSONObject result = new JSONObject();
            result.put("exists", flag);
            writeJson(resp, success(result));
        }catch (SQLException e) {}
    }


}
