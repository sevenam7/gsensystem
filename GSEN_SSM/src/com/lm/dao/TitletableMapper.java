package com.lm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lm.po.Titletable;

/**
 * 题目表
 *
 */
public interface TitletableMapper {
	/**
	 * 新增题目
	 * @param titletable
	 * @return
	 */
   int insertTitle(Titletable titletable);
   /**
    * 根据题目类型id查询题目
    * @param titletypeId
    * @return
    */
   List<Titletable> selectTitle_titleTypeid(@Param("titletypeId") int titletypeId);
   /**
    * 根据题目id进行删除题目
    * @param titletypeId
    * @return
    */
   int deleteTitle(@Param("titleId") int titleId);
}