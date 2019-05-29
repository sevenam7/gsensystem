package com.lm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lm.po.Usertypetable;

/**
 * 用户类型表
 * 
 */
public interface UsertypetableMapper {
	/**
	 * 根据用户类型id查询数据
	 * 
	 * @param usertypeId
	 * @return
	 */
	Usertypetable selectuserTypeByid(@Param("usertypeId") int usertypeId);

	/**
	 * 查询用户类型
	 * 
	 * @return
	 */
	List<Usertypetable> selectuserType();

	/**
	 * 查询所有用户类型 table
	 * 
	 * @param usertypeId
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	List<Usertypetable> selectuserTypeAll(@Param("usertypeId") int usertypeId,
			@Param("startTime") String startTime,
			@Param("endTime") String endTime);

	/**
	 * 根据用户类型名称查询用户类型
	 * 
	 * @param usertype
	 * @return
	 */
	List<Usertypetable> selectuserTypeBYname(@Param("usertype") String usertype);

	/**
	 * 新增用户类型信息
	 * 
	 * @param usertypetable
	 * @return
	 */
	int insertUserType(Usertypetable usertypetable);

	/**
	 * 查询最大的用户类型id
	 * 
	 * @return
	 */
	List<Usertypetable> selectUserTypeId_MAX();

	/**
	 * 根据用户类型id进行删除 用户类型
	 * 
	 * @param usertypeId
	 * @return
	 */
	int deleteUserType(int usertypeId);

	/**
	 * 修改用户类型
	 * 
	 * @param usertypetable
	 * @return
	 */
	int updateUserType(Usertypetable usertypetable);
    /**
     * 修改时查询用户类型名称是否唯一
     * @param usertype
     * @param usertypeId
     * @return
     */
	List<Usertypetable> selectuserTypeOnly(@Param("usertype") String usertype,
			@Param("usertypeId") int usertypeId);
}