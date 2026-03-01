package com.rain.entity;


import java.util.Date;

/**
 * 评价实体类
 */

public class Review {

    /**
     * 主键ID
     */

    private Integer id;

    /**
     * 订单ID
     */
    private Integer orderId;

    /**
     * 用户ID
     */
    private Integer userId;

    /**
     * 商品ID
     */
    private Integer productId;

    /**
     * 评价内容
     */
    private String content;

    /**
     * 评分：1-5星
     */
    private Integer rating;


    /**
     * 创建时间
     */
    private Date createTime;

    // 构造方法
    public Review() {
    }

    // Getter和Setter方法
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }


    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Review{" +
                "id=" + id +
                ", orderId=" + orderId +
                ", userId=" + userId +
                ", productId=" + productId +
                ", content='" + content + '\'' +
                ", rating=" + rating +
                ", createTime=" + createTime +
                '}';
    }
}

