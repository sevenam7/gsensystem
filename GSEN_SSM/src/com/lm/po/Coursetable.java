package com.lm.po;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @author 
 */
public class Coursetable implements Serializable {
    /**
     * 课件ID 
     */
    private Integer courseId;
    /**
     * 老师ID 
     */
    private Integer teacher_id;

    /**
     * 教学版本ID
     */
    private Integer teachversionId;
    /**
     * 年级ID
     */
    private Integer gradeId;

    /**
     * 试卷ID
     */
    private Integer papeId;
    /**
     * 课件名称
     */
    private String coursename;

    /**
     * 课件价格
     */
    private BigDecimal courseprice;

    /**
     * 浏览次数
     */
    private Integer browsenumber;

    /**
     * 知识点
     */
    private String knowledge;

    /**
     * 审核否
     */
    private Integer examinebit;
    
    /**
     * 视频附件
     */
    private String video;

    /**
     * 创建时间
     */
    private String creationTime;

    private static final long serialVersionUID = 1L;

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Integer getTeachversionId() {
        return teachversionId;
    }

    public void setTeachversionId(Integer teachversionId) {
        this.teachversionId = teachversionId;
    }

    public String getCoursename() {
        return coursename;
    }

    public void setCoursename(String coursename) {
        this.coursename = coursename;
    }

    public BigDecimal getCourseprice() {
        return courseprice;
    }

    public void setCourseprice(BigDecimal courseprice) {
        this.courseprice = courseprice;
    }

    public Integer getBrowsenumber() {
        return browsenumber;
    }

    public void setBrowsenumber(Integer browsenumber) {
        this.browsenumber = browsenumber;
    }

    public String getKnowledge() {
        return knowledge;
    }

    public void setKnowledge(String knowledge) {
        this.knowledge = knowledge;
    }

    public Integer getExaminebit() {
        return examinebit;
    }

    public void setExaminebit(Integer examinebit) {
        this.examinebit = examinebit;
    }

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public Integer getTeacher_id() {
		return teacher_id;
	}

	public void setTeacher_id(Integer teacher_id) {
		this.teacher_id = teacher_id;
	}

	public Integer getGradeId() {
		return gradeId;
	}

	public void setGradeId(Integer gradeId) {
		this.gradeId = gradeId;
	}

	public String getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(String creationTime) {
		this.creationTime = creationTime;
	}

	public Integer getPapeId() {
		return papeId;
	}

	public void setPapeId(Integer papeId) {
		this.papeId = papeId;
	}
}