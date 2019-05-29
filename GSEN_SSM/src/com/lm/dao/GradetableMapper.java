package com.lm.dao;

import java.util.List;

import com.lm.po.Gradetable;

/**
 * 年级表
 *
 */
public interface GradetableMapper {
	/**
	 * 查询年级
	 * @return
	 */
	List<Gradetable> selectGrade();
	/**
	 * 根据id查询年级
	 */
	Gradetable selectGradeBYid(int gradeId);
}