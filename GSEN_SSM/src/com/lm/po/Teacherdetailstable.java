package com.lm.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Teacherdetailstable implements Serializable {
    /**
     * 老师明细ID
     */
    private Integer teacherdetailsId;

    /**
     * 老师ID
     */
    private Integer teacherId;

    /**
     * 学生ID 
     */
    private Integer studentId;

    private static final long serialVersionUID = 1L;

    public Integer getTeacherdetailsId() {
        return teacherdetailsId;
    }

    public void setTeacherdetailsId(Integer teacherdetailsId) {
        this.teacherdetailsId = teacherdetailsId;
    }

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }
}