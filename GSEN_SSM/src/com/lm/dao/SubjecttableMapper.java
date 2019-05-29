package com.lm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lm.po.Subjecttable;

/**
 * 学科表
 *
 */
public interface SubjecttableMapper {
	/**
	 * 查询学科
	 * @return
	 */
   List<Subjecttable> selectSubject();
   /**
	 * 根据id查询学科
	 * @return
	 */
	Subjecttable selectSubjectBYid(@Param("subjectId") int subjectId);
}