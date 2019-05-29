package com.lm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lm.po.Courseevatable;
import com.lm.vo.CourseVo;

/**
 * 课件评价表
 *
 */
public interface CourseevatableMapper {
	/**
	 * -查询课件评价信息 
	 * @param coursename
	 * @param name
	 * @param enabledbit
	 * @return
	 */
   List<CourseVo> selectCourseevaALL(@Param("coursename") String coursename,
			@Param("name") String name,
			@Param("enabledbit") int enabledbit);
   /**
    * 根据课件评价id查询课件评价信息
    * @param courseevaId
    * @return
    */
   Courseevatable selectCourseevaBYid(@Param("courseevaId") int courseevaId);
   /**
    * 根据课件评价id修改评价启用否
    * @param courseevatable
    * @return
    */
   int  exCourseevaBYid(Courseevatable courseevatable);
   /**
    * 根据课件包id查询课件评价信息
    * @param courseId
    * @return
    */
   List<Courseevatable> selectCourseevaBYcourseId(@Param("courseId") int courseId);
   /**
    * 根据课件id删除课件评价信息
    * @param courseId
    * @return
    */
   int deleteCourseevaBYcourseId(@Param("courseId") int courseId);
}