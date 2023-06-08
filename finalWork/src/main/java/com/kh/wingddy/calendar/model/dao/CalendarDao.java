package com.kh.wingddy.calendar.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wingddy.calendar.model.vo.Calendar;

@Repository
public class CalendarDao {

	public int insertSchedule(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.insert("calendar-mapper.insertSchedule", c);
	}
	
	public ArrayList<Calendar> selectScheduleList(SqlSessionTemplate sqlSession, int memberNo){
		return (ArrayList)sqlSession.selectList("calendar-mapper.selectScheduleList", memberNo);
	}
	
	public ArrayList<Calendar> selectDaySchedule(SqlSessionTemplate sqlSession, HashMap map){
		return (ArrayList)sqlSession.selectList("calendar-mapper.selectDaySchedule", map);
	}
	
	public int deleteSchedule(SqlSessionTemplate sqlSession, int scheduleNo) {
		return sqlSession.delete("calendar-mapper.deleteSchedule", scheduleNo);
	}
	
	public int updateSchedule(SqlSessionTemplate sqlsession, Calendar c) {
		return sqlsession.update("calendar-mapper.updateSchedule", c);
	}
	
	
}