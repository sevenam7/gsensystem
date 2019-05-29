package com.lm.vo;

import java.math.BigDecimal;


/**
 * 试卷
 */
public class PaperVo {
	  /**
     * 试卷ID
     */
    private Integer papeId;

    /**
     * 试卷类型ID
     */
    private Integer papertypeId;

    /**
     * 年级ID
     */
    private Integer gradeId;

    /**
     * 学科ID
     */
    private Integer subjectId;

    /**
     * 试卷名称
     */
    private String papername;

    /**
     * 试卷总分
     */
    private BigDecimal paperscore;

    /**
     * 考试限时
     */
    private String testtime;

    /**
     * 注意事项
     */
    private String notes;
    /**
     * 启用否
     */
    private int enablebit;
    /**
     * 创建时间
     */
    private String creationTime;
    
    /**
     * 试卷类型
     */
    private String papertype;
    /**
     * 年级名称
     */
    private String gradename;
    /**
     * 学科
     */
    private String subject;
	public Integer getPapeId() {
		return papeId;
	}
	public void setPapeId(Integer papeId) {
		this.papeId = papeId;
	}
	public Integer getPapertypeId() {
		return papertypeId;
	}
	public void setPapertypeId(Integer papertypeId) {
		this.papertypeId = papertypeId;
	}
	public Integer getGradeId() {
		return gradeId;
	}
	public void setGradeId(Integer gradeId) {
		this.gradeId = gradeId;
	}
	public Integer getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}
	public String getPapername() {
		return papername;
	}
	public void setPapername(String papername) {
		this.papername = papername;
	}
	public BigDecimal getPaperscore() {
		return paperscore;
	}
	public void setPaperscore(BigDecimal paperscore) {
		this.paperscore = paperscore;
	}
	public String getTesttime() {
		return testtime;
	}
	public void setTesttime(String testtime) {
		this.testtime = testtime;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public int getEnablebit() {
		return enablebit;
	}
	public void setEnablebit(int enablebit) {
		this.enablebit = enablebit;
	}
	public String getPapertype() {
		return papertype;
	}
	public void setPapertype(String papertype) {
		this.papertype = papertype;
	}
	public String getGradename() {
		return gradename;
	}
	public void setGradename(String gradename) {
		this.gradename = gradename;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getCreationTime() {
		return creationTime;
	}
	public void setCreationTime(String creationTime) {
		this.creationTime = creationTime;
	}
}
