package com.xbb.meeting.controller.admin;

import com.xbb.meeting.MeetingAmsApplicationTests;
import com.xbb.meeting.entity.Hotel;
import com.xbb.meeting.mapper.HotelMapper;
import org.apache.catalina.LifecycleState;
import org.junit.jupiter.api.Test;

import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

/**
 * @author shiex-薛
 * @title: HotelControllerTest
 * @projectName meeting-ams
 * @description: TODO
 * @date 2019\10\29 002918:36
 */
public class HotelControllerTest extends MeetingAmsApplicationTests {

    @Resource
    private HotelMapper hotelMapper;

    // 测试数据
    @Test
    public void initData() {
        List<Hotel> hotelList = new ArrayList<>();
        for (int i=0; i<20; i++) {
            Hotel hotel = new Hotel();
            hotel.setLocation("地址：" + i);
            hotel.setCost((double)i);
            hotel.setName("宾馆名称：" + i);
            hotelList.add(hotel);
        }
        hotelMapper.insertList(hotelList);
    }

}