package com.lm.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Privilegetable implements Serializable {
    /**
     * 权限ID
     */
    private Integer privilegeId;

    /**
     * 用户类型ID
     */
    private Integer usertypeId;

    /**
     * 模块ID 
     */
    private Integer moduleId;
    /**
     * 权限
     */
    private String privilege;

    private static final long serialVersionUID = 1L;

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

    public Integer getModuleId() {
        return moduleId;
    }

    public void setModuleId(Integer moduleId) {
        this.moduleId = moduleId;
    }

	public String getPrivilege() {
		return privilege;
	}

	public void setPrivilege(String privilege) {
		this.privilege = privilege;
	}
}