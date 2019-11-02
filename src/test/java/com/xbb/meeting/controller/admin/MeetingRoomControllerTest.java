package com.xbb.meeting.controller.admin;

import com.xbb.meeting.entity.MeetingRoom;
import com.xbb.meeting.mapper.MeetingRoomMapper;
import org.junit.jupiter.api.Test;

import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

/**
 * @author shiex-薛
 * @title: MeetingRoomControllerTest
 * @projectName meeting-ams
 * @description: TODO
 * @date 2019\10\26 002618:10
 */
public class MeetingRoomControllerTest extends MeetingControllerTest {

    @Resource
    private MeetingRoomMapper meetingRoomMapper;

    // 测试数据
    @Test
    public void initData() {
        List<MeetingRoom> meetingRoomList = new ArrayList<>();
        for (int i=0; i<50; i++) {
            MeetingRoom meetingRoom = new MeetingRoom();
            meetingRoom.setName("名称：" + i);
            meetingRoom.setLocation("地址：" + i);
            meetingRoom.setRoomPeopleCount(i);
            meetingRoom.setCost((double) i);
            meetingRoomList.add(meetingRoom);
        }
        meetingRoomMapper.insertList(meetingRoomList);
    }

}