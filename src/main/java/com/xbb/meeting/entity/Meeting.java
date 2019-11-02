package com.xbb.meeting.entity;

import javax.persistence.*;
import java.util.List;
import java.util.Map;

public class Meeting {
    /**
     * 会议表ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 标题
     */
    private String title;

    /**
     * 注册时间
     */
    @Column(name = "register_time")
    private String registerTime;

    /**
     * 注册人员
     */
    @Column(name = "user_id")
    private Integer userId;

    /**
     * 会议人数
     */
    @Column(name = "meeting_people_count")
    private Integer meetingPeopleCount;

    /**
     * 开始时间
     */
    @Column(name = "start_time")
    private String startTime;

    /**
     * 结束时间
     */
    @Column(name = "end_time")
    private String endTime;

    /**
     * 会议室ID
     */
    @Column(name = "meeting_room_id")
    private Integer meetingRoomId;

    /**
     * 注册人员名称
     */
    @Column(name = "user_name")
    private String userName;

    /**
     * 宾馆ID
     */
    @Column(name = "hotel_id")
    private Integer hotelId;

    /**
     * 大纲
     */
    private String outline;

    private MeetingRoom meetingRoom;
    private Hotel hotel;
    private List<User> userList;
    private List<MeetingUser> meetingUserList;

    /**
     * 获取会议表ID
     *
     * @return id - 会议表ID
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置会议表ID
     *
     * @param id 会议表ID
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取标题
     *
     * @return title - 标题
     */
    public String getTitle() {
        return title;
    }

    /**
     * 设置标题
     *
     * @param title 标题
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * 获取注册时间
     *
     * @return register_time - 注册时间
     */
    public String getRegisterTime() {
        return registerTime;
    }

    /**
     * 设置注册时间
     *
     * @param registerTime 注册时间
     */
    public void setRegisterTime(String registerTime) {
        this.registerTime = registerTime;
    }

    /**
     * 获取注册人员
     *
     * @return user_id - 注册人员
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * 设置注册人员
     *
     * @param userId 注册人员
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 获取会议人数
     *
     * @return meeting_people_count - 会议人数
     */
    public Integer getMeetingPeopleCount() {
        return meetingPeopleCount;
    }

    /**
     * 设置会议人数
     *
     * @param meetingPeopleCount 会议人数
     */
    public void setMeetingPeopleCount(Integer meetingPeopleCount) {
        this.meetingPeopleCount = meetingPeopleCount;
    }

    /**
     * 获取开始时间
     *
     * @return start_time - 开始时间
     */
    public String getStartTime() {
        return startTime;
    }

    /**
     * 设置开始时间
     *
     * @param startTime 开始时间
     */
    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    /**
     * 获取结束时间
     *
     * @return end_time - 结束时间
     */
    public String getEndTime() {
        return endTime;
    }

    /**
     * 设置结束时间
     *
     * @param endTime 结束时间
     */
    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    /**
     * 获取会议室ID
     *
     * @return meeting_room_id - 会议室ID
     */
    public Integer getMeetingRoomId() {
        return meetingRoomId;
    }

    /**
     * 设置会议室ID
     *
     * @param meetingRoomId 会议室ID
     */
    public void setMeetingRoomId(Integer meetingRoomId) {
        this.meetingRoomId = meetingRoomId;
    }

    /**
     * 获取注册人员名称
     *
     * @return user_name - 注册人员名称
     */
    public String getUserName() {
        return userName;
    }

    /**
     * 设置注册人员名称
     *
     * @param userName 注册人员名称
     */
    public void setUserName(String userName) {
        this.userName = userName;
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
     * 获取大纲
     *
     * @return outline - 大纲
     */
    public String getOutline() {
        return outline;
    }

    /**
     * 设置大纲
     *
     * @param outline 大纲
     */
    public void setOutline(String outline) {
        this.outline = outline;
    }

    public MeetingRoom getMeetingRoom() {
        return meetingRoom;
    }

    public void setMeetingRoom(MeetingRoom meetingRoom) {
        this.meetingRoom = meetingRoom;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    public List<MeetingUser> getMeetingUserList() {
        return meetingUserList;
    }

    public void setMeetingUserList(List<MeetingUser> meetingUserList) {
        this.meetingUserList = meetingUserList;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }
}