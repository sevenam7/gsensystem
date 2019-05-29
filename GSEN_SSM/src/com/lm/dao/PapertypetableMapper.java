package com.lm.dao;

import java.util.List;

import com.lm.po.Papertypetable;

/**
 * 试卷类型表
 */
public interface PapertypetableMapper {
	/**
	 * 查询试卷类型
	 * @return
	 */
    List<Papertypetable> selectPapertype();
    
}