package com.lm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lm.dao.InformationtableMapper;
import com.lm.po.Informationtable;
import com.lm.service.IInformationService;

/**
 * 教育资讯
 */
@Transactional//事务
@Service("iInformationService")//服务层注解
public class InformationService implements IInformationService {
	//注入dao层
	//教育资讯表
    @Autowired
	private InformationtableMapper informationtableMapper;
	
	/**
	 * 查询教育资讯
	 */
	@Override
	public List<Informationtable> selectInformation(String headline,
			String subtitle, int enabledBit, String startTime, String endTime) {
		// TODO Auto-generated method stub
		return informationtableMapper.selectInformation(headline, subtitle, enabledBit, startTime, endTime);
	}
    /**
     * 新增教育资讯
     */
	@Override
	public int insertInformation(Informationtable informationtable) {
		// TODO Auto-generated method stub
		return informationtableMapper.insertInformation(informationtable);
	}
	/**
	 * 根据教育资讯id删除教育资讯
	 */
	@Override
	public int deleteInformation(int informationId) {
		// TODO Auto-generated method stub
		return informationtableMapper.deleteInformation(informationId);
	}
	/**
	 * 根据教育资讯id查询教育资讯
	 */
	@Override
	public Informationtable selectInformationById(int informationId) {
		// TODO Auto-generated method stub
		return informationtableMapper.selectInformationById(informationId);
	}
	/**
	 * 修改教育资讯
	 */
	@Override
	public int updateInformation(Informationtable informationtable) {
		// TODO Auto-generated method stub
		return informationtableMapper.updateInformation(informationtable);
	}
	/**
	 * 根据大标题 查询资讯信息
	 */
	@Override
	public List<Informationtable> selectInformationOnly(String headline) {
		// TODO Auto-generated method stub
		return informationtableMapper.selectInformationOnly(headline);
	}
	/**
	 * 修改时查询大标题是否唯一
	 */
	@Override
	public List<Informationtable> selectInformationOnlyedit(String headline,
			int informationId) {
		// TODO Auto-generated method stub
		return informationtableMapper.selectInformationOnlyedit(headline, informationId);
	}
	

}
