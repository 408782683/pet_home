package com.rain.service;
import com.rain.entity.Cart;
import com.rain.entity.Category;
import com.rain.entity.Product;
import com.rain.mapper.CartMapper;
import com.rain.mapper.CategoryMapper;
import com.rain.mapper.ProductMapper;
import java.sql.SQLException;
import java.util.List;
public class CartService {
    private CartMapper cartMapper = new CartMapper();
    private ProductMapper productMapper = new ProductMapper();

    //添加购物车
    public void addToCart(Integer productId,Integer userId,Integer quantity) throws SQLException {
        boolean flag = cartMapper.idAddCart(productId, userId);
        if(flag){
            //说明购物车中已存在
            cartMapper.updateCartQuantity(productId, userId, quantity);
        }else{
            //说明不存在购物车中
            cartMapper.addToCart(productId, userId, quantity);
        }
    }

}