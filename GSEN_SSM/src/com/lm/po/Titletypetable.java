package com.lm.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Titletypetable implements Serializable {
    /**
     * 题目类型ID 
     */
    private Integer titletypeId;

    /**
     * 试卷ID
     */
    private Integer papeId;

    /**
     * 题目类型
     */
    private String titletype;

    /**
     * 序号
     */
    private String serial;

    /**
     * 备注
     */
    private String remarks;

    /**
     * 创建时间
     */
    private String creationtime;

    /**
     * 是否启用
     */
    private Integer enablebit;

    private static final long serialVersionUID = 1L;

	public Integer getTitletypeId() {
		return titletypeId;
	}

	public void setTitletypeId(Integer titletypeId) {
		this.titletypeId = titletypeId;
	}

	public Integer getPapeId() {
		return papeId;
	}

	public void setPapeId(Integer papeId) {
		this.papeId = papeId;
	}

	public String getTitletype() {
		return titletype;
	}

	public void setTitletype(String titletype) {
		this.titletype = titletype;
	}

	public String getSerial() {
		return serial;
	}

	public void setSerial(String serial) {
		this.serial = serial;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getCreationtime() {
		return creationtime;
	}

	public void setCreationtime(String creationtime) {
		this.creationtime = creationtime;
	}

	public Integer getEnablebit() {
		return enablebit;
	}

	public void setEnablebit(Integer enablebit) {
		this.enablebit = enablebit;
	}

   
}