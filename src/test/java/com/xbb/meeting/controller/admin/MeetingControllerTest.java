package com.xbb.meeting.controller.admin;

import com.xbb.meeting.MeetingAmsApplicationTests;
import com.xbb.meeting.entity.Meeting;
import com.xbb.meeting.mapper.MeetingMapper;
import org.junit.jupiter.api.Test;

import javax.annotation.Resource;
import javax.xml.crypto.Data;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

public class MeetingControllerTest extends MeetingAmsApplicationTests {

    @Resource
    private MeetingMapper meetingMapper;

    // 测试数据
    @Test
    public void initData() {
        Random random = new Random();
        List<Meeting> meetingList = new ArrayList<>();
        for (int i=0; i<200; i++) {
            Meeting meeting = new Meeting();
            meeting.setTitle("会议标题：" + i);
            meeting.setOutline("会议大纲：" + i);
            meeting.setUserId(random.nextInt(49) + 1);
            meeting.setMeetingPeopleCount(i);
            meeting.setStartTime("2019-10-26 10:09:00");
            meeting.setEndTime("2019-10-26 10:09:11");
            meeting.setRegisterTime("2019-10-26 10:08:01");
            meeting.setMeetingRoomId(random.nextInt(49) + 1);
            meetingList.add(meeting);
        }
        meetingMapper.insertList(meetingList);
    }

}