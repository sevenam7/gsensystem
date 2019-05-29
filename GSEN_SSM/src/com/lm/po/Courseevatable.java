package com.lm.po;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 
 */
public class Courseevatable implements Serializable {
    /**
     * 课件评价ID 
     */
    private Integer courseevaId;

    /**
     * 课件ID 
     */
    private Integer courseId;
    /**
     * 学生ID
     */
    private Integer studentId;

    /**
     * 满意度
     */
    private String satisfaction;

    /**
     * 课件评价内容
     */
    private String evaluationcontent;
    /**
     * 启用否
     */
    private Integer enabledbit;
    /**
     * 评价时间
     */
    private Date evaluationTime;
    private String evaluationTimeStr;

    private static final long serialVersionUID = 1L;

    public Integer getCourseevaId() {
        return courseevaId;
    }

    public void setCourseevaId(Integer courseevaId) {
        this.courseevaId = courseevaId;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public String getSatisfaction() {
        return satisfaction;
    }

    public void setSatisfaction(String satisfaction) {
        this.satisfaction = satisfaction;
    }

    public String getEvaluationcontent() {
        return evaluationcontent;
    }

    public void setEvaluationcontent(String evaluationcontent) {
        this.evaluationcontent = evaluationcontent;
    }

	public Integer getStudentId() {
		return studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	public Integer getEnabledbit() {
		return enabledbit;
	}

	public void setEnabledbit(Integer enabledbit) {
		this.enabledbit = enabledbit;
	}

	public Date getEvaluationTime() {
		return evaluationTime;
	}

	public void setEvaluationTime(Date evaluationTime) {
		this.evaluationTime = evaluationTime;
	}

	public String getEvaluationTimeStr() {
		return evaluationTimeStr;
	}

	public void setEvaluationTimeStr(String evaluationTimeStr) {
		this.evaluationTimeStr = evaluationTimeStr;
	}
}