package com.lm.web;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lm.po.Moduletable;
import com.lm.po.Privilegetable;
import com.lm.po.Usertypetable;
import com.lm.service.IPrivilegeService;
import com.lm.service.IUsertableService;
import com.lm.util.Tools;

/**
 * 权限管理
 *
 */
@Controller
@RequestMapping(value = "/privilege")
public class PrivilegeController {
	//注入service层
	
	@Autowired
	private IPrivilegeService iPrivilegeService;
	@Autowired
	private IUsertableService iUsertableService;
	
	/**
	 * to新增用户类型页面
	 * @return
	 */
	@RequestMapping("/insertUserTypeView")
	public ModelAndView insertUserTypeView() {
		ModelAndView mv = new ModelAndView("/PrivilegeManagement/Privilege_in");
		return mv;
	}
	/**
	 * to修改用户类型页面
	 * @return
	 */
	@RequestMapping("/editUserTypeView")
	public ModelAndView editUserTypeView(int usertypeId) {
		ModelAndView mv = new ModelAndView("/PrivilegeManagement/Privilege_up");
		Usertypetable usertypeList=iUsertableService.selectuserTypeByid(usertypeId);
		List<Privilegetable> privilegeList=iPrivilegeService.selectPrivilegeByUserTypeid(usertypeId);
		ArrayList <String> arlist = new ArrayList <String>();
		for (int i = 0; i < privilegeList.size(); i++) {
			int moduleId= privilegeList.get(i).getModuleId();
			String moduleID=String.valueOf(moduleId);
			String privilege=privilegeList.get(i).getPrivilege();
			arlist.add(moduleID);
			arlist.add(privilege);
		}
		mv.addObject("usertypeList", usertypeList);
		mv.addObject("privilegeList", arlist);
		return mv;
	}
	/**
	 * 查询用户类型信息 
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectPrivilege", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String selectPrivilege(HttpServletRequest request,int userType_id,String startTime,String endTime) 
			throws Exception {
		JSONObject json = new JSONObject();
		String msg = "";
		json.put("state", "no");
		json.put("msg", "");
		json.put("data", "");
		try {
			// 获取用户类型信息
			List<Usertypetable> usertype=iPrivilegeService.selectuserTypeAll(userType_id, startTime, endTime);
			json.put("state", "ok");
			json.put("data", usertype);
		} catch (Exception e) {
			msg = e.getMessage();
		}
		json.put("msg", msg);
		return json.toString();
	}
	/**
	 * 查询模块  insert
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertPrivilege", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String insertPrivilege(HttpServletRequest request) 
			throws Exception {
		JSONObject json = new JSONObject();
		String msg = "";
		json.put("state", "no");
		json.put("msg", "");
		json.put("data", "");
		try {
			// 获取模块
			List<Moduletable> module=iPrivilegeService.selectModule();
			json.put("state", "ok");
			json.put("data", module);
		} catch (Exception e) {
			msg = e.getMessage();
		}
		json.put("msg", msg);
		return json.toString();
	}
	/**
	 * 新增保存用户类型
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/savePrivilege", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String savePrivilege(String usertype,String remarks,HttpServletRequest request) 
			throws Exception {
		JSONObject json = new JSONObject();
		String msg = "";
		String state="no";
		json.put("msg", "");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			//1-管理员信息 2-老师管理 3-学生管理 4-权限管理 5-教育资讯 6-历年真题 7-评价管理 8-日志管理
			String[] arrPrivilege = request.getParameterValues("arrPrivilege");//现在数组的长度只有一个
			// 将字符串数组转换成字符串格式（将数组以符号或其他字符串为间隔组成新的字符串）
			String str1 = StringUtils.join(arrPrivilege);
		    //声明字符串数组接收模块明细信息数据
	        String[] ints = str1.split(",");
			//根据用户类型名称查询用户类型 
			List<Usertypetable> usertypeList=iUsertableService.selectuserTypeBYname(usertype);
			if(usertypeList.size()==0){
				Usertypetable usertypetable=new Usertypetable();
				usertypetable.setUsertype(usertype);
				usertypetable.setEnabledbit(2);
				String str = sdf.format(new Date().getTime());//将当前时间格式转成字符串
				Timestamp creationTime= new Timestamp(sdf.parse(str).getTime());
				usertypetable.setCreationtime(creationTime);
				usertypetable.setRemarks(remarks);
				int intR=iPrivilegeService.insertUserType(usertypetable);
				if (intR>0) {
					List<Usertypetable> Usertype=iPrivilegeService.selectUserTypeId_MAX();//查询最大的用户类型id
					int usertypeId=Usertype.get(0).getUsertypeId();//用户类型id
					Privilegetable privilegetable=new Privilegetable();
					String one="",two="",three="",four="",five="",six="",seven="",eight="";
					for (int i = 0; i < ints.length; i++) {
						if(Tools.isNum(ints[i])){
							if(ints[i].equals("1")){
								one+=ints[i+1];
							}else if(ints[i].equals("2")){
								two+=ints[i+1];
							}else if(ints[i].equals("3")){
								three+=ints[i+1];
							}else if(ints[i].equals("4")){
								four+=ints[i+1];
							}else if(ints[i].equals("5")){
								five+=ints[i+1];
							}else if(ints[i].equals("6")){
								six+=ints[i+1];
							}else if(ints[i].equals("7")){
								seven+=ints[i+1];
							}else if(ints[i].equals("8")){
								eight+=ints[i+1];
							}
						}
					}
					if(!one.equals("")){
						privilegetable.setModuleId(1);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege(one);
						iPrivilegeService.insertPrivilege(privilegetable);
					}else{
						privilegetable.setModuleId(1);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege("");
						iPrivilegeService.insertPrivilege(privilegetable);
					}
					if(!two.equals("")){
						privilegetable.setModuleId(2);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege(two);
						iPrivilegeService.insertPrivilege(privilegetable);
					}else{
						privilegetable.setModuleId(2);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege("");
						iPrivilegeService.insertPrivilege(privilegetable);
					}
					if(!three.equals("")){
						privilegetable.setModuleId(3);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege(three);
						iPrivilegeService.insertPrivilege(privilegetable);
					}else{
						privilegetable.setModuleId(3);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege("");
						iPrivilegeService.insertPrivilege(privilegetable);
					}
					if(!four.equals("")){
						privilegetable.setModuleId(4);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege(four);
						iPrivilegeService.insertPrivilege(privilegetable);
					}else{
						privilegetable.setModuleId(4);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege("");
						iPrivilegeService.insertPrivilege(privilegetable);
					}
					if(!five.equals("")){
						privilegetable.setModuleId(5);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege(five);
						iPrivilegeService.insertPrivilege(privilegetable);
					}else{
						privilegetable.setModuleId(5);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege("");
						iPrivilegeService.insertPrivilege(privilegetable);
					}
					if(!six.equals("")){
						privilegetable.setModuleId(6);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege(six);
						iPrivilegeService.insertPrivilege(privilegetable);
					}else{
						privilegetable.setModuleId(6);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege("");
						iPrivilegeService.insertPrivilege(privilegetable);
					}
					if(!seven.equals("")){
						privilegetable.setModuleId(7);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege(seven);
						iPrivilegeService.insertPrivilege(privilegetable);
					}else{
						privilegetable.setModuleId(7);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege("");
						iPrivilegeService.insertPrivilege(privilegetable);
					}
					if(!eight.equals("")){
						privilegetable.setModuleId(8);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege(eight);
						iPrivilegeService.insertPrivilege(privilegetable);
					}else{
						privilegetable.setModuleId(8);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege("");
						iPrivilegeService.insertPrivilege(privilegetable);
					}
					state = "ok";
					msg = "新增成功";
				}
			}else{
				state = "no";
				msg = "输入的用户类型名称已存在";
			}
		} catch (Exception e) {
			msg = e.getMessage();
		}
		json.put("state", state);
		json.put("msg", msg);
		return json.toString();
	}
	
	/**
	 * 删除用户类型
	 * @param usertypeId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteUserType", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String deleteUserType(int usertypeId) 
			throws Exception {
		JSONObject json = new JSONObject();
		String msg = "";
		String state="";
		json.put("state", "no");
		json.put("msg", "");
		try {
			int intR= iPrivilegeService.deleteUserType(usertypeId);//删除用户类型
			if(intR>0){
				iPrivilegeService.deletePrivilegeBYusertypeId(usertypeId);//删除权限
				state="ok";
				msg="删除成功";
			}
		} catch (Exception e) {
			msg = e.getMessage();
		}
		json.put("state", state);
		json.put("msg", msg);
		return json.toString();
	}
    /**
     * 修改用户类型的启用否
     * @param usertypeId
     * @return
     * @throws Exception
     */
	@RequestMapping(value = "/enableUserType", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String enableUserType(int usertypeId) 
			throws Exception {
		JSONObject json = new JSONObject();
		String msg = "";
		String state="";
		json.put("state", "no");
		json.put("msg", "");
		int bit;
		try {
			Usertypetable usertypeList=iUsertableService.selectuserTypeByid(usertypeId);
			Usertypetable usertypetable=new Usertypetable();
			usertypetable.setUsertypeId(usertypeId);
			usertypetable.setCreationtime(usertypeList.getCreationtime());
			usertypetable.setRemarks(usertypeList.getRemarks());
			usertypetable.setUsertype(usertypeList.getUsertype());
			int dd= usertypeList.getEnabledbit();
			if (dd==1) {//1是启用 2是禁用
				bit=2;
			} else {
				bit=1;
			}
			usertypetable.setEnabledbit(bit);
			int intR=iPrivilegeService.updateUserType(usertypetable);
			if (intR>0) {
				state="ok";
				msg="修改成功";
			}
		} catch (Exception e) {
			msg = e.getMessage();
		}
		json.put("state", state);
		json.put("msg", msg);
		return json.toString();
	}

	/**
	 * 查询模块  update
	 * @throws Exception
	 */
	@RequestMapping(value = "/updatePrivilege", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String updatePrivilege(HttpServletRequest request,int usertypeId) 
			throws Exception {
		JSONObject json = new JSONObject();
		String msg = "";
		json.put("state", "no");
		json.put("msg", "");
		json.put("data", "");
		try {
			// 获取模块
			List<Moduletable> module=iPrivilegeService.selectModule_up(usertypeId);
			json.put("state", "ok");
			json.put("data", module);
		} catch (Exception e) {
			msg = e.getMessage();
		}
		json.put("msg", msg);
		return json.toString();
	}
	
	/**
	 * 修改保存权限
	 * @param usertype
	 * @param remarks
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/editPrivilege", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String editPrivilege(int usertypeId,String usertype,String remarks,HttpServletRequest request) 
			throws Exception {
		JSONObject json = new JSONObject();
		String msg = "";
		String state="no";
		json.put("msg", "");
		try {
			//1-管理员信息 2-老师管理 3-学生管理 4-权限管理 5-教育资讯 6-历年真题 7-评价管理 8-日志管理
			String[] arrPrivilege = request.getParameterValues("arrPrivilege");//现在数组的长度只有一个
			// 将字符串数组转换成字符串格式（将数组以符号或其他字符串为间隔组成新的字符串）
			String str1 = StringUtils.join(arrPrivilege);
		    //声明字符串数组接收模块明细信息数据
	        String[] ints = str1.split(",");
			//修改时查询用户类型名称是否唯一
			List<Usertypetable> usertypeList=iPrivilegeService.selectuserTypeOnly(usertype, usertypeId);
			if(usertypeList.size()==0){
				Usertypetable usertypetableList=iUsertableService.selectuserTypeByid(usertypeId);//根据用户类型id查询用户类型信息
				Usertypetable usertypetable=new Usertypetable();
				usertypetable.setUsertypeId(usertypeId);
				usertypetable.setUsertype(usertype);
				usertypetable.setEnabledbit(usertypetableList.getEnabledbit());
				usertypetable.setCreationtime(usertypetableList.getCreationtime());
				usertypetable.setRemarks(remarks);
				int intR=iPrivilegeService.updateUserType(usertypetable);//修改用户类型表
				if (intR>0) {
					iPrivilegeService.deletePrivilegeBYusertypeId(usertypeId);//删除权限表
					Privilegetable privilegetable=new Privilegetable();
					String one="",two="",three="",four="",five="",six="",seven="",eight="";
					for (int i = 0; i < ints.length; i++) {
						if(Tools.isNum(ints[i])){
							if(ints[i].equals("1")){
								one+=ints[i+1];
							}else if(ints[i].equals("2")){
								two+=ints[i+1];
							}else if(ints[i].equals("3")){
								three+=ints[i+1];
							}else if(ints[i].equals("4")){
								four+=ints[i+1];
							}else if(ints[i].equals("5")){
								five+=ints[i+1];
							}else if(ints[i].equals("6")){
								six+=ints[i+1];
							}else if(ints[i].equals("7")){
								seven+=ints[i+1];
							}else if(ints[i].equals("8")){
								eight+=ints[i+1];
							}
						}
					}
					if(!one.equals("")){
						privilegetable.setModuleId(1);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege(one);
						iPrivilegeService.insertPrivilege(privilegetable);
					}else{
						privilegetable.setModuleId(1);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege("");
						iPrivilegeService.insertPrivilege(privilegetable);
					}
					if(!two.equals("")){
						privilegetable.setModuleId(2);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege(two);
						iPrivilegeService.insertPrivilege(privilegetable);
					}else{
						privilegetable.setModuleId(2);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege("");
						iPrivilegeService.insertPrivilege(privilegetable);
					}
					if(!three.equals("")){
						privilegetable.setModuleId(3);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege(three);
						iPrivilegeService.insertPrivilege(privilegetable);
					}else{
						privilegetable.setModuleId(3);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege("");
						iPrivilegeService.insertPrivilege(privilegetable);
					}
					if(!four.equals("")){
						privilegetable.setModuleId(4);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege(four);
						iPrivilegeService.insertPrivilege(privilegetable);
					}else{
						privilegetable.setModuleId(4);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege("");
						iPrivilegeService.insertPrivilege(privilegetable);
					}
					if(!five.equals("")){
						privilegetable.setModuleId(5);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege(five);
						iPrivilegeService.insertPrivilege(privilegetable);
					}else{
						privilegetable.setModuleId(5);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege("");
						iPrivilegeService.insertPrivilege(privilegetable);
					}
					if(!six.equals("")){
						privilegetable.setModuleId(6);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege(six);
						iPrivilegeService.insertPrivilege(privilegetable);
					}else{
						privilegetable.setModuleId(6);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege("");
						iPrivilegeService.insertPrivilege(privilegetable);
					}
					if(!seven.equals("")){
						privilegetable.setModuleId(7);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege(seven);
						iPrivilegeService.insertPrivilege(privilegetable);
					}else{
						privilegetable.setModuleId(7);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege("");
						iPrivilegeService.insertPrivilege(privilegetable);
					}
					if(!eight.equals("")){
						privilegetable.setModuleId(8);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege(eight);
						iPrivilegeService.insertPrivilege(privilegetable);
					}else{
						privilegetable.setModuleId(8);
						privilegetable.setUsertypeId(usertypeId);
						privilegetable.setPrivilege("");
						iPrivilegeService.insertPrivilege(privilegetable);
					}
					state = "ok";
					msg = "修改成功";
				}
			}else{
				state = "no";
				msg = "输入的用户类型名称已存在";
			}
		} catch (Exception e) {
			msg = e.getMessage();
		}
		json.put("state", state);
		json.put("msg", msg);
		return json.toString();
	}
}
