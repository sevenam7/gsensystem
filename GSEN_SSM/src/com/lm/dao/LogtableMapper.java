package com.lm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lm.po.Logtable;

/**
 * 日志表
 *
 */
public interface LogtableMapper {
	/**
	 * 查询日志信息
	 */
    List<Logtable> selectLog(@Param("name") String name,
			@Param("userType_id") int userType_id);
    /**
     * 新增日志
     * @param logtable
     * @return
     */
    int insertLog(Logtable logtable);
}