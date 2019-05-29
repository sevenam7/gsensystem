package com.lm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lm.dao.PapertableMapper;
import com.lm.dao.PapertypetableMapper;
import com.lm.dao.TitletableMapper;
import com.lm.dao.TitletypetableMapper;
import com.lm.po.Papertable;
import com.lm.po.Papertypetable;
import com.lm.po.Titletable;
import com.lm.po.Titletypetable;
import com.lm.service.IYearTruthService;
/**
 * 历年真题
 */
@Transactional//事务
@Service("iYearTruthService")//服务层注解
public class YearTruthServiceimpl implements IYearTruthService {
	//注入dao层
	//试卷表
    @Autowired
	private PapertableMapper papertableMapper;
	//试卷类型表
    @Autowired
    private PapertypetableMapper papertypetableMapper;
    //题目类型表
    @Autowired
    private TitletypetableMapper titletypetableMapper;
    //题目表
    @Autowired
    private TitletableMapper titletableMapper;
    
	/**
	 * 查询试卷
	 */
	@Override
	public List<Papertable> selectPaper(String papername, int papertypeId,
			int subjectId) {
		// TODO Auto-generated method stub
		return papertableMapper.selectPaper(papername, papertypeId, subjectId);
	}
	/**
	 * 查询试卷类型
	 * @return
	 */
	@Override
	public List<Papertypetable> selectPapertype() {
		// TODO Auto-generated method stub
		return papertypetableMapper.selectPapertype();
	}
	/**
	 * 新增试卷
	 */
	@Override
	public int insertPaper(Papertable papertable) {
		// TODO Auto-generated method stub
		return papertableMapper.insertPaper(papertable);
	}
	/**
	 *  根据试卷名称查询试卷
	 */
	@Override
	public List<Papertable> selectPaperBYpaperName(String papername) {
		// TODO Auto-generated method stub
		return papertableMapper.selectPaperBYpaperName(papername);
	}
	/**
	 * 新增题目类型
	 */
	@Override
	public int insertTitletype(Titletypetable titletypetable) {
		// TODO Auto-generated method stub
		return titletypetableMapper.insertTitletype(titletypetable);
	}
	/**
	 * 新增题目
	 * @param titletable
	 * @return
	 */
	@Override
	public int insertTitle(Titletable titletable) {
		// TODO Auto-generated method stub
		return titletableMapper.insertTitle(titletable);
	}
	 /**
	    *  查询最大的试卷id
	    * @return
	    */
	@Override
	public Papertable selectpapeId_MAX() {
		// TODO Auto-generated method stub
		return papertableMapper.selectpapeId_MAX();
	}
	 /**
     * 查询最大的题目类型id
     * @return
     */
	@Override
	public Titletypetable selectTitletypeId_MAX() {
		// TODO Auto-generated method stub
		return titletypetableMapper.selectTitletypeId_MAX();
	}
	/**
	 * 根据id进行删除试卷
	 */
	@Override
	public int deletePaper(int papeId) {
		// TODO Auto-generated method stub
		return papertableMapper.deletePaper(papeId);
	}

	/**
	 * 根据题目类型id进行删除题目类型
	 * @param papeId
	 * @return
	 */
	@Override
	public int deleteTitleType(int titletypeId) {
		// TODO Auto-generated method stub
		return titletypetableMapper.deleteTitleType(titletypeId);
	}
	/**
	 * 根据试卷id查询题目类型
	 */
	@Override
	public List<Titletypetable> selectTitleTyle_paperid(int papeId) {
		// TODO Auto-generated method stub
		return titletypetableMapper.selectTitleTyle_paperid(papeId);
	}
	   /**
	    * 根据题目类型id查询题目
	    * @param titletypeId
	    * @return
	    */
	@Override
	public List<Titletable> selectTitle_titleTypeid(int titletypeId) {
		// TODO Auto-generated method stub
		return titletableMapper.selectTitle_titleTypeid(titletypeId);
	}
	/**
	 * 根据题目id进行删除题目
	 */
	@Override
	public int deleteTitle(int titleId) {
		// TODO Auto-generated method stub
		return titletableMapper.deleteTitle(titleId);
	}

	/**
	 * 根据试卷id查询试卷信息
	 * @param papeId
	 * @return
	 */
	//@Override
	public Papertable selectpaperBYpaperid(int papeId) {
		// TODO Auto-generated method stub
		return papertableMapper.selectpaperBYpaperid(papeId);
	}
	/**
	 * 修改试卷时查询试卷名称是否唯一
	 */
	@Override
	public List<Papertable> selectPaperNameOnly(String papername, int papeId) {
		// TODO Auto-generated method stub
		return papertableMapper.selectPaperNameOnly(papername, papeId);
	}
	/**
	 * 修改试卷信息
	 */
	@Override
	public int updatePaperBYpapeId(Papertable papertable) {
		// TODO Auto-generated method stub
		return papertableMapper.updatePaperBYpapeId(papertable);
	}

	
	

}
