package com.lm.dao;

import java.util.List;

import com.lm.po.Teachversiontable;

/**
 * 教学版本表
 *
 */
public interface TeachversiontableMapper {
	/**
	 * 查询教学版本
	 * @return
	 */
    List<Teachversiontable> selectTeachversion();
    /**
     * 根据id查询教学版本
     * @param teachversionId
     * @return
     */
    Teachversiontable selectTeachversionBYid(int teachversionId);
}