package com.xbb.meeting.controller.admin;

import com.xbb.meeting.bo.ResponseBean;
import com.xbb.meeting.entity.Hotel;
import com.xbb.meeting.entity.MeetingRoom;
import com.xbb.meeting.mapper.HotelMapper;
import com.xbb.meeting.service.PageHelperService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @author shiex-薛
 * @title: HotelController
 * @projectName meeting-ams
 * @description: TODO
 * @date 2019\10\29 002918:09
 */
@RestController
@RequestMapping("/admin/hotel")
public class HotelController {

    @Resource
    private HotelMapper hotelMapper;
    @Resource
    private PageHelperService pageHelperService;

    @RequestMapping("/list")
    public Map<String, Object> list(@RequestParam("page") int page,
                                    @RequestParam("limit") int limit){
        ResponseBean responseBean = pageHelperService.getResponseBean(
                page,
                limit,
                Hotel.class,
                hotelMapper
        );
        return responseBean.getResponseMap();
    }

    @RequestMapping("/save")
    public Map<String, Object> add(@RequestBody Hotel hotel){
        if (hotel.getId() == null) {
            hotelMapper.insertSelective(hotel);
        } else {
            hotelMapper.updateByPrimaryKeySelective(hotel);
        }
        return new ResponseBean().getResponseMap();
    }

    @RequestMapping("/remove")
    public Map<String, Object> remove(@RequestBody int id){
        hotelMapper.deleteByPrimaryKey(id);
        return new ResponseBean().getResponseMap();
    }

}
