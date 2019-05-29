package com.lm.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Papertypetable implements Serializable {
    /**
     * 试卷类型ID
     */
    private Integer papertypeId;

    /**
     * 试卷类型
     */
    private String papertype;

    private static final long serialVersionUID = 1L;

    public Integer getPapertypeId() {
        return papertypeId;
    }

    public void setPapertypeId(Integer papertypeId) {
        this.papertypeId = papertypeId;
    }

    public String getPapertype() {
        return papertype;
    }

    public void setPapertype(String papertype) {
        this.papertype = papertype;
    }
}