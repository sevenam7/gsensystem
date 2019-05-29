package com.lm.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lm.po.Papertable;
import com.lm.po.Papertypetable;
import com.lm.po.Titletable;
import com.lm.po.Titletypetable;

/**
 * 试卷
 */
public interface IYearTruthService {
	  /**
     *  查询试卷
     * @param papername
     * @param papertypeId
     * @param subjectId
     * @return
     */
    List<Papertable> selectPaper(@Param("papername") String papername,
			@Param("papertypeId") int papertypeId,
			@Param("subjectId") int subjectId);
	/**
	 * 查询试卷类型
	 * @return
	 */
    List<Papertypetable> selectPapertype();
    /**
     * 新增试卷
     * @param papertable
     * @return
     */
    int insertPaper(Papertable papertable);
    /**
     * 根据试卷名称查询试卷
     * @param papername
     * @return
     */
    List<Papertable> selectPaperBYpaperName(@Param("papername") String papername);
    /**
	 * 新增题目类型
	 * @param titletypetable
	 * @return
	 */
   int insertTitletype(Titletypetable titletypetable);
   /**
	 * 新增题目
	 * @param titletable
	 * @return
	 */
   int insertTitle(Titletable titletable);
   /**
    *  查询最大的试卷id
    * @return
    */
   Papertable selectpapeId_MAX();
    /**
     * 查询最大的题目类型id
     * @return
     */
   Titletypetable selectTitletypeId_MAX();
   /**
    * 根据id进行删除试卷
    * @param papeId
    * @return
    */
   int deletePaper(@Param("papeId") int papeId);
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
   /**
    * 根据试卷id查询试卷信息
    * @param papeId
    * @return
    */
   Papertable selectpaperBYpaperid(@Param("papeId") int papeId);
   /**
    * 修改试卷时查询试卷名称是否唯一
    * @param papername
    * @param papeId
    * @return
    */
   List<Papertable> selectPaperNameOnly(@Param("papername") String papername,@Param("papeId") int papeId);
   /**
    * 修改试卷信息
    * @param papeId
    * @return
    */
   int updatePaperBYpapeId(Papertable papertable);

}
