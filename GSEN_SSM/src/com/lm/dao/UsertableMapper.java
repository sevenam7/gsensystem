package com.lm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lm.po.Usertable;
import com.lm.vo.UserVo;

/**
 *用户管理
 */
public interface UsertableMapper {
	
	/**
	 * 根据账号查询用户
	 * 
	 * @param account
	 * @param password
	 * @return
	 */
	Usertable selectuserByName(
			@Param("account") String account);
	/**
	 * 修改登录次数
	 * @param account
	 * @param loginNumber
	 * @return
	 */
	int updateloginNumber(@Param("account") String account,
			@Param("loginNumber") String loginNumber);
	
	/**
	 * 查询管理员信息
	 * @param account
	 * @param name
	 * @param address
	 * @return
	 */
	List<UserVo> selectAdminALL(@Param("account") String account,
			@Param("name") String name, @Param("address") String address);
	/**
	 * 新增管理员信息
	 * @param userTable
	 * @return
	 */
	int insertAdmin(Usertable userTable);
	
	/**
	 * 根据账号查询账号唯一
	 * @param account
	 * @return
	 */
	List<Usertable> selectOnlyAdminByAccount(@Param("account") String account);
	
	/**
	 * 根据用户账号进行删除
	 * @param account
	 * @return
	 */
	int deleteAdmin(@Param("account") String account);
	/**
	 * 修改管理员信息
	 * @param account
	 * @return
	 */
	int updateAdmin(Usertable usertable);
	/**
	 * 修改用户密码
	 * @param userId
	 * @param password
	 * @return
	 */
	int updatePassword(@Param("userId") int userId,
			@Param("password") String password);
	/**
	 * 修改时判断用户是否唯一 
	 * @param account
	 * @param userId
	 * @return
	 */
	List<Usertable> selectOnlyAdminedit(@Param("account") String account,@Param("userId") int userId);
	/**
	 * 根据用户id查询用户信息
	 * @param userId
	 * @return
	 */
	Usertable selectAdmineBYuserId(@Param("userId") int userId);
}