package com.xbb.meeting;

import com.xbb.meeting.entity.User;
import com.xbb.meeting.mapper.UserMapper;
import org.apache.catalina.startup.Tomcat;
import org.junit.jupiter.api.Test;
import org.springframework.boot.jdbc.metadata.TomcatDataSourcePoolMetadata;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import javax.sql.DataSource;

@SpringBootTest
public class MeetingAmsApplicationTests {

    @Test
    void contextLoads() {

    }

}
