package com.xbb.meeting.entity;

import javax.persistence.*;
import java.util.Date;

public class User {
    /**
     * 人员表ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 用户名
     */
    @Column(name = "user_name")
    private String userName;

    /**
     * 密码
     */
    private String password;

    /**
     * 角色ID
     */
    @Column(name = "role_id")
    private Integer roleId;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 电话
     */
    private String cellphone;

    /**
     * 性别
     */
    private Boolean sex;

    /**
     * 工号
     */
    @Column(name = "job_number")
    private Integer jobNumber;

    @Column(name = "register_time")
    private Date registerTime;
    /**
     * 获取人员表ID
     *
     * @return id - 人员表ID
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置人员表ID
     *
     * @param id 人员表ID
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取用户名
     *
     * @return user_name - 用户名
     */
    public String getUserName() {
        return userName;
    }

    /**
     * 设置用户名
     *
     * @param userName 用户名
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * 获取密码
     *
     * @return password - 密码
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置密码
     *
     * @param password 密码
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * 获取角色ID
     *
     * @return role_id - 角色ID
     */
    public Integer getRoleId() {
        return roleId;
    }

    /**
     * 设置角色ID
     *
     * @param roleId 角色ID
     */
    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    /**
     * 获取邮箱
     *
     * @return email - 邮箱
     */
    public String getEmail() {
        return email;
    }

    /**
     * 设置邮箱
     *
     * @param email 邮箱
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * 获取电话
     *
     * @return cellphone - 电话
     */
    public String getCellphone() {
        return cellphone;
    }

    /**
     * 设置电话
     *
     * @param cellphone 电话
     */
    public void setCellphone(String cellphone) {
        this.cellphone = cellphone;
    }

    /**
     * 获取性别
     *
     * @return sex - 性别
     */
    public Boolean getSex() {
        return sex;
    }

    /**
     * 设置性别
     *
     * @param sex 性别
     */
    public void setSex(Boolean sex) {
        this.sex = sex;
    }

    /**
     * 获取工号
     *
     * @return job_number - 工号
     */
    public Integer getJobNumber() {
        return jobNumber;
    }

    /**
     * 设置工号
     *
     * @param jobNumber 工号
     */
    public void setJobNumber(Integer jobNumber) {
        this.jobNumber = jobNumber;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }
}