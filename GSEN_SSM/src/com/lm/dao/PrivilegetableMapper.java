package com.lm.dao;

import java.util.List;

import com.lm.po.Privilegetable;

/**
 * 权限表
 *
 */
public interface PrivilegetableMapper {
	/**
	 * 新增权限 
	 * @return
	 */
   int insertPrivilege(Privilegetable privilegetable);
   /**
    * 根据用户类型id进行删除 权限
    * @param usertypeId
    * @return
    */
   int deletePrivilegeBYusertypeId(int usertypeId);
   /**
    * 根据用户类型ID查询用户权限信息 
    * @param usertypeId
    * @return
    */
   List<Privilegetable> selectPrivilegeByUserTypeid(int usertypeId);
   
   
}