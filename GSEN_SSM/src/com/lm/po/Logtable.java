package com.lm.po;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 
 */
public class Logtable implements Serializable {
    /**
     * 日志ID
     */
    private Integer logId;

    /**
     * 用户ID
     */
    private Integer userId;

    /**
     * 操作类型
     */
    private String opertype;

    /**
     * 操作时间
     */
    private Date opertime;
    private String opertimeStr;

    /**
     * IP
     */
    private String IP;

    private static final long serialVersionUID = 1L;

    public Integer getLogId() {
        return logId;
    }

    public void setLogId(Integer logId) {
        this.logId = logId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getOpertype() {
        return opertype;
    }

    public void setOpertype(String opertype) {
        this.opertype = opertype;
    }

    public Date getOpertime() {
        return opertime;
    }

    public void setOpertime(Date opertime) {
        this.opertime = opertime;
    }

	public String getIP() {
		return IP;
	}

	public void setIP(String iP) {
		IP = iP;
	}

	public String getOpertimeStr() {
		return opertimeStr;
	}

	public void setOpertimeStr(String opertimeStr) {
		this.opertimeStr = opertimeStr;
	}
}