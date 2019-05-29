package com.lm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lm.po.Coursetable;
import com.lm.vo.CourseVo;

/**
 * 课件表
 *
 */
public interface CoursetableMapper {
	/**
	 * 根据老师id查询课件信息
	 * @return
	 */
	List<CourseVo> selectCourseALL(@Param("coursename") String coursename,
			@Param("teachversionId") int teachversionId,
			@Param("gradeId") int gradeId,
			@Param("teacher_id") int teacher_id);
	/**
	 * 新增课件包
	 * @param coursetable
	 * @return
	 */
	int insertCourse(Coursetable coursetable);
	/**
	 * 根据课件包名称和老师id查询课件包
	 * @param coursename
	 * @return
	 */
	List<Coursetable> selectCourseBYcoursename(@Param("coursename") String coursename,
          @Param("teacher_id") int teacher_id);
	/**
	 * 根据课件包id查询课件包信息
	 * @param courseId
	 * @return
	 */
	Coursetable selectCourseBYid(@Param("courseId") int courseId);
	/**
	 * 修改课件包信息
	 * @param coursetable
	 * @return
	 */
	int updateCourse(Coursetable coursetable);
	/**
	 * 修改课件时查询课件包名称是否唯一
	 * @param coursename
	 * @param teacher_id
	 * @param courseId
	 * @return
	 */
	List<Coursetable> selectCourseNameOnly(@Param("coursename") String coursename,
	          @Param("teacher_id") int teacher_id,@Param("courseId") int courseId);
	/**
	 * 根据课件id进行删除
	 * @param courseId
	 * @return
	 */
	int deleteCourse(@Param("courseId") int courseId);
}