package com.lm.po;

import java.io.Serializable;
import java.util.Date;
/**
 * 资讯表
 */
/**
 * @author 
 */
public class Informationtable implements Serializable {
    /**
     * 资讯ID
     */
    private Integer informationId;

    /**
     * 大标题
     */
    private String headline;

    /**
     * 创建时间
     */
    private Date uploadtime;
    private String uploadtimeStr;
    
    /**
     * 副标题
     */
    private String subtitle;

    /**
     * 资讯图片
     */
    private String inforpicture;

    /**
     * 内容
     */
    private String content;
    /**
     * 启用否
     */
    private Integer enabledBit;

    private static final long serialVersionUID = 1L;

    public Integer getInformationId() {
        return informationId;
    }

    public void setInformationId(Integer informationId) {
        this.informationId = informationId;
    }

    public String getHeadline() {
        return headline;
    }

    public void setHeadline(String headline) {
        this.headline = headline;
    }

    public Date getUploadtime() {
        return uploadtime;
    }

    public void setUploadtime(Date uploadtime) {
        this.uploadtime = uploadtime;
    }

	public String getSubtitle() {
		return subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	public String getInforpicture() {
		return inforpicture;
	}

	public void setInforpicture(String inforpicture) {
		this.inforpicture = inforpicture;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getEnabledBit() {
		return enabledBit;
	}

	public void setEnabledBit(Integer enabledBit) {
		this.enabledBit = enabledBit;
	}

	public String getUploadtimeStr() {
		return uploadtimeStr;
	}

	public void setUploadtimeStr(String uploadtimeStr) {
		this.uploadtimeStr = uploadtimeStr;
	}
}