package com.lm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lm.po.Teachertable;
import com.lm.vo.TeaVo;

/**
 * 老师管理
 *
 */
public interface TeachertableMapper {
	/**
	 * 查询老师信息
	 * @param teachername
	 * @param graduationcollege
	 * @param subjectId
	 * @param startTime
	 * @param endTime
	 * @param teaTitle_id
	 * @param examineBit
	 * @return
	 */
	List<TeaVo> selectTeacherALL(@Param("teachername") String teachername,
			@Param("graduationcollege") String graduationcollege,
			@Param("subjectId") int subjectId,
			@Param("startTime") String startTime,
			@Param("endTime") String endTime,
			@Param("teaTitle_id") int teaTitle_id,
			@Param("examineBit") int examineBit);
	/**
	 * 根据id查询老师信息
	 * @param teacherId
	 * @return
	 */
	Teachertable selectTeacherBYid(@Param("teacherId") int teacherId);
	/**
	 * 修改老师信息
	 * @param teachertable
	 * @return
	 */
	int updateTeacher(Teachertable teachertable);
}