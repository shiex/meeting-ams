package com.xbb.meeting.entity;

import javax.persistence.*;

public class Cost {
    /**
     * 费用表ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 会议ID
     */
    @Column(name = "meeting_id")
    private Integer meetingId;

    /**
     * 会议标题
     */
    @Column(name = "meeting_title")
    private String meetingTitle;

    /**
     * 会议费用
     */
    @Column(name = "meeting_cost")
    private Double meetingCost;

    /**
     * 宾馆ID
     */
    @Column(name = "hotel_id")
    private Integer hotelId;

    /**
     * 宾馆名称
     */
    @Column(name = "hotel_name")
    private String hotelName;

    /**
     * 宾馆费用
     */
    @Column(name = "hotel_cost")
    private Double hotelCost;

    /**
     * 注册人员姓名
     */
    @Column(name = "user_name")
    private String userName;

    /**
     * 费用小计
     */
    private Double subtotal;

    /**
     * 获取费用表ID
     *
     * @return id - 费用表ID
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置费用表ID
     *
     * @param id 费用表ID
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取会议ID
     *
     * @return meeting_id - 会议ID
     */
    public Integer getMeetingId() {
        return meetingId;
    }

    /**
     * 设置会议ID
     *
     * @param meetingId 会议ID
     */
    public void setMeetingId(Integer meetingId) {
        this.meetingId = meetingId;
    }

    /**
     * 获取会议标题
     *
     * @return meeting_title - 会议标题
     */
    public String getMeetingTitle() {
        return meetingTitle;
    }

    /**
     * 设置会议标题
     *
     * @param meetingTitle 会议标题
     */
    public void setMeetingTitle(String meetingTitle) {
        this.meetingTitle = meetingTitle;
    }

    /**
     * 获取会议费用
     *
     * @return meeting_cost - 会议费用
     */
    public Double getMeetingCost() {
        return meetingCost;
    }

    /**
     * 设置会议费用
     *
     * @param meetingCost 会议费用
     */
    public void setMeetingCost(Double meetingCost) {
        this.meetingCost = meetingCost;
    }

    /**
     * 获取宾馆ID
     *
     * @return hotel_id - 宾馆ID
     */
    public Integer getHotelId() {
        return hotelId;
    }

    /**
     * 设置宾馆ID
     *
     * @param hotelId 宾馆ID
     */
    public void setHotelId(Integer hotelId) {
        this.hotelId = hotelId;
    }

    /**
     * 获取宾馆名称
     *
     * @return hotel_name - 宾馆名称
     */
    public String getHotelName() {
        return hotelName;
    }

    /**
     * 设置宾馆名称
     *
     * @param hotelName 宾馆名称
     */
    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    /**
     * 获取宾馆费用
     *
     * @return hotel_cost - 宾馆费用
     */
    public Double getHotelCost() {
        return hotelCost;
    }

    /**
     * 设置宾馆费用
     *
     * @param hotelCost 宾馆费用
     */
    public void setHotelCost(Double hotelCost) {
        this.hotelCost = hotelCost;
    }

    /**
     * 获取注册人员姓名
     *
     * @return user_name - 注册人员姓名
     */
    public String getUserName() {
        return userName;
    }

    /**
     * 设置注册人员姓名
     *
     * @param userName 注册人员姓名
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * 获取费用小计
     *
     * @return subtotal - 费用小计
     */
    public Double getSubtotal() {
        return subtotal;
    }

    /**
     * 设置费用小计
     *
     * @param subtotal 费用小计
     */
    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }
}