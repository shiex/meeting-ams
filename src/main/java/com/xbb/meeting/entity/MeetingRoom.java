package com.xbb.meeting.entity;

import javax.persistence.*;

@Table(name = "meeting_room")
public class MeetingRoom {
    /**
     * 会议室ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 地点
     */
    private String location;

    /**
     * 费用
     */
    private Double cost;

    /**
     * 人数总容量
     */
    @Column(name = "room_people_count")
    private Integer roomPeopleCount;

    /**
     * 名称
     */
    private String name;

    /**
     * 获取会议室ID
     *
     * @return id - 会议室ID
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置会议室ID
     *
     * @param id 会议室ID
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取地点
     *
     * @return location - 地点
     */
    public String getLocation() {
        return location;
    }

    /**
     * 设置地点
     *
     * @param location 地点
     */
    public void setLocation(String location) {
        this.location = location;
    }

    /**
     * 获取费用
     *
     * @return cost - 费用
     */
    public Double getCost() {
        return cost;
    }

    /**
     * 设置费用
     *
     * @param cost 费用
     */
    public void setCost(Double cost) {
        this.cost = cost;
    }

    /**
     * 获取人数总容量
     *
     * @return room_people_count - 人数总容量
     */
    public Integer getRoomPeopleCount() {
        return roomPeopleCount;
    }

    /**
     * 设置人数总容量
     *
     * @param roomPeopleCount 人数总容量
     */
    public void setRoomPeopleCount(Integer roomPeopleCount) {
        this.roomPeopleCount = roomPeopleCount;
    }

    /**
     * 获取名称
     *
     * @return name - 名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置名称
     *
     * @param name 名称
     */
    public void setName(String name) {
        this.name = name;
    }
}