package com.lm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lm.po.Integraltable;

/**
 * 积分表
 *
 */
public interface IntegraltableMapper {
	/**
	 *  根据老师id查询老师积分信息 
	 * @param teachername
	 * @param integraldirection
	 * @param startTime
	 * @param endTime  
	 * @return
	 */
    List<Integraltable> selectIntegral(@Param("teachername") String teachername,
			@Param("integraldirection") String integraldirection,
			@Param("startTime") String startTime,
			@Param("endTime") String endTime,
			@Param("teacher_id") int teacher_id);
    /**
     * 根据积分id查询积分信息
     * @param integralId
     * @return
     */
    Integraltable selectIntegralBYid(@Param("integralId") int integralId);
    /**
     * 根据积分id修改积分有效否
     * @param integraltable
     * @return
     */
    int updateIntegral(Integraltable integraltable); 
	/**
	 *  根据学生id查询学生积分信息 
	 * @param teachername
	 * @param integraldirection
	 * @param startTime
	 * @param endTime  
	 * @return
	 */
    List<Integraltable> selectIntegralBYstudentId(@Param("name") String name,
			@Param("integraldirection") String integraldirection,
			@Param("startTime") String startTime,
			@Param("endTime") String endTime,
			@Param("studentId") int studentId);
}