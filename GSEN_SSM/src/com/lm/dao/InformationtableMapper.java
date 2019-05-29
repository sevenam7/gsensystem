package com.lm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lm.po.Informationtable;

/**
 *教育资讯
 */
public interface InformationtableMapper {
	/**
	 * 查询教育资讯
	 * @param headline
	 * @param subtitle
	 * @param enabledBit
	 * @return
	 */
	List<Informationtable> selectInformation(@Param("headline") String headline,
			@Param("subtitle") String subtitle,
			@Param("enabledBit") int enabledBit,
			@Param("startTime") String startTime,
			@Param("endTime") String endTime
			);
	/**
	 * 新增教育资讯
	 * @param informationtable
	 * @return
	 */
	int insertInformation(Informationtable informationtable);
	/**
	 * 根据资讯id进行删除
	 * @param informationId
	 * @return
	 */
	int deleteInformation(@Param("informationId") int informationId);
	/**
	 * 根据资讯id查询教育资讯
	 * 
	 * @param informationId
	 * @return
	 */
	 Informationtable selectInformationById(@Param("informationId") int informationId);
	/**
	 * 修改教育资讯
	 * 
	 * @param informationtable
	 * @return
	 */
	int updateInformation(Informationtable informationtable);
	 /**
	  * 根据大标题 查询资讯信息
	  * @param headline
	  * @return
	  */
	List<Informationtable> selectInformationOnly(@Param("headline") String headline);
	/**
	 * 修改时查询大标题是否唯一
	 * @param headline
	 * @param informationId
	 * @return
	 */
	List<Informationtable> selectInformationOnlyedit(@Param("headline") String headline,@Param("informationId") int informationId);
}