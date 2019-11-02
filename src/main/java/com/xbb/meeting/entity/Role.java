package com.xbb.meeting.entity;

import javax.persistence.*;

public class Role {
    /**
     * 角色表ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 角色名称
     */
    @Column(name = "role_name")
    private String roleName;

    /**
     * 获取角色表ID
     *
     * @return id - 角色表ID
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置角色表ID
     *
     * @param id 角色表ID
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取角色名称
     *
     * @return role_name - 角色名称
     */
    public String getRoleName() {
        return roleName;
    }

    /**
     * 设置角色名称
     *
     * @param roleName 角色名称
     */
    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}