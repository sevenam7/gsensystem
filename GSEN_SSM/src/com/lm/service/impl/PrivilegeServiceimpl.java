package com.lm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lm.dao.ModuletableMapper;
import com.lm.dao.PrivilegetableMapper;
import com.lm.dao.UsertypetableMapper;
import com.lm.po.Moduletable;
import com.lm.po.Privilegetable;
import com.lm.po.Usertypetable;
import com.lm.service.IPrivilegeService;

/**
 * 权限管理
 *
 */
@Transactional//事务
@Service("iPrivilegeService")//服务层注解
public class PrivilegeServiceimpl implements IPrivilegeService {
	//注入dao层
	
		//用户类型表
	    @Autowired
		private UsertypetableMapper usertypetableMapper;
	  //模块表
	    @Autowired
		private ModuletableMapper moduletableMapper;
	  //权限表
	    @Autowired
		private PrivilegetableMapper privilegetableMapper;
	    
	/**
	 * 查询所有用户类型 table    
	 */
	@Override
	public List<Usertypetable> selectuserTypeAll(int usertypeId,
			String startTime, String endTime) {
		// TODO Auto-generated method stub
		return usertypetableMapper.selectuserTypeAll(usertypeId, startTime, endTime);
	}

    /**
     *  查询模块
     */
	@Override
	public List<Moduletable> selectModule() {
		// TODO Auto-generated method stub
		return moduletableMapper.selectModule();
	}
/**
 * 新增用户类型信息 
 */
	@Override
	public int insertUserType(Usertypetable usertypetable) {
		// TODO Auto-generated method stub
		return usertypetableMapper.insertUserType(usertypetable);
	}

	/**
	 * 查询最大的用户类型id
	 */
	@Override
	public List<Usertypetable> selectUserTypeId_MAX() {
		// TODO Auto-generated method stub
		return usertypetableMapper.selectUserTypeId_MAX();
	}
    /**
     * 新增权限 
     */
	@Override
	public int insertPrivilege(Privilegetable privilegetable) {
		// TODO Auto-generated method stub
		return privilegetableMapper.insertPrivilege(privilegetable);
	}
    /**
     * 根据用户类型id进行删除用户类型
     */
	@Override
	public int deleteUserType(int usertypeId) {
		// TODO Auto-generated method stub
		return usertypetableMapper.deleteUserType(usertypeId);
	}
    /**
     * 根据用户类型id进行删除权限 
     */
	@Override
	public int deletePrivilegeBYusertypeId(int usertypeId) {
		// TODO Auto-generated method stub
		return privilegetableMapper.deletePrivilegeBYusertypeId(usertypeId);
	}
	  /**
	    * 修改用户类型
	    * @param usertypetable
	    * @return
	    */
	@Override
	public int updateUserType(Usertypetable usertypetable) {
		// TODO Auto-generated method stub
		return usertypetableMapper.updateUserType(usertypetable);
	}
    /**
     * 根据用户类型ID查询用户权限信息 
     */
	@Override
	public List<Privilegetable> selectPrivilegeByUserTypeid(int usertypeId) {
		// TODO Auto-generated method stub
		return privilegetableMapper.selectPrivilegeByUserTypeid(usertypeId);
	}
    /**
     * 查询模块 update
     */
	@Override
	public List<Moduletable> selectModule_up(int usertypeId) {
		// TODO Auto-generated method stub
		return moduletableMapper.selectModule_up(usertypeId);
	}
    /**
     * 修改时查询用户类型名称是否唯一
     */
	@Override
	public List<Usertypetable> selectuserTypeOnly(String usertype,
			int usertypeId) {
		// TODO Auto-generated method stub
		return usertypetableMapper.selectuserTypeOnly(usertype, usertypeId);
	}

}
