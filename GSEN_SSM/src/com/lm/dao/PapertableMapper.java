package com.lm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lm.po.Papertable;

/**
 * 试卷表
 */
public interface PapertableMapper {
	/**
	 * 查询试卷名称和试卷id
	 * @return
	 */
    List<Papertable> selectpaperName();
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
    *  查询最大的试卷id
    * @return
    */
    Papertable selectpapeId_MAX();
    /**
     * 根据id进行删除试卷
     * @param papeId
     * @return
     */
    int deletePaper(@Param("papeId") int papeId);
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