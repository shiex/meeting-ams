package com.xbb.meeting.controller.admin;

import com.xbb.meeting.bo.ResponseBean;
import com.xbb.meeting.entity.Meeting;
import com.xbb.meeting.entity.MeetingRoom;
import com.xbb.meeting.mapper.MeetingMapper;
import com.xbb.meeting.mapper.MeetingRoomMapper;
import com.xbb.meeting.service.PageHelperService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @program: meeting-ams
 * @description:
 * @author: shiex
 * @create: 2019-10-26 16:08
 **/
@RestController
@RequestMapping("/admin/meeting/room")
public class MeetingRoomController {

    @Resource
    private MeetingRoomMapper meetingRoomMapper;
    @Resource
    private PageHelperService pageHelperService;

    @RequestMapping("/list")
    public Map<String, Object> list(@RequestParam("page") int page,
                                    @RequestParam("limit") int limit){
        ResponseBean responseBean = pageHelperService.getResponseBean(
                page,
                limit,
                MeetingRoom.class,
                meetingRoomMapper
        );
        return responseBean.getResponseMap();
    }

    @RequestMapping("/save")
    public Map<String, Object> add(@RequestBody MeetingRoom meetingRoom){
        if (meetingRoom.getId() == null) {
            meetingRoomMapper.insertSelective(meetingRoom);
        } else {
            meetingRoomMapper.updateByPrimaryKeySelective(meetingRoom);
        }
        return new ResponseBean().getResponseMap();
    }

    @RequestMapping("/remove")
    public Map<String, Object> remove(@RequestBody int id){
        meetingRoomMapper.deleteByPrimaryKey(id);
        return new ResponseBean().getResponseMap();
    }

}
