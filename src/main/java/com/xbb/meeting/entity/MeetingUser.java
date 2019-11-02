package com.xbb.meeting.entity;

import javax.persistence.*;

@Table(name = "meeting_user")
public class MeetingUser {
    /**
     * 会议人员列表ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 人员ID
     */
    @Column(name = "user_id")
    private Integer userId;

    /**
     * 会议ID
     */
    @Column(name = "meeting_id")
    private Integer meetingId;

    /**
     * 人员名称
     */
    @Column(name = "user_name")
    private String userName;

    /**
     * 获取会议人员列表ID
     *
     * @return id - 会议人员列表ID
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置会议人员列表ID
     *
     * @param id 会议人员列表ID
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取人员ID
     *
     * @return user_id - 人员ID
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * 设置人员ID
     *
     * @param userId 人员ID
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
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
     * 获取人员名称
     *
     * @return user_name - 人员名称
     */
    public String getUserName() {
        return userName;
    }

    /**
     * 设置人员名称
     *
     * @param userName 人员名称
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }
}