package com.lm.vo;

import java.math.BigDecimal;
import java.util.Date;
/**
 * 老师
 *
 */
public class TeaVo {
	/**
     * 老师ID
     */
    private Integer teacherId;

    /**
     * 学科ID
     */
    private Integer subjectId;

    /**
     * 教师职称ID
     */
    private Integer teaTitle_id;

    /**
     * 老师昵称
     */
    private String teacherNickname;
    /**
     * 老师姓名
     */
    private String teachername;

    /**
     * 密码
     */
    private String password;

    /**
     * 手机号码
     */
    private String phonenumber;

    /**
     * 性别
     */
    private String sex;

    /**
     * 教龄
     */
    private String teachage;

    /**
     * 学历
     */
    private String education;

    /**
     * 地址
     */
    private String address;

    /**
     * 出生日期
     */
    private Date datebirth;

    /**
     * 毕业院校
     */
    private String graduationcollege;

    /**
     * 工作单位
     */
    private String workunit;

    /**
     * QQ
     */
    private Integer qq;

    /**
     * 微信
     */
    private String wechat;

    /**
     * 教师风格
     */
    private String teacherstyle;
    
    /**
     * 图片
     */
    private String picture;

    /**
     * 个人简介
     */
    private String personalprofile;
    /**老师表
     * 审核否
     */
    private Integer examineBit;
    /**
     * 创建时间
     */
    private Date creationTime;
    private String creationTimeStr;
    /**
     * 学历证证件
     */
    private String edCertificates;
    /**
     * 教师资格证证件
     */
    private String teaQuaNumber;
    /**
     * 身份证号码
     */
    private String idCard;
    
    
    /**
     * 学科
     */
    private String subject;
  
    /**
     * 教学版本ID
     */
    private Integer teachversionId;

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

    /**课件表
     * 审核否
     */
    private Integer examinebit;
    
    /**
     * 视频附件
     */
    private String video;

    /**
     * 试卷附件
     */
    private String paper;
    
    /**
     * 教师职称
     */
    private String teatitle;

	public Integer getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public Integer getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}

	public Integer getTeaTitle_id() {
		return teaTitle_id;
	}

	public void setTeaTitle_id(Integer teaTitle_id) {
		this.teaTitle_id = teaTitle_id;
	}

	public String getTeacherNickname() {
		return teacherNickname;
	}

	public void setTeacherNickname(String teacherNickname) {
		this.teacherNickname = teacherNickname;
	}

	public String getTeachername() {
		return teachername;
	}

	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getTeachage() {
		return teachage;
	}

	public void setTeachage(String teachage) {
		this.teachage = teachage;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getDatebirth() {
		return datebirth;
	}

	public void setDatebirth(Date datebirth) {
		this.datebirth = datebirth;
	}

	public String getGraduationcollege() {
		return graduationcollege;
	}

	public void setGraduationcollege(String graduationcollege) {
		this.graduationcollege = graduationcollege;
	}

	public String getWorkunit() {
		return workunit;
	}

	public void setWorkunit(String workunit) {
		this.workunit = workunit;
	}

	public Integer getQq() {
		return qq;
	}

	public void setQq(Integer qq) {
		this.qq = qq;
	}

	public String getWechat() {
		return wechat;
	}

	public void setWechat(String wechat) {
		this.wechat = wechat;
	}

	public String getTeacherstyle() {
		return teacherstyle;
	}

	public void setTeacherstyle(String teacherstyle) {
		this.teacherstyle = teacherstyle;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getPersonalprofile() {
		return personalprofile;
	}

	public void setPersonalprofile(String personalprofile) {
		this.personalprofile = personalprofile;
	}

	public Integer getExamineBit() {
		return examineBit;
	}

	public void setExamineBit(Integer examineBit) {
		this.examineBit = examineBit;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
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

	public String getPaper() {
		return paper;
	}

	public void setPaper(String paper) {
		this.paper = paper;
	}

	public String getTeatitle() {
		return teatitle;
	}

	public void setTeatitle(String teatitle) {
		this.teatitle = teatitle;
	}

	public Date getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(Date creationTime) {
		this.creationTime = creationTime;
	}

	public String getCreationTimeStr() {
		return creationTimeStr;
	}

	public void setCreationTimeStr(String creationTimeStr) {
		this.creationTimeStr = creationTimeStr;
	}

	public String getEdCertificates() {
		return edCertificates;
	}

	public void setEdCertificates(String edCertificates) {
		this.edCertificates = edCertificates;
	}

	public String getTeaQuaNumber() {
		return teaQuaNumber;
	}

	public void setTeaQuaNumber(String teaQuaNumber) {
		this.teaQuaNumber = teaQuaNumber;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
    
    
}
