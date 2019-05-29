package com.lm.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Subjecttable implements Serializable {
    /**
     * 学科ID
     */
    private Integer subjectId;

    /**
     * 学科
     */
    private String subject;

    private static final long serialVersionUID = 1L;

    public Integer getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }
}