package com.rain.service;

import com.rain.entity.User;
import com.rain.mapper.UserMapper;

import java.sql.SQLException;


public class UserService {

    private UserMapper userMapper= new UserMapper();

    public boolean isUsernameExists(String username) throws SQLException {
        return userMapper.isUsernameExists(username);
    }

    public void registerUser(User user) throws SQLException {
        userMapper.registerUser(user);
    }

    public User loginUser(String username, String password ,String role) throws SQLException {
        return userMapper.loginUser(username,password,role);
    }

}
