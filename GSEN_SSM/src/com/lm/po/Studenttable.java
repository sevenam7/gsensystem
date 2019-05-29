package com.lm.po;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 
 */
public class Studenttable implements Serializable {
    /**
     * 学生ID
     */
    private Integer studentId;

    /**
     * 昵称
     */
    private String nickname;

    /**
     * 姓名
     */
    private String name;

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
     * QQ
     */
    private Integer qq;

    /**
     * 微信
     */
    private String wechat;

    /**
     * 启用否
     */
    private Integer enabledbit;

    /**
     * 创建时间
     */
    private Date creationtime;
    private String creationtimeStr;

    /**
     * 图片
     */
    private String picture;

    private static final long serialVersionUID = 1L;

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public Integer getEnabledbit() {
        return enabledbit;
    }

    public void setEnabledbit(Integer enabledbit) {
        this.enabledbit = enabledbit;
    }

    public Date getCreationtime() {
        return creationtime;
    }

    public void setCreationtime(Date creationtime) {
        this.creationtime = creationtime;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

	public String getCreationtimeStr() {
		return creationtimeStr;
	}

	public void setCreationtimeStr(String creationtimeStr) {
		this.creationtimeStr = creationtimeStr;
	}
}