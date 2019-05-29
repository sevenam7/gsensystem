package com.lm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lm.po.Studenttable;

/**
 * 学生表
 *
 */
public interface StudenttableMapper {
 /**
  * 查询学生信息
  * @param name
  * @param enabledbit
  * @param startTime
  * @param endTime
  * @return
  */
    List<Studenttable> selectStudentALL(@Param("name") String name,
    		@Param("enabledbit") int enabledbit,
			@Param("startTime") String startTime,
			@Param("endTime") String endTime
			);
    /**
     * 根据学生id查询学生信息
     * @param studentId
     * @return
     */
    Studenttable selectStudentBYid(@Param("studentId") int studentId);
    /**
     * 根据学生id修改学生启用否
     * @param studenttable
     * @return
     */
    int updateStudentBYstudentId(Studenttable studenttable);
}