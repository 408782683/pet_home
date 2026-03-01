package com.rain.service;

import com.rain.entity.Product;
import com.rain.mapper.ProductMapper;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

public class ProductService {
    private ProductMapper productMapper = new ProductMapper();

    //加载所有的商品列表数据
    public List<Product> getProductList() throws SQLException {
        return productMapper.getProductList();
    }

    // 分页查询商品的列表数据
    public List<Product> getProductByPage(Integer pageNum, Integer pageSize,
                                          String name, String brand,
                                          BigDecimal minPrice, BigDecimal maxPrice,
                                          Integer categoryId, String petType) throws SQLException {
        return productMapper.getProductByPage(pageNum, pageSize, name, brand, minPrice, maxPrice, categoryId, petType);
    }

    // 分页查询商品的数量
    public Integer getProductCount(String name, String brand,
                                   BigDecimal minPrice,BigDecimal maxPrice,
                                   Integer categoryId,String petType) throws SQLException {
        return productMapper.getProductCount(name, brand, minPrice, maxPrice, categoryId, petType);
    }

    //根据商品id查询商品详情
    public Product findById(Integer pid) throws SQLException {
        return productMapper.findById(pid);
    }
}