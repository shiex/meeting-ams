package com.xbb.meeting;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import tk.mybatis.spring.annotation.MapperScan;

@SpringBootApplication
@MapperScan("com.xbb.meeting.mapper")
public class MeetingAmsApplication {

    public static void main(String[] args) {
        SpringApplication.run(MeetingAmsApplication.class, args);
    }

}
