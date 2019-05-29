package com.lm.vo;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 课件
 */
public class CourseVo {
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
    

    /**
     * 教学版本
     */
    private String teachversion;
    
    /**
     * 年级名称
     */
    private String gradename;

    
    /**
     * 老师姓名
     */
    private String teachername;

    /**
     * 学科
     */
    private String subject;
    
   /////////////////课件评价表start
    /**
     * 课件评价ID 
     */
    private Integer courseevaId;

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
    /**
     * 学生姓名
     */
    private String name;
    ////////////////end

	public Integer getCourseId() {
		return courseId;
	}


	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}


	public Integer getTeacher_id() {
		return teacher_id;
	}


	public void setTeacher_id(Integer teacher_id) {
		this.teacher_id = teacher_id;
	}


	public Integer getTeachversionId() {
		return teachversionId;
	}


	public void setTeachversionId(Integer teachversionId) {
		this.teachversionId = teachversionId;
	}


	public Integer getGradeId() {
		return gradeId;
	}


	public void setGradeId(Integer gradeId) {
		this.gradeId = gradeId;
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


	public String getTeachversion() {
		return teachversion;
	}


	public void setTeachversion(String teachversion) {
		this.teachversion = teachversion;
	}


	public String getGradename() {
		return gradename;
	}


	public void setGradename(String gradename) {
		this.gradename = gradename;
	}


	public String getTeachername() {
		return teachername;
	}


	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}


	public String getCreationTime() {
		return creationTime;
	}


	public void setCreationTime(String creationTime) {
		this.creationTime = creationTime;
	}


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public Integer getPapeId() {
		return papeId;
	}


	public void setPapeId(Integer papeId) {
		this.papeId = papeId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Integer getCourseevaId() {
		return courseevaId;
	}


	public void setCourseevaId(Integer courseevaId) {
		this.courseevaId = courseevaId;
	}


	public Integer getStudentId() {
		return studentId;
	}


	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
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
