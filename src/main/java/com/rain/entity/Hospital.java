package com.rain.entity;


import java.util.Date;

/**
 * 宠物医院实体类
 */

public class Hospital {

    /**
     * 主键ID
     */

    private Integer id;

    /**
     * 医院图片URL，多个用逗号分隔，最多5个
     */
    private String images;

    /**
     * 医院名称
     */
    private String name;

    /**
     * 医院介绍
     */
    private String introduction;

    /**
     * 服务项目，多个标签用逗号分隔
     */
    private String services;

    /**
     * 医院地址
     */
    private String address;

    /**
     * 联系电话
     */
    private String phone;

    /**
     * 营业时间
     */
    private String businessHours;

    /**
     * 创建时间
     */
    private Date createTime;

    // 构造方法
    public Hospital() {
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

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getServices() {
        return services;
    }

    public void setServices(String services) {
        this.services = services;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getBusinessHours() {
        return businessHours;
    }

    public void setBusinessHours(String businessHours) {
        this.businessHours = businessHours;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Hospital{" +
                "id=" + id +
                ", images='" + images + '\'' +
                ", name='" + name + '\'' +
                ", introduction='" + introduction + '\'' +
                ", services='" + services + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", businessHours='" + businessHours + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}

