package com.rain.service;

import com.rain.entity.Category;
import com.rain.mapper.CategoryMapper;

import java.sql.SQLException;
import java.util.List;

public class CategoryService {
    private CategoryMapper categoryMapper = new CategoryMapper();

    // 加载所有的分类信息
    public List<Category> getCategoryList() throws SQLException {
        return categoryMapper.getCategoryList();
    }

}