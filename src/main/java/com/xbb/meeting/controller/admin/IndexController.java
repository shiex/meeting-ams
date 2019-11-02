package com.xbb.meeting.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @program: meeting-ams
 * @description: 页面跳转控制
 * @author: shiex
 * @create: 2019-10-23 17:11
 **/
@Controller
@RequestMapping("/admin")
public class IndexController {

    @RequestMapping("/index")
    public String indexPage() {
        return "/admin/index";
    }

    @RequestMapping("/meeting/room/index")
    public String adminMeetingIndexPage() {
        return "/admin/meeting_room";
    }

    @RequestMapping("/meeting/index")
    public String meetingIndexPage() {
        return "/admin/meeting";
    }

    @RequestMapping("/user/index")
    public String userIndexPage() {
        return "/admin/user";
    }

    @RequestMapping("/hotel/index")
    public String hotelIndexPage() {
        return "/admin/hotel";
    }

    @RequestMapping("/cost/index")
    public String costIndexPage() {
        return "/admin/cost";
    }



}
