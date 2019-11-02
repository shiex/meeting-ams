package com.xbb.meeting.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xbb.meeting.bo.ResponseBean;
import com.xbb.meeting.constant.WebConstant;
import com.xbb.meeting.entity.Meeting;
import com.xbb.meeting.entity.MeetingRoom;
import com.xbb.meeting.entity.User;
import com.xbb.meeting.mapper.UserMapper;
import com.xbb.meeting.service.PageHelperService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.Map;

/**
 * @program: meeting-ams
 * @description:
 * @author: shiex
 * @create: 2019-10-23 17:11
 **/
@Controller
@RequestMapping("/admin/user")
public class UserController {

    @Resource
    private UserMapper userMapper;
    @Resource
    private PageHelperService pageHelperService;

    @RequestMapping("/login")
    public String loginPage() {
        return "/admin/login";
    }

    @RequestMapping("/register")
    public String registerPage() {
        return "/admin/register";
    }

    @ResponseBody
    @RequestMapping("/login.do")
    public Map<String, Object> login(@RequestBody User u, HttpSession session){
        ResponseBean responseBean = new ResponseBean();
        User user = userMapper.selectOne(u);
        if (user == null) {
            responseBean.putError("用户名/密码错误");
        } else {
            session.setAttribute(WebConstant.SESSION_KEY_USER, user);
        }
        return responseBean.getResponseMap();
    }

    @ResponseBody
    @RequestMapping("/register.do")
    public Map<String, Object> register(@RequestBody User u, HttpSession session){
        ResponseBean responseBean = new ResponseBean();
        User selectUser = new User();
        selectUser.setUserName(u.getUserName());
        User user = userMapper.selectOne(selectUser);
        if (user == null) {
            u.setRegisterTime(new Date());
            userMapper.insertSelective(u);
        } else {
            responseBean.putError("该用户已存在，请直接登录");
        }
        return responseBean.getResponseMap();
    }

    @RequestMapping("/login.out")
    public String loginOut(HttpSession session) {
        session.removeAttribute(WebConstant.SESSION_KEY_USER);
        return "/admin/user/login";
    }

    @ResponseBody
    @RequestMapping("/list")
    public Map<String, Object> list(@RequestParam("page") int page,
                                    @RequestParam("limit") int limit){
        ResponseBean responseBean = pageHelperService.getResponseBean(
                page,
                limit,
                User.class,
                userMapper
        );
        return responseBean.getResponseMap();
    }

    @ResponseBody
    @RequestMapping("/save")
    public Map<String, Object> add(@RequestBody User user){
        if (user.getId() == null) {
            userMapper.insertSelective(user);
        } else {
            userMapper.updateByPrimaryKeySelective(user);
        }
        return new ResponseBean().getResponseMap();
    }

    @ResponseBody
    @RequestMapping("/remove")
    public Map<String, Object> remove(@RequestBody int id){
        userMapper.deleteByPrimaryKey(id);
        return new ResponseBean().getResponseMap();
    }

    @ResponseBody
    @RequestMapping("/list/all")
    public Map<String, Object> listAll(){
        ResponseBean responseBean = new ResponseBean();
        responseBean.putData("data", userMapper.selectAll());
        return responseBean.getResponseMap();
    }

    @RequestMapping("/data")
    public String dataPage(Model model, HttpSession session) {
        return "/admin/user_data";
    }

    @RequestMapping("/data/edit")
    public String editDataPage(Model model, HttpSession session) {
        return "/admin/user_edit_data";
    }

    @ResponseBody
    @RequestMapping("/data/save")
    public Map<String , Object> saveData(@RequestBody User user, HttpSession session) {
        User u = (User) session.getAttribute(WebConstant.SESSION_KEY_USER);
        user.setId(u.getId());
        userMapper.updateByPrimaryKeySelective(user);
        return new ResponseBean().getResponseMap();
    }

    @RequestMapping("/password")
    public String passwordPage() {
        return "/admin/user_password";
    }

    @ResponseBody
    @RequestMapping("/password/save")
    public Map<String , Object> savePassword(@RequestBody User user, HttpSession session) {
        User u = (User) session.getAttribute(WebConstant.SESSION_KEY_USER);
        user.setId(u.getId());
        userMapper.updateByPrimaryKeySelective(user);
        return new ResponseBean().getResponseMap();
    }

}
