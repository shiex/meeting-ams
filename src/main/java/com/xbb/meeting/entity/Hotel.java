package com.xbb.meeting.entity;

import javax.persistence.*;

public class Hotel {
    /**
     * 宾馆表ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 名称
     */
    private String name;

    /**
     * 价格【按天计算】
     */
    private Double cost;

    /**
     * 地址
     */
    private String location;

    /**
     * 获取宾馆表ID
     *
     * @return id - 宾馆表ID
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置宾馆表ID
     *
     * @param id 宾馆表ID
     */
    public void setId(Integer id) {
        this.id = id;
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

    /**
     * 获取价格【按天计算】
     *
     * @return cost - 价格【按天计算】
     */
    public Double getCost() {
        return cost;
    }

    /**
     * 设置价格【按天计算】
     *
     * @param cost 价格【按天计算】
     */
    public void setCost(Double cost) {
        this.cost = cost;
    }

    /**
     * 获取地址
     *
     * @return location - 地址
     */
    public String getLocation() {
        return location;
    }

    /**
     * 设置地址
     *
     * @param location 地址
     */
    public void setLocation(String location) {
        this.location = location;
    }
}