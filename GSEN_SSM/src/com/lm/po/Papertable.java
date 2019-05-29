package com.lm.po;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @author 
 */
public class Papertable implements Serializable {
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

    private static final long serialVersionUID = 1L;

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

	public String getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(String creationTime) {
		this.creationTime = creationTime;
	}
}