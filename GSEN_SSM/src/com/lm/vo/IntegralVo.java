package com.lm.vo;

import java.util.Date;

public class IntegralVo {
	  /**
     * 积分ID
     */
    private Integer integralId;

    /**
     * 学生ID
     */
    private Integer studentId;
    /**
     * 老师ID
     */
    private Integer teacher_id;

    /**
     * 积分流水
     */
    private String integralflow;

    /**
     * 积分流向
     */
    private String integraldirection;

    /**
     * 积分
     */
    private String integral;

    /**
     * 操作时间
     */
    private Date operationtime;
    private String operationtimeStr;
    /**
     * 有效否
     */
    private int validitybit;
    
    /**
     * 老师姓名
     */
    private String teachername;
    /**
     * 学生姓名
     */
    private String name;
	public Integer getIntegralId() {
		return integralId;
	}
	public void setIntegralId(Integer integralId) {
		this.integralId = integralId;
	}
	public Integer getStudentId() {
		return studentId;
	}
	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}
	public Integer getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(Integer teacher_id) {
		this.teacher_id = teacher_id;
	}
	public String getIntegralflow() {
		return integralflow;
	}
	public void setIntegralflow(String integralflow) {
		this.integralflow = integralflow;
	}
	public String getIntegraldirection() {
		return integraldirection;
	}
	public void setIntegraldirection(String integraldirection) {
		this.integraldirection = integraldirection;
	}
	public String getIntegral() {
		return integral;
	}
	public void setIntegral(String integral) {
		this.integral = integral;
	}
	public Date getOperationtime() {
		return operationtime;
	}
	public void setOperationtime(Date operationtime) {
		this.operationtime = operationtime;
	}
	public int getValiditybit() {
		return validitybit;
	}
	public void setValiditybit(int validitybit) {
		this.validitybit = validitybit;
	}
	public String getTeachername() {
		return teachername;
	}
	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOperationtimeStr() {
		return operationtimeStr;
	}
	public void setOperationtimeStr(String operationtimeStr) {
		this.operationtimeStr = operationtimeStr;
	}
}
