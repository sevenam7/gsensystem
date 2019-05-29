package com.lm.po;

import java.io.Serializable;

/**
 * 教学版本表
 */
public class Teachversiontable implements Serializable {
    /**
     * 教学版本ID
     */
    private Integer teachversionId;

    /**
     * 教学版本
     */
    private String teachversion;

    private static final long serialVersionUID = 1L;

    public Integer getTeachversionId() {
        return teachversionId;
    }

    public void setTeachversionId(Integer teachversionId) {
        this.teachversionId = teachversionId;
    }

    public String getTeachversion() {
        return teachversion;
    }

    public void setTeachversion(String teachversion) {
        this.teachversion = teachversion;
    }
}