package com.lm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lm.po.Titletypetable;

/**
 * 题目类型表
 *
 */
public interface TitletypetableMapper {
	/**
	 * 新增题目类型
	 * @param titletypetable
	 * @return
	 */
   int insertTitletype(Titletypetable titletypetable);
   /**
    * 查询最大的题目类型id
    * @return
    */
   Titletypetable selectTitletypeId_MAX();
   /**
    * 根据题目类型id进行删除题目类型
    * @param papeId
    * @return
    */
   int deleteTitleType(@Param("titletypeId") int titletypeId);
   /**
    * 根据试卷id查询题目类型
    * @return
    */
   List<Titletypetable> selectTitleTyle_paperid(@Param("papeId") int papeId);

}