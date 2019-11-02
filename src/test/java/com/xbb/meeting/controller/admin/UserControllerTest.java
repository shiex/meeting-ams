package com.xbb.meeting.controller.admin;

import com.xbb.meeting.MeetingAmsApplicationTests;
import com.xbb.meeting.entity.User;
import com.xbb.meeting.mapper.UserMapper;
import org.junit.jupiter.api.Test;

import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

/**
 * @author shiex-薛
 * @title: UserControllerTest
 * @projectName meeting-ams
 * @description: TODO
 * @date 2019\10\26 002618:32
 */
public class UserControllerTest extends MeetingAmsApplicationTests {

    @Resource
    private UserMapper userMapper;

    // 测试数据
    @Test
    public void initData() {
        List<User> userList = new ArrayList<>();
        for (int i=0; i<50; i++) {
            User user = new User();
            user.setUserName("用户名：" + i);
            user.setPassword("密码" + i);
            user.setEmail("邮箱：" + i);
            user.setCellphone("电话：" + i);
            user.setSex(false);
            user.setRoleId(2);
            user.setJobNumber(i);
            userList.add(user);
        }
        userMapper.insertList(userList);
    }

}