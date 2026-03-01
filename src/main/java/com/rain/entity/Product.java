package com.rain.entity;


import java.math.BigDecimal;
import java.util.Date;

/**
 * 商品实体类
 */

public class Product {

    /**
     * 主键ID
     */

    private Integer id;

    /**
     * 商品图片URL，多个用逗号分隔，最多5个
     */
    private String images;

    /**
     * 商品名称
     */
    private String name;

    /**
     * 商品分类ID
     */
    private Integer categoryId;

    /**
     * 商品描述
     */
    private String description;

    /**
     * 品牌
     */
    private String brand;

    /**
     * 适用宠物类型：狗、猫
     */
    private String petType;

    /**
     * 价格
     */
    private BigDecimal price;

    /**
     * 状态：上架、下架
     */
    private String status;

    /**
     * 创建时间
     */
    private Date createTime;

    // 构造方法
    public Product() {
    }

    // Getter和Setter方法
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getPetType() {
        return petType;
    }

    public void setPetType(String petType) {
        this.petType = petType;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", images='" + images + '\'' +
                ", name='" + name + '\'' +
                ", categoryId=" + categoryId +
                ", description='" + description + '\'' +
                ", brand='" + brand + '\'' +
                ", petType='" + petType + '\'' +
                ", price=" + price +
                ", status='" + status + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}

