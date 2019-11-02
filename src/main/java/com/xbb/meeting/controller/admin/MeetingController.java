package com.xbb.meeting.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xbb.meeting.bo.ResponseBean;
import com.xbb.meeting.constant.WebConstant;
import com.xbb.meeting.entity.*;
import com.xbb.meeting.mapper.*;
import com.xbb.meeting.service.PageHelperService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.servlet.http.WebConnection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @program: meeting-ams
 * @description:
 * @author: shiex
 * @create: 2019-10-23 14:47
 **/
@Controller
@RequestMapping("/admin/meeting")
public class MeetingController {

    @Resource
    private MeetingMapper meetingMapper;
    @Resource
    private PageHelperService pageHelperService;
    @Resource
    private MeetingRoomMapper meetingRoomMapper;
    @Resource
    private HotelMapper hotelMapper;
    @Resource
    private MeetingUserMapper meetingUserMapper;
    @Resource
    private CostMapper costMapper;

    @ResponseBody
    @RequestMapping("/list")
    public Map<String, Object> list(@RequestParam("page") int page,
                                    @RequestParam("limit") int limit){
        ResponseBean responseBean = pageHelperService.getResponseBean(
                page,
                limit,
                Meeting.class,
                meetingMapper
        );
        return responseBean.getResponseMap();
    }

    @RequestMapping("/{id}.html")
    public String meetingPage(@PathVariable("id") int id, Model model) {
        model.addAttribute("meeting", meetingMapper.selectJoinTable(id));
        return "/admin/meeting_look";
    }

    @RequestMapping("/add.html")
    public String addPage(Model model) {
        model.addAttribute("meetingRoomList", meetingRoomMapper.selectAll());
        model.addAttribute("hotelList", hotelMapper.selectAll());
        return "/admin/meeting_add";
    }

    @ResponseBody
    @RequestMapping("/add")
    public Map<String, Object> add(@RequestBody Meeting meeting, HttpSession session){
        User user = (User) session.getAttribute(WebConstant.SESSION_KEY_USER);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        meeting.setUserId(user.getId());
        meeting.setUserName(user.getUserName());
        meeting.setRegisterTime(sdf.format(new Date()));
        meeting.setMeetingPeopleCount(meeting.getMeetingUserList().size());
        meetingMapper.insertSelective(meeting);

        for (MeetingUser meetingUser : meeting.getMeetingUserList()) {
            meetingUser.setId(meeting.getId());
        }
        meetingUserMapper.insertList(meeting.getMeetingUserList());

        MeetingRoom meetingRoom = meetingRoomMapper.selectByPrimaryKey(meeting.getMeetingRoomId());
        Hotel hotel = hotelMapper.selectByPrimaryKey(meeting.getHotelId());

        Cost cost = new Cost();
        cost.setUserName(user.getUserName());
        cost.setMeetingId(meeting.getId());
        cost.setMeetingTitle(meeting.getTitle());
        cost.setMeetingCost(meetingRoom.getCost());
        cost.setHotelId(meeting.getId());
        cost.setHotelCost(hotel.getCost());
        cost.setHotelName(hotel.getName());
        cost.setSubtotal(meetingRoom.getCost() + hotel.getCost());
        costMapper.insertSelective(cost);

        return new ResponseBean().getResponseMap();
    }

    @RequestMapping("/edit/{id}")
    public String editPage(@PathVariable("id") int id, Model model){
        model.addAttribute("meeting", meetingMapper.selectByPrimaryKey(id));
        model.addAttribute("edit", true);
        return "/admin/meeting-save";
    }

    @ResponseBody
    @RequestMapping("/save")
    public Map<String, Object> save(@RequestBody Meeting meeting){
        meetingMapper.updateByPrimaryKeySelective(meeting);
        return new ResponseBean().getResponseMap();
    }

    @ResponseBody
    @RequestMapping("/remove")
    public Map<String, Object> remove(@RequestBody int id){
        meetingMapper.deleteByPrimaryKey(id);
        return new ResponseBean().getResponseMap();
    }

}
