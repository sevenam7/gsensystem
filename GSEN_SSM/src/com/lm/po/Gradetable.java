package com.lm.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Gradetable implements Serializable {
    /**
     * 年级ID
     */
    private Integer gradeId;

    /**
     * 年级名称
     */
    private String gradename;

    private static final long serialVersionUID = 1L;

    public Integer getGradeId() {
        return gradeId;
    }

    public void setGradeId(Integer gradeId) {
        this.gradeId = gradeId;
    }

    public String getGradename() {
        return gradename;
    }

    public void setGradename(String gradename) {
        this.gradename = gradename;
    }
}