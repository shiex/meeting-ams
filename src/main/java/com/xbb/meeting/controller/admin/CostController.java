package com.xbb.meeting.controller.admin;

import com.xbb.meeting.bo.ResponseBean;
import com.xbb.meeting.entity.Cost;
import com.xbb.meeting.entity.MeetingRoom;
import com.xbb.meeting.mapper.CostMapper;
import com.xbb.meeting.mapper.MeetingRoomMapper;
import com.xbb.meeting.service.PageHelperService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @program: meeting-ams
 * @description:
 * @author: shiex
 * @create: 2019-10-26 16:08
 **/
@RestController
@RequestMapping("/admin/cost")
public class CostController {

    @Resource
    private CostMapper costMapper;
    @Resource
    private PageHelperService pageHelperService;

    @RequestMapping("/list")
    public Map<String, Object> list(@RequestParam("page") int page,
                                    @RequestParam("limit") int limit){
        ResponseBean responseBean = pageHelperService.getResponseBean(
                page,
                limit,
                Cost.class,
                costMapper
        );
        return responseBean.getResponseMap();
    }

}
