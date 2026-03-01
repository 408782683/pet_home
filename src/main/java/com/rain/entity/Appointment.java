package com.rain.entity;


import java.util.Date;

/**
 * 医院预约实体类
 */

public class Appointment {

    /**
     * 主键ID
     */

    private Integer id;

    /**
     * 用户ID
     */
    private Integer userId;

    /**
     * 医院ID
     */
    private Integer hospitalId;

    /**
     * 医院名称
     */
    private String hospitalName;

    /**
     * 宠物名称
     */
    private String petName;

    /**
     * 宠物类型
     */
    private String petType;

    /**
     * 病情描述
     */
    private String conditionDescription;

    /**
     * 病情图片URL，多个用逗号分隔，最多5个
     */
    private String images;

    /**
     * 预约日期
     */
    private Date appointmentDate;

    /**
     * 预约时间
     */
    private String appointmentTime;

    /**
     * 联系电话
     */
    private String contactPhone;

    /**
     * 状态：待赴约、已到店、已完成
     */
    private String status;

    /**
     * 创建时间
     */
    private Date createTime;

    // 构造方法
    public Appointment() {
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

    public Integer getHospitalId() {
        return hospitalId;
    }

    public void setHospitalId(Integer hospitalId) {
        this.hospitalId = hospitalId;
    }

    public String getHospitalName() {
        return hospitalName;
    }

    public void setHospitalName(String hospitalName) {
        this.hospitalName = hospitalName;
    }

    public String getPetName() {
        return petName;
    }

    public void setPetName(String petName) {
        this.petName = petName;
    }

    public String getPetType() {
        return petType;
    }

    public void setPetType(String petType) {
        this.petType = petType;
    }

    public String getConditionDescription() {
        return conditionDescription;
    }

    public void setConditionDescription(String conditionDescription) {
        this.conditionDescription = conditionDescription;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public Date getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(Date appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public String getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(String appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
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
        return "Appointment{" +
                "id=" + id +
                ", userId=" + userId +
                ", hospitalId=" + hospitalId +
                ", hospitalName='" + hospitalName + '\'' +
                ", petName='" + petName + '\'' +
                ", petType='" + petType + '\'' +
                ", conditionDescription='" + conditionDescription + '\'' +
                ", images='" + images + '\'' +
                ", appointmentDate=" + appointmentDate +
                ", appointmentTime='" + appointmentTime + '\'' +
                ", contactPhone='" + contactPhone + '\'' +
                ", status='" + status + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}

