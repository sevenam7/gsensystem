package com.lm.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lm.po.Courseevatable;
import com.lm.po.Coursetable;
import com.lm.po.Gradetable;
import com.lm.po.Integraltable;
import com.lm.po.Logtable;
import com.lm.po.Papertable;
import com.lm.po.Studenttable;
import com.lm.po.Subjecttable;
import com.lm.po.Teachertable;
import com.lm.po.Teachertitletable;
import com.lm.po.Teachversiontable;
import com.lm.po.Usertable;
import com.lm.po.Usertypetable;
import com.lm.vo.CourseVo;
import com.lm.vo.TeaVo;
import com.lm.vo.UserVo;

public interface IUsertableService {
	/**
	 * 根据账号查询用户
	 * 
	 * @param account
	 */
	Usertable selectuserByName(String account);
	
	/**
	 * 修改登录次数
	 * @param account
	 * @param loginNumber
	 */
	int updateloginNumber(String account, String loginNumber);
	
	/**
	 * 根据用户类型id查询用户类型信息
	 * @param usertypeId
	 */
	Usertypetable selectuserTypeByid(int usertypeId);
	
	/**
	 * 查询管理员信息
	 */
	List<UserVo> selectAdminALL(String account, String name,String address);
	/**
	 * 查询用户类型
	 * @return
	 */
	List<Usertypetable> selectuserType();
	/**
	 * 新增管理员信息
	 * @param userTable
	 * @return
	 */
	int insertAdmin(Usertable userTable);
	/**
	 * 根据账号查询账号唯一
	 * @param account
	 * @return
	 */
	List<Usertable> selectOnlyAdminByAccount(
			@Param("account") String account);
	/**
	 * 根据用户账号进行删除
	 * @param account
	 * @return
	 */
	int deleteAdmin(@Param("account") String account);
	/**
	 * 修改管理员信息
	 * @param account
	 * @return
	 */
	int updateAdmin(Usertable usertable);
	/**
	 * 修改用户密码
	 * @param userId
	 * @param password
	 * @return
	 */
	int updatePassword(@Param("userId") int userId,
			@Param("password") String password);
	/**
	 * 查询老师信息
	 * @param teachername
	 * @param graduationcollege
	 * @param subjectId
	 * @param startTime
	 * @param endTime
	 * @param teaTitle_id
	 * @param examineBit
	 * @return
	 */
	List<TeaVo> selectTeacherALL(@Param("teachername") String teachername,
			@Param("graduationcollege") String graduationcollege,
			@Param("subjectId") int subjectId,
			@Param("startTime") String startTime,
			@Param("endTime") String endTime,
			@Param("teaTitle_id") int teaTitle_id,
			@Param("examineBit") int examineBit);
	/**
	 * 查询学科
	 * @return
	 */
   List<Subjecttable> selectSubject();
   /**
	 * 查询教师职称
	 * @return
	 */
   List<Teachertitletable> selectTeachertitle();
	/**
	 * 根据id查询老师信息
	 * @param teacherId
	 * @return
	 */
	Teachertable selectTeacherBYid(@Param("teacherId") int teacherId);

	/**
	 * 根据id查询学科
	 * 
	 * @return
	 */
	Subjecttable selectSubjectBYid(@Param("subjectId") int subjectId);
	/**
	 * 修改老师信息
	 * @param teachertable
	 * @return
	 */
	int updateTeacher(Teachertable teachertable);
	/**
	 * 查询教学版本
	 * @return
	 */
    List<Teachversiontable> selectTeachversion();
    /**
	 * 查询年级
	 * @return
	 */
	List<Gradetable> selectGrade();
	/**
	 * 根据老师id查询课件信息
	 * @return
	 */
	List<CourseVo> selectCourseALL(@Param("coursename") String coursename,
			@Param("teachversionId") int teachversionId,
			@Param("gradeId") int gradeId,
			@Param("teacher_id") int teacher_id);
	/**
	 * 查询试卷名称和试卷id
	 * @return
	 */
    List<Papertable> selectpaperName();
    /**
	 * 新增课件包
	 * @param coursetable
	 * @return
	 */
	int insertCourse(Coursetable coursetable);
	
	/**
	 * 根据课件包名称和老师id查询课件包
	 * @param coursename
	 * @return
	 */
	List<Coursetable> selectCourseBYcoursename(@Param("coursename") String coursename,
          @Param("teacher_id") int teacher_id);
	/**
	 * 根据课件包id查询课件包信息
	 * @param courseId
	 * @return
	 */
	Coursetable selectCourseBYid(@Param("courseId") int courseId);
	/**
	 * 修改课件包信息
	 * @param coursetable
	 * @return
	 */
	int updateCourse(Coursetable coursetable);
	/**
	 * 修改课件时查询课件包名称是否唯一
	 * @param coursename
	 * @param teacher_id
	 * @param courseId
	 * @return
	 */
	List<Coursetable> selectCourseNameOnly(@Param("coursename") String coursename,
	          @Param("teacher_id") int teacher_id,@Param("courseId") int courseId);
	/**
	 * 根据课件id进行删除
	 * @param courseId
	 * @return
	 */
	int deleteCourse(@Param("courseId") int courseId);
	/**
	 * 根据id查询年级
	 */
	Gradetable selectGradeBYid(int gradeId);
	 /**
     * 根据id查询教学版本
     * @param teachversionId
     * @return
     */
    Teachversiontable selectTeachversionBYid(int teachversionId);
    
	/**
	 *  根据老师id查询老师积分信息 
	 * @param teachername
	 * @param integraldirection
	 * @param startTime
	 * @param endTime
	 * @return
	 */
    List<Integraltable> selectIntegral(@Param("teachername") String teachername,
			@Param("integraldirection") String integraldirection,
			@Param("startTime") String startTime,
			@Param("endTime") String endTime,
			@Param("teacher_id") int teacher_id);
    /**
     * 根据积分id查询积分信息
     * @param integralId
     * @return
     */
    Integraltable selectIntegralBYid(@Param("integralId") int integralId);
    /**
     * 根据积分id修改积分有效否
     * @param integraltable
     * @return
     */
    int updateIntegral(Integraltable integraltable); 
    /**
     * 查询学生信息
     * @param name
     * @param enabledbit
     * @param startTime
     * @param endTime
     * @return
     */
       List<Studenttable> selectStudentALL(@Param("name") String name,
       		@Param("enabledbit") int enabledbit,
   			@Param("startTime") String startTime,
   			@Param("endTime") String endTime
   			);
       /**
        * 根据学生id查询学生信息
        * @param studentId
        * @return
        */
       Studenttable selectStudentBYid(@Param("studentId") int studentId);
       /**
        * 根据学生id修改学生启用否
        * @param studenttable
        * @return
        */
       int updateStudentBYstudentId(Studenttable studenttable); 
   	/**
   	 *  根据学生id查询学生积分信息 
   	 * @param teachername
   	 * @param integraldirection
   	 * @param startTime
   	 * @param endTime  
   	 * @return
   	 */
       List<Integraltable> selectIntegralBYstudentId(@Param("name") String name,
   			@Param("integraldirection") String integraldirection,
   			@Param("startTime") String startTime,
   			@Param("endTime") String endTime,
   			@Param("studentId") int studentId);
       /**
   	 * 修改时判断用户是否唯一 
   	 * @param account
   	 * @param userId
   	 * @return
   	 */
   	List<Usertable> selectOnlyAdminedit(@Param("account") String account,@Param("userId") int userId);
   	/**
	 * -查询课件评价信息 
	 * @param coursename
	 * @param name
	 * @param enabledbit
	 * @return
	 */
   List<CourseVo> selectCourseevaALL(@Param("coursename") String coursename,
			@Param("name") String name,
			@Param("enabledbit") int enabledbit);
   /**
    * 根据课件评价id查询课件评价信息
    * @param courseevaId
    * @return
    */
   Courseevatable selectCourseevaBYid(@Param("courseevaId") int courseevaId);
   /**
    * 根据课件评价id修改评价启用否
    * @param courseevatable
    * @return
    */
   int  exCourseevaBYid(Courseevatable courseevatable);
   /**
    * 根据课件包id查询课件评价信息
    * @param courseId
    * @return
    */
   List<Courseevatable> selectCourseevaBYcourseId(@Param("courseId") int courseId);
   /**
    * 根据课件id删除课件评价信息
    * @param courseId
    * @return
    */
   int deleteCourseevaBYcourseId(@Param("courseId") int courseId);
   /**
	 * 查询日志信息
	 */
   List<Logtable> selectLog(@Param("name") String name,
			@Param("userType_id") int userType_id);
	/**
	 * 根据用户id查询用户信息
	 * @param userId
	 * @return
	 */
	Usertable selectAdmineBYuserId(@Param("userId") int userId);
    /**
     * 新增日志
     * @param logtable
     * @return
     */
    int insertLog(Logtable logtable);
    /**
     * 根据用户类型名称查询用户类型 
     * @param usertype
     * @return
     */
    List<Usertypetable> selectuserTypeBYname(@Param("usertype") String usertype);
}
