package com.lm.dao;

import java.util.List;

import com.lm.po.Teachertitletable;

/**
 * 教师职称表
 */
public interface TeachertitletableMapper {
	/**
	 * 查询教师职称
	 * @return
	 */
    List<Teachertitletable> selectTeachertitle();
}