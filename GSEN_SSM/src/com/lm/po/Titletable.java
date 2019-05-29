package com.lm.po;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 
 */
public class Titletable implements Serializable {
    /**
     * 题目ID 
     */
    private Integer titleId;
    
    /**
     * 题目类型ID
     */
    private Integer titletypeId;

    /**
     * 题目分数
     */
    private Double titlescore;

    /**
     * 序号
     */
    private Integer serial;

    /**
     * 创建时间
     */
    private Date creationtime;

    /**
     * 启用否
     */
    private Integer enablebit;
    /**
     * 题目
     */
    private String titleA;

    /**
     * 选项
     */
    private String optionA;

    /**
     * 答案
     */
    private String answerA;
    /**
     * 类型
     */
    private Integer title_type;

    private static final long serialVersionUID = 1L;

	public Integer getTitleId() {
		return titleId;
	}

	public void setTitleId(Integer titleId) {
		this.titleId = titleId;
	}

	public Integer getTitletypeId() {
		return titletypeId;
	}

	public void setTitletypeId(Integer titletypeId) {
		this.titletypeId = titletypeId;
	}

	public Double getTitlescore() {
		return titlescore;
	}

	public void setTitlescore(Double titlescore) {
		this.titlescore = titlescore;
	}

	public Integer getSerial() {
		return serial;
	}

	public void setSerial(Integer serial) {
		this.serial = serial;
	}

	public Date getCreationtime() {
		return creationtime;
	}

	public void setCreationtime(Date creationtime) {
		this.creationtime = creationtime;
	}

	public Integer getEnablebit() {
		return enablebit;
	}

	public void setEnablebit(Integer enablebit) {
		this.enablebit = enablebit;
	}

	public String getTitleA() {
		return titleA;
	}

	public void setTitleA(String titleA) {
		this.titleA = titleA;
	}

	public String getOptionA() {
		return optionA;
	}

	public void setOptionA(String optionA) {
		this.optionA = optionA;
	}

	public String getAnswerA() {
		return answerA;
	}

	public void setAnswerA(String answerA) {
		this.answerA = answerA;
	}

	public Integer getTitle_type() {
		return title_type;
	}

	public void setTitle_type(Integer title_type) {
		this.title_type = title_type;
	}

	



   
}