package com.xbb.meeting.service;

import com.xbb.meeting.bo.ResponseBean;
import tk.mapper.TkMapper;

public interface PageHelperService<T> {
    ResponseBean getResponseBean(int page, int limit, Class<?> cls, TkMapper tkMapper);
}
