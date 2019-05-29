package com.lm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lm.dao.CourseevatableMapper;
import com.lm.dao.CoursetableMapper;
import com.lm.dao.GradetableMapper;
import com.lm.dao.IntegraltableMapper;
import com.lm.dao.LogtableMapper;
import com.lm.dao.PapertableMapper;
import com.lm.dao.StudenttableMapper;
import com.lm.dao.SubjecttableMapper;
import com.lm.dao.TeachertableMapper;
import com.lm.dao.TeachertitletableMapper;
import com.lm.dao.TeachversiontableMapper;
import com.lm.dao.UsertableMapper;
import com.lm.dao.UsertypetableMapper;
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
import com.lm.service.IUsertableService;
import com.lm.vo.CourseVo;
import com.lm.vo.TeaVo;
import com.lm.vo.UserVo;

/**
 *用户管理
 */
@Transactional//事务
@Service("iUsertableService")//服务层注解
public class UsertableServiceimpl implements IUsertableService {
	//注入dao层
	//用户表
    @Autowired
	private UsertableMapper usertableMapper;
    //用户类型表
    @Autowired
    private UsertypetableMapper usertypetableMapper;
    //老师表
    @Autowired
    private TeachertableMapper teachertableMapper;
    //学科表
    @Autowired
    private SubjecttableMapper subjecttableMapper;
    //教师职称表
    @Autowired
    private TeachertitletableMapper teachertitletableMapper;
   //教学版本表
    @Autowired
    private TeachversiontableMapper teachversiontableMapper;
   //年级表
    @Autowired
    private GradetableMapper gradetableMapper;
    //课件表
    @Autowired
    private CoursetableMapper coursetableMapper;
    //试卷表
    @Autowired
    private PapertableMapper papertableMapper;
    //积分表
    @Autowired
    private IntegraltableMapper integraltableMapper;
  //学生表
    @Autowired
    private StudenttableMapper studenttableMapper;
    //课件评价表
    @Autowired
    private CourseevatableMapper courseevatableMapper;
    //日志表
    @Autowired
    private LogtableMapper logtableMapper;
    
    /**
	 * 根据账号查询用户
	 * @param account
	 */
	@Override
	public Usertable selectuserByName(String account) {
		// TODO Auto-generated method stub
		return usertableMapper.selectuserByName(account);
	}
	/**
	 * 修改登录次数
	 * @param account
	 * @param loginNumber
	 */
    public int updateloginNumber(String account, String loginNumber){
    	return usertableMapper.updateloginNumber(account, loginNumber);
    }
    /**
   	 * 根据用户类型id查询用户类型信息
   	 * @param usertypeId
   	 */
   	@Override
   	public Usertypetable selectuserTypeByid(int usertypeId) {
   		// TODO Auto-generated method stub
   		return usertypetableMapper.selectuserTypeByid(usertypeId);
   	}
   	/**
	 * 查询管理员信息
	 */
	@Override
	public List<UserVo> selectAdminALL(String account, String name,
			String address) {
		// TODO Auto-generated method stub
		return usertableMapper.selectAdminALL(account, name, address);
	}
	/**
	 * 查询用户类型
	 * @return
	 */
	@Override
	public List<Usertypetable> selectuserType() {
		// TODO Auto-generated method stub
		return usertypetableMapper.selectuserType();
	}
	/**
	 * 新增管理员信息
	 */
	@Override
	public int insertAdmin(Usertable userTable) {
		// TODO Auto-generated method stub
		return usertableMapper.insertAdmin(userTable);
	}
	/**
	 * 根据账号查询账号唯一
	 */
	@Override
	public List<Usertable> selectOnlyAdminByAccount(String account) {
		// TODO Auto-generated method stub
		return usertableMapper.selectOnlyAdminByAccount(account);
	}
	/**
	 * 根据用户账号进行删除
	 */
	@Override
	public int deleteAdmin(String account) {
		// TODO Auto-generated method stub
		return usertableMapper.deleteAdmin(account);
	}
	/**
	 * 修改管理员信息
	 * @param usertable
	 * @return
	 */
	@Override
	public int updateAdmin(Usertable usertable) {
		// TODO Auto-generated method stub
		return usertableMapper.updateAdmin(usertable);
	}
	/**
	 * 修改用户密码
	 * @param userId
	 * @param password
	 * @return
	 */
	@Override
	public int updatePassword(int userId, String password) {
		// TODO Auto-generated method stub
		return usertableMapper.updatePassword(userId, password);
	}
	
	/**
	 * 查询学科
	 */
	@Override
	public List<Subjecttable> selectSubject() {
		// TODO Auto-generated method stub
		return subjecttableMapper.selectSubject();
	}

	/**
	 * 查询教师职称
	 */
	@Override
	public List<Teachertitletable> selectTeachertitle() {
		// TODO Auto-generated method stub
		return teachertitletableMapper.selectTeachertitle();
	}
	/**
	 * 查询老师信息
	 */
	@Override
	public List<TeaVo> selectTeacherALL(String teachername,
			String graduationcollege, int subjectId, String startTime,
			String endTime, int teaTitle_id, int examineBit) {
		// TODO Auto-generated method stub
		return teachertableMapper.selectTeacherALL(teachername, graduationcollege, subjectId, startTime, endTime, teaTitle_id, examineBit);
	}
	/**
	 * 根据id查询老师信息
	 */
	@Override
	public Teachertable selectTeacherBYid(int teacherId) {
		// TODO Auto-generated method stub
		return teachertableMapper.selectTeacherBYid(teacherId);
	}
	/**
	 * 根据id查询学科
	 */
	@Override
	public Subjecttable selectSubjectBYid(int subjectId) {
		// TODO Auto-generated method stub
		return subjecttableMapper.selectSubjectBYid(subjectId);
	}
	/**
	 * 修改老师信息
	 */
	@Override
	public int updateTeacher(Teachertable teachertable) {
		// TODO Auto-generated method stub
		return teachertableMapper.updateTeacher(teachertable);
	}
	/**
	 * 教学版本
	 */
	@Override
	public List<Teachversiontable> selectTeachversion() {
		// TODO Auto-generated method stub
		return teachversiontableMapper.selectTeachversion();
	}
	/**
	 * 查询年级
	 */
	@Override
	public List<Gradetable> selectGrade() {
		// TODO Auto-generated method stub
		return gradetableMapper.selectGrade();
	}
	/**
	 * 查询课件信息
	 */
	@Override
	public List<CourseVo> selectCourseALL(String coursename,
			int teachversionId, int gradeId,int teacher_id) {
		// TODO Auto-generated method stub
		return coursetableMapper.selectCourseALL(coursename, teachversionId, gradeId,teacher_id);
	}
	/**
	 * 查询试卷名称和试卷id
	 */
	@Override
	public List<Papertable> selectpaperName() {
		// TODO Auto-generated method stub
		return papertableMapper.selectpaperName();
	}
	/**
	 * 新增课件包
	 */
	@Override
	public int insertCourse(Coursetable coursetable) {
		// TODO Auto-generated method stub
		return coursetableMapper.insertCourse(coursetable);
	}
	/**
	 * 根据课件包名称和老师id查询课件包
	 */
	@Override
	public List<Coursetable> selectCourseBYcoursename(String coursename,
			int teacher_id) {
		// TODO Auto-generated method stub
		return coursetableMapper.selectCourseBYcoursename(coursename, teacher_id);
	}
	/**
	 * 根据课件包id查询课件包
	 */
	@Override
	public Coursetable selectCourseBYid(int courseId) {
		// TODO Auto-generated method stub
		return coursetableMapper.selectCourseBYid(courseId);
	}
	/**
	 * 修改课件包信息
	 */
	@Override
	public int updateCourse(Coursetable coursetable) {
		// TODO Auto-generated method stub
		return coursetableMapper.updateCourse(coursetable);
	}
	/**
	 *  修改课件时查询课件包名称是否唯一
	 */
	@Override
	public List<Coursetable> selectCourseNameOnly(String coursename,
			int teacher_id, int courseId) {
		// TODO Auto-generated method stub
		return coursetableMapper.selectCourseNameOnly(coursename, teacher_id, courseId);
	}
	/**
	 * 根据课件id进行删除
	 */
	@Override
	public int deleteCourse(int courseId) {
		// TODO Auto-generated method stub
		return coursetableMapper.deleteCourse(courseId);
	}
	/**
	 * 根据id查询年级
	 */
	@Override
	public Gradetable selectGradeBYid(int gradeId) {
		// TODO Auto-generated method stub
		return gradetableMapper.selectGradeBYid(gradeId);
	}
	/**
	 * 根据id查询教学版本
	 */
	@Override
	public Teachversiontable selectTeachversionBYid(int teachversionId) {
		// TODO Auto-generated method stub
		return teachversiontableMapper.selectTeachversionBYid(teachversionId);
	}
	/**
	 *  查询老师积分信息 
	 */
	@Override
	public List<Integraltable> selectIntegral(String teachername,
			String integraldirection, String startTime, String endTime,int teacher_id) {
		// TODO Auto-generated method stub
		return integraltableMapper.selectIntegral(teachername, integraldirection, startTime, endTime,teacher_id);
	}
	/**
	 * 根据积分id查询积分信息
	 */
	@Override
	public Integraltable selectIntegralBYid(int integralId) {
		// TODO Auto-generated method stub
		return integraltableMapper.selectIntegralBYid(integralId);
	}
	/**
	 * 根据积分id修改积分有效否
	 */
	@Override
	public int updateIntegral(Integraltable integraltable) {
		// TODO Auto-generated method stub
		return integraltableMapper.updateIntegral(integraltable);
	}
	/**
	 * 查询学生信息
	 */
	@Override
	public List<Studenttable> selectStudentALL(String name, int enabledbit,
			String startTime, String endTime) {
		// TODO Auto-generated method stub
		return studenttableMapper.selectStudentALL(name, enabledbit, startTime, endTime);
	}
	/**
	 * 根据学生id查询学生信息
	 */
	@Override
	public Studenttable selectStudentBYid(int studentId) {
		// TODO Auto-generated method stub
		return studenttableMapper.selectStudentBYid(studentId);
	}
	/**
	 * 根据学生id修改学生启用否
	 */
	@Override
	public int updateStudentBYstudentId(Studenttable studenttable) {
		// TODO Auto-generated method stub
		return studenttableMapper.updateStudentBYstudentId(studenttable);
	}
	/**
	 * 根据学生id查询学生积分信息
	 */
	@Override
	public List<Integraltable> selectIntegralBYstudentId(String name,
			String integraldirection, String startTime, String endTime,
			int studentId) {
		// TODO Auto-generated method stub
		return integraltableMapper.selectIntegralBYstudentId(name, integraldirection, startTime, endTime, studentId);
	}
	/**
	 * 修改时判断用户是否唯一 
	 */
	@Override
	public List<Usertable> selectOnlyAdminedit(String account, int userId) {
		// TODO Auto-generated method stub
		return usertableMapper.selectOnlyAdminedit(account, userId);
	}
	/**
	 * 查询课件评价信息 
	 */
	@Override
	public List<CourseVo> selectCourseevaALL(String coursename,
			String name, int enabledbit) {
		// TODO Auto-generated method stub
		return courseevatableMapper.selectCourseevaALL(coursename, name, enabledbit);
	}
	/**
	 * 根据课件评价id查询课件评价信息
	 */
	@Override
	public Courseevatable selectCourseevaBYid(int courseevaId) {
		// TODO Auto-generated method stub
		return courseevatableMapper.selectCourseevaBYid(courseevaId);
	}
	/**
	 * 根据课件评价id修改评价启用否
	 */
	@Override
	public int exCourseevaBYid(Courseevatable courseevatable) {
		// TODO Auto-generated method stub
		return courseevatableMapper.exCourseevaBYid(courseevatable);
	}
	/**
	 * 根据课件包id查询课件评价信息
	 */
	@Override
	public List<Courseevatable> selectCourseevaBYcourseId(int courseId) {
		// TODO Auto-generated method stub
		return courseevatableMapper.selectCourseevaBYcourseId(courseId);
	}
	/**
	 * 根据课件id删除课件评价信息
	 */
	@Override
	public int deleteCourseevaBYcourseId(int courseId) {
		// TODO Auto-generated method stub
		return courseevatableMapper.deleteCourseevaBYcourseId(courseId);
	}
	/**
	 *  查询日志信息
	 */
	@Override
	public List<Logtable> selectLog(String name, int userType_id) {
		// TODO Auto-generated method stub
		return logtableMapper.selectLog(name, userType_id);
	}
	/**
	 * 根据用户id查询用户信息
	 */
	@Override
	public Usertable selectAdmineBYuserId(int userId) {
		// TODO Auto-generated method stub
		return usertableMapper.selectAdmineBYuserId(userId);
	}
	/**
	 * 新增日志
	 */
	@Override
	public int insertLog(Logtable logtable) {
		// TODO Auto-generated method stub
		return logtableMapper.insertLog(logtable);
	}
	/**
	 * 根据用户类型名称查询用户类型 
	 */
	@Override
	public List<Usertypetable> selectuserTypeBYname(String usertype) {
		// TODO Auto-generated method stub
		return usertypetableMapper.selectuserTypeBYname(usertype);
	}
    
}
