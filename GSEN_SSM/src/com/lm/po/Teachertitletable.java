package com.lm.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Teachertitletable implements Serializable {
    /**
     * 教师职称ID
     */
    private Integer teatitleId;

    /**
     * 教师职称
     */
    private String teatitle;

    private static final long serialVersionUID = 1L;

    public Integer getTeatitleId() {
        return teatitleId;
    }

    public void setTeatitleId(Integer teatitleId) {
        this.teatitleId = teatitleId;
    }

    public String getTeatitle() {
        return teatitle;
    }

    public void setTeatitle(String teatitle) {
        this.teatitle = teatitle;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        Teachertitletable other = (Teachertitletable) that;
        return (this.getTeatitleId() == null ? other.getTeatitleId() == null : this.getTeatitleId().equals(other.getTeatitleId()))
            && (this.getTeatitle() == null ? other.getTeatitle() == null : this.getTeatitle().equals(other.getTeatitle()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getTeatitleId() == null) ? 0 : getTeatitleId().hashCode());
        result = prime * result + ((getTeatitle() == null) ? 0 : getTeatitle().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", teatitleId=").append(teatitleId);
        sb.append(", teatitle=").append(teatitle);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}