package com.rain.entity;

import java.util.Date;

/**
 * 寻找寄养帖子实体类
 */

public class FosterPost {

    /**
     * 主键ID
     */

    private Integer id;

    /**
     * 用户ID
     */
    private Integer userId;

    /**
     * 标题
     */
    private String title;

    /**
     * 描述
     */
    private String description;

    /**
     * 宠物类型：狗、猫
     */
    private String petType;

    /**
     * 宠物性别：公、母
     */
    private String petGender;

    /**
     * 宠物名称
     */
    private String petName;

    /**
     * 品种
     */
    private String breed;

    /**
     * 疫苗情况
     */
    private String vaccineStatus;

    /**
     * 照片URL，多个用逗号分隔，最多5个
     */
    private String photos;

    /**
     * 寄养要求
     */
    private String fosterRequirement;

    /**
     * 地理位置
     */
    private String location;

    /**
     * 主人信息
     */
    private String ownerInfo;

    /**
     * 状态：寻找中、已结束
     */
    private String status;

    /**
     * 创建时间
     */
    private Date createTime;

    // 构造方法
    public FosterPost() {
    }

    // Getter和Setter方法
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPetType() {
        return petType;
    }

    public void setPetType(String petType) {
        this.petType = petType;
    }

    public String getPetGender() {
        return petGender;
    }

    public void setPetGender(String petGender) {
        this.petGender = petGender;
    }

    public String getPetName() {
        return petName;
    }

    public void setPetName(String petName) {
        this.petName = petName;
    }

    public String getBreed() {
        return breed;
    }

    public void setBreed(String breed) {
        this.breed = breed;
    }

    public String getVaccineStatus() {
        return vaccineStatus;
    }

    public void setVaccineStatus(String vaccineStatus) {
        this.vaccineStatus = vaccineStatus;
    }

    public String getPhotos() {
        return photos;
    }

    public void setPhotos(String photos) {
        this.photos = photos;
    }

    public String getFosterRequirement() {
        return fosterRequirement;
    }

    public void setFosterRequirement(String fosterRequirement) {
        this.fosterRequirement = fosterRequirement;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getOwnerInfo() {
        return ownerInfo;
    }

    public void setOwnerInfo(String ownerInfo) {
        this.ownerInfo = ownerInfo;
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
        return "FosterPost{" +
                "id=" + id +
                ", userId=" + userId +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", petType='" + petType + '\'' +
                ", petGender='" + petGender + '\'' +
                ", petName='" + petName + '\'' +
                ", breed='" + breed + '\'' +
                ", vaccineStatus='" + vaccineStatus + '\'' +
                ", photos='" + photos + '\'' +
                ", fosterRequirement='" + fosterRequirement + '\'' +
                ", location='" + location + '\'' +
                ", ownerInfo='" + ownerInfo + '\'' +
                ", status='" + status + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}

