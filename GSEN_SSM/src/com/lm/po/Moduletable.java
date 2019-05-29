package com.lm.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Moduletable implements Serializable {
    /**
     * 模块ID
     */
    private Integer moduleId;

    /**
     * 模块名称
     */
    private String modulename;

    private static final long serialVersionUID = 1L;

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
}