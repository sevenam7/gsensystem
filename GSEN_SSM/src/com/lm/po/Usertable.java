package com.lm.po;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 
 */
public class Usertable implements Serializable {
    /**
     * 用户ID
     */
    private Integer userId;

    /**
     * 用户类型ID
     */
    private Integer userType_id;
    
    /**
     * 昵称
     */
    private String nickname;

    /**
     * 姓名
     */
    private String name;
    
    /**
     * 账号
     */
    private String account;

    /**
     * 密码
     */
    private String password;

    /**
     * 邮箱地址
     */
    private String mailboxaddress;

    /**
     * 地址
     */
    private String address;

    /**
     * 性别
     */
    private String sex;

    /**
     * 手机号码
     */
    private String phoneNumber;

    /**
     * 微信
     */
    private String wechat;
    
    /**
     * 登录次数
     */
    private Integer loginNumber;
  
    /**
     * 启用否
     */
    private Integer enabledBit;
    
    /**
     * 创建时间
     */
    private Date creationTime;
    private String creationTimeStr;

    /**
     * 图片
     */
    private String picture;
    
    private static final long serialVersionUID = 1L;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getUserType_id() {
		return userType_id;
	}

	public void setUserType_id(Integer userType_id) {
		this.userType_id = userType_id;
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

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMailboxaddress() {
		return mailboxaddress;
	}

	public void setMailboxaddress(String mailboxaddress) {
		this.mailboxaddress = mailboxaddress;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getWechat() {
		return wechat;
	}

	public void setWechat(String wechat) {
		this.wechat = wechat;
	}

	public Integer getLoginNumber() {
		return loginNumber;
	}

	public void setLoginNumber(Integer loginNumber) {
		this.loginNumber = loginNumber;
	}

	public Integer getEnabledBit() {
		return enabledBit;
	}

	public void setEnabledBit(Integer enabledBit) {
		this.enabledBit = enabledBit;
	}

	public Date getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(Date creationTime) {
		this.creationTime = creationTime;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getCreationTimeStr() {
		return creationTimeStr;
	}

	public void setCreationTimeStr(String creationTimeStr) {
		this.creationTimeStr = creationTimeStr;
	}



   
}