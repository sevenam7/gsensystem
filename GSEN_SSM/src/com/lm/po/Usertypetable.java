package com.lm.po;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 
 */
public class Usertypetable implements Serializable {
    /**
     * 用户类型ID
     */
    private Integer usertypeId;

    /**
     * 用户类型
     */
    private String usertype;

    /**
     * 创建时间
     */
    private Date creationtime;
    private String creationtimeStr;

    /**
     * 启用否
     */
    private Integer enabledbit;
    
    /**
     * 备注
     */
    private String remarks;
    

    private static final long serialVersionUID = 1L;

    public Integer getUsertypeId() {
        return usertypeId;
    }

    public void setUsertypeId(Integer usertypeId) {
        this.usertypeId = usertypeId;
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }

    public Date getCreationtime() {
        return creationtime;
    }

    public void setCreationtime(Date creationtime) {
        this.creationtime = creationtime;
    }

    public Integer getEnabledbit() {
        return enabledbit;
    }

    public void setEnabledbit(int enabledbit) {
        this.enabledbit = enabledbit;
    }

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getCreationtimeStr() {
		return creationtimeStr;
	}

	public void setCreationtimeStr(String creationtimeStr) {
		this.creationtimeStr = creationtimeStr;
	}
}