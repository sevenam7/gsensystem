package com.lm.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lm.po.Moduletable;
import com.lm.po.Privilegetable;
import com.lm.po.Usertypetable;

public interface IPrivilegeService {
	/**
     * 查询所有用户类型 table 
     * @param usertypeId
     * @param startTime
     * @param endTime
     * @return
     */
    List<Usertypetable> selectuserTypeAll(@Param("usertypeId") int usertypeId,
    		@Param("startTime") String startTime,
    		@Param("endTime") String endTime);
	/**
	 * 查询模块 insert
	 * @return
	 */
    List<Moduletable> selectModule();
    /**
     * 新增用户类型信息 
     * @param usertypetable
     * @return
     */
    int insertUserType(Usertypetable usertypetable);
    /**
     * 查询最大的用户类型id
     * @return
     */
    List<Usertypetable> selectUserTypeId_MAX();
	/**
	 * 新增权限 
	 * @return
	 */
   int insertPrivilege(Privilegetable privilegetable);
   /**
    * 根据用户类型id进行删除 用户类型
    * @param usertypeId
    * @return
    */
   int deleteUserType(int usertypeId);
   /**
    * 根据用户类型id进行删除权限 
    * @param usertypeId
    * @return
    */
   int deletePrivilegeBYusertypeId(int usertypeId);
   /**
    * 修改用户类型
    * @param usertypetable
    * @return
    */
   int updateUserType(Usertypetable usertypetable);
   /**
    * 根据用户类型ID查询用户权限信息 
    * @param usertypeId
    * @return
    */
   List<Privilegetable> selectPrivilegeByUserTypeid(int usertypeId);
   /**
    *  查询模块 update
    * @param usertypeId
    * @return
    */
   List<Moduletable> selectModule_up(int usertypeId);
   /**
    * 修改时查询用户类型名称是否唯一
    * @param usertype
    * @param usertypeId
    * @return
    */
	List<Usertypetable> selectuserTypeOnly(@Param("usertype") String usertype,
			@Param("usertypeId") int usertypeId);
}
