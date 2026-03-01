package com.rain.service;
import com.rain.entity.Review;
import com.rain.mapper.ReviewMapper;
import java.sql.SQLException;
import java.util.List;
public class ReviewService {
    private ReviewMapper reviewMapper = new ReviewMapper();

    //分页查询商品对应的评论数据
    public List<Review> findReviewByPid(Integer pid, Integer pageNum,Integer pageSize) throws SQLException {
        return reviewMapper.getReviewByPid(pid,pageNum,pageSize);
    }

    //查询商品对应的评论数量
    public Integer findCountByPid(Integer pid) throws SQLException {
        return reviewMapper.findCountByPid(pid);
    }

}