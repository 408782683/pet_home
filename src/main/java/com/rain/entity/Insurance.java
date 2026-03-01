package com.rain.entity;


import java.math.BigDecimal;
import java.util.Date;

/**
 * 宠物保险实体类
 */

public class Insurance {

    /**
     * 主键ID
     */

    private Integer id;

    /**
     * 保险名称
     */
    private String name;

    /**
     * 保险详情
     */
    private String detail;

    /**
     * 价格/年
     */
    private BigDecimal price;

    /**
     * 保险范围
     */
    private String coverage;

    /**
     * 理赔须知
     */
    private String claimNotice;

    /**
     * 理赔限额
     */
    private String claimLimit;

    /**
     * 创建时间
     */
    private Date createTime;

    // 构造方法
    public Insurance() {
    }

    // Getter和Setter方法
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getCoverage() {
        return coverage;
    }

    public void setCoverage(String coverage) {
        this.coverage = coverage;
    }

    public String getClaimNotice() {
        return claimNotice;
    }

    public void setClaimNotice(String claimNotice) {
        this.claimNotice = claimNotice;
    }

    public String getClaimLimit() {
        return claimLimit;
    }

    public void setClaimLimit(String claimLimit) {
        this.claimLimit = claimLimit;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Insurance{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", detail='" + detail + '\'' +
                ", price=" + price +
                ", coverage='" + coverage + '\'' +
                ", claimNotice='" + claimNotice + '\'' +
                ", claimLimit='" + claimLimit + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}

