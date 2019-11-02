package com.xbb.meeting.mapper;

import com.xbb.meeting.entity.Meeting;
import tk.mapper.TkMapper;

public interface MeetingMapper extends TkMapper<Meeting> {
    Meeting selectJoinTable(int id);
}