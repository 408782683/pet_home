package com.rain.mapper;

import com.rain.entity.User;
import com.rain.util.JdbcUtil;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMapper {

    //根据用户名查询用户信息是否存在
    public boolean isUsernameExists(String username) throws SQLException {
        String sql = "select * from user where username=?";
        try(Connection conn = JdbcUtil.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql)){
            //处理参数
            ps.setString(1, username);
            //处理sql
            ResultSet rs = ps.executeQuery();
            return rs.next();
        }
    }

    public void registerUser(User user) throws SQLException {
        String sql = "insert into user(username,password,role,nickname,avatar,phone," +
                "email,status,create_time,money) values(?,?,?,?,?,?,?,?,now(),?)";
        try(Connection conn = JdbcUtil.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql)){
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getRole());
            ps.setString(4, user.getNickname());
            ps.setString(5, user.getAvatar());
            ps.setString(6, user.getPhone());
            ps.setString(7, user.getEmail());
            ps.setString(8, user.getStatus());
            ps.setBigDecimal(9, user.getMoney());
            //执行sql
            ps.executeUpdate();
        }
    }

    public User loginUser(String username,String password,String role){
        //根据用户名查询用户信息
        String sql = "select * from user where username = ?";
        try(Connection connection = JdbcUtil.getConnection();
        PreparedStatement ps = connection.prepareStatement(sql)){
            //处理参数
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            //处理结果集
            while(rs.next()){
                //创建user对象
                User user = new User();
                String bcPwd = rs.getString("password");
                String status = rs.getString("status");

                //拿密码和角色比对是否正确
                if(BCrypt.checkpw(password,bcPwd)
                && role.equals(rs.getString("role"))
                && status.equals("正常")){
                    user.setStatus(rs.getString("status"));
                    //判断成功则密码输入正确
                    Integer id = rs.getInt("id");
                    user.setId(id);
                    user.setRole(role);
                    user.setUsername(rs.getString("username"));
                    user.setNickname(rs.getString("nickname"));
                    user.setEmail(rs.getString("email"));
                    user.setPhone(rs.getString("phone"));
                    user.setAvatar(rs.getString("avatar"));
                    user.setMoney(rs.getBigDecimal("money"));
                    user.setCreateTime(rs.getDate("create_time"));
                    return user;
                }

                else{
                    return null;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
