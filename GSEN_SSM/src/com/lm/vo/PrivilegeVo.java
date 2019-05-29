package com.lm.vo;
/**
 * 权限
 * @author 小七
 *
 */
public class PrivilegeVo {

	 /**
     * 模块ID
     */
    private Integer moduleId;

    /**
     * 模块名称
     */
    private String modulename;

	
	  /**
     * 权限ID
     */
    private Integer privilegeId;

    /**
     * 用户类型ID
     */
    private Integer usertypeId;

    /**
     * 权限
     */
    private String privilege;

	public Integer getModuleId() {
		return moduleId;
	}

	public void setModuleId(Integer moduleId) {
		this.moduleId = moduleId;
	}

	public String getModulename() {
		return modulename;
	}

	public void setModulename(String modulename) {
		this.modulename = modulename;
	}

	public Integer getPrivilegeId() {
		return privilegeId;
	}

	public void setPrivilegeId(Integer privilegeId) {
		this.privilegeId = privilegeId;
	}

	public Integer getUsertypeId() {
		return usertypeId;
	}

	public void setUsertypeId(Integer usertypeId) {
		this.usertypeId = usertypeId;
	}

	public String getPrivilege() {
		return privilege;
	}

	public void setPrivilege(String privilege) {
		this.privilege = privilege;
	}
}
