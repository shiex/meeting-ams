package com.xbb.meeting.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xbb.meeting.bo.ResponseBean;
import com.xbb.meeting.entity.Meeting;
import com.xbb.meeting.service.PageHelperService;
import org.springframework.stereotype.Service;
import tk.mapper.TkMapper;
import tk.mybatis.mapper.entity.Example;

/**
 * @program: meeting-ams
 * @description:
 * @author: shiex
 * @create: 2019-10-27 09:15
 **/
@Service("pageHelperService")
public class PageHelperServiceImpl<T> implements PageHelperService<T> {
    @Override
    public ResponseBean getResponseBean(int page, int limit, Class<?> cls, TkMapper tkMapper) {
        PageHelper.startPage(page, limit);
        Example example = new Example(cls);
        PageInfo<T> pageInfo = new PageInfo<>(tkMapper.selectByExample(example));
        ResponseBean responseBean = new ResponseBean();
        responseBean.putPageData(pageInfo.getList(), pageInfo.getTotal());
        return responseBean;
    }
}
