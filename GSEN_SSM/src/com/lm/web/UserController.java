package com.lm.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.io.FileUtils;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.lm.po.Courseevatable;
import com.lm.po.Coursetable;
import com.lm.po.Gradetable;
import com.lm.po.Integraltable;
import com.lm.po.Logtable;
import com.lm.po.Papertable;
import com.lm.po.Papertypetable;
import com.lm.po.Studenttable;
import com.lm.po.Subjecttable;
import com.lm.po.Teachertable;
import com.lm.po.Teachertitletable;
import com.lm.po.Teachversiontable;
import com.lm.po.Usertable;
import com.lm.po.Usertypetable;
import com.lm.service.IUsertableService;
import com.lm.service.IYearTruthService;
import com.lm.util.MD5Util;
import com.lm.util.ValidateImage.GifCaptcha;
import com.lm.vo.CourseVo;
import com.lm.vo.TeaVo;
import com.lm.vo.UserVo;

/**
 *用户管理
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {
	//注入service层
	@Autowired
     private IUsertableService iUsertableService;
	//试卷
	@Autowired
	private IYearTruthService iYearTruthService;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	/**
	 * 主页面
	 */
	@RequestMapping("/main")
	public ModelAndView main(String account) {
		ModelAndView mv = new ModelAndView("/LoginManagement/Main");
		Usertable user = iUsertableService.selectuserByName(account);
		int UserType_id=user.getUserType_id();
		Usertypetable usertype=iUsertableService.selectuserTypeByid(UserType_id);
		mv.addObject("usertype", usertype);
		mv.addObject("userdata", user);
		return mv;
	}
	
	/**
	 * 登录页面
	 */
	@RequestMapping("/logins")
	public ModelAndView login(String useraccount) {
		ModelAndView mv = new ModelAndView("/LoginManagement/Login");
		return mv;
	}
	
	// 登录验证
	@RequestMapping(value = "/userlogindo", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String userlogin(HttpServletRequest request, String account,
			String password, String identityKey) {
		JSONObject json = new JSONObject();
		json.put("state", "no");
		String msg = "";
		String state = "no";
		HttpSession session = request.getSession();
		try {
			// 获取session的验证码
			String sessionkey = session.getAttribute("identityKey").toString();
			// 比较输入的验证码是否正确
			if (sessionkey.equalsIgnoreCase(identityKey)) {
				// 根据用户姓名查询是否存在该用户
				Usertable user = iUsertableService.selectuserByName(account);
				if (user != null) {
					// 密码加密验证
					String pw = MD5Util.getMD5(password);//202cb962ac59075b964b07152d234b70
					String ss= user.getPassword().trim();
					if (pw.equals(ss)) {
						state = "ok";
						msg = "登录成功！";
						int userId= user.getUserId();//用户id
						request.getSession().setAttribute("userId", userId);
						// 每次登录记录登录次数
						int result = Integer.parseInt(user.getLoginNumber().toString());
						result++;
						iUsertableService.updateloginNumber(account,String.valueOf(result));
						json.put("data", user);
					} else {
						msg = "输入的密码错误！";
					}
				} else {
					msg = "不存在该用户！";
				}
			} else {
				msg = "验证码错误！";
			}
		} catch (Exception e) {
			msg = "查询数据错误！";
		}
		json.put("msg", msg);
		json.put("state", state);
		return json.toString();
	}
	
	/**
	 * 验证码
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/loginServlet")
	public void loginServlet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		GifCaptcha captcha = new GifCaptcha(125, 38, 5);// 长宽高
		ServletOutputStream out = response.getOutputStream();

		String identityKey = captcha.out(out);

		request.getSession().setAttribute("identityKey", identityKey);
		System.out.println(identityKey);

		out.flush();
		out.close();
	}   

	/**
	 * 首页面
	 */
	@RequestMapping("/Home")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView("/LoginManagement/Home");
		return mv;
	}
	/**
	 * 管理员信息页面
	 */
	@RequestMapping("/Administrators")
	public ModelAndView administrators() {
		ModelAndView mv = new ModelAndView("/UserManagement/AdministratorInfor");
		return mv;
	}
	/**
	 * 教育资讯页面
	 */
	@RequestMapping("/Educational")
	public ModelAndView educational() {
		ModelAndView mv = new ModelAndView("/Educational/Educational");
		return mv;
	}
	/**
	 * 老师管理页面
	 */
	@RequestMapping(value = "/tea_identity", produces = { "application/json;charset=UTF-8" })
	public ModelAndView tea_identity() {
		ModelAndView mv = new ModelAndView("/UserManagement/Tea_identity");
		List<Subjecttable> subjectList=iUsertableService.selectSubject();//学科
		List<Teachertitletable> teachertitleList=iUsertableService.selectTeachertitle();//教师职称
		mv.addObject("subjectList", subjectList);
		mv.addObject("teachertitleList", teachertitleList);
		return mv;
	}
	/**
	 * to老师详情界面
	 * @param teacherId
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings("unused")
	@ResponseBody
	@RequestMapping(value="/detailView")
	private void detailView(int teacherId, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       Teachertable teacher=iUsertableService.selectTeacherBYid(teacherId);
       int subjectId= teacher.getSubjectId();
       Subjecttable subject=iUsertableService.selectSubjectBYid(subjectId);
       List<Teachversiontable> teachversionList=iUsertableService.selectTeachversion();//教学版本
       List<Gradetable> gradeList=iUsertableService.selectGrade();//年级表
       if (teacher!=null) {
    	   request.setAttribute("teacher", teacher);
    	   request.setAttribute("subject", subject);
    	   request.setAttribute("teachversionList", teachversionList);
      	   request.setAttribute("gradeList", gradeList);
    	   request.getRequestDispatcher("/WEB-INF/jsp/UserManagement/Tea_detail.jsp").forward(request, response);
	   }
	}
	/**
	 * to新增课件页面
	 */
	@RequestMapping("/insertCourseView")
	public ModelAndView insertCourseView(int teacherId) {
		ModelAndView mv = new ModelAndView("/UserManagement/Course_in");
		List<Teachversiontable> teachversionList=iUsertableService.selectTeachversion();//教学版本
	    List<Gradetable> gradeList=iUsertableService.selectGrade();//年级表
	    List<Papertable> paperList=iUsertableService.selectpaperName();//试卷名称
	    Teachertable teacherList=iUsertableService.selectTeacherBYid(teacherId);
	    mv.addObject("teachversionList", teachversionList);
	    mv.addObject("gradeList", gradeList);
	    mv.addObject("paperList", paperList);
	    mv.addObject("teacherList", teacherList);
		return mv;
	}
	/**
	 * to修改课件页面
	 */
	@RequestMapping("/updateCourseView")
	public ModelAndView updateCourseView(int courseId) {
		ModelAndView mv = new ModelAndView("/UserManagement/Course_up");
		List<Teachversiontable> teachversionList=iUsertableService.selectTeachversion();//教学版本
	    List<Gradetable> gradeList=iUsertableService.selectGrade();//年级表
	    List<Papertable> paperList=iUsertableService.selectpaperName();//试卷名称
	    Coursetable courseList=iUsertableService.selectCourseBYid(courseId);
	    mv.addObject("teachversionList", teachversionList);
	    mv.addObject("gradeList", gradeList);
	    mv.addObject("paperList", paperList);
	    mv.addObject("courseList", courseList);
		return mv;
	}
	/**
	 * to审核课件包页面
	 */
	@RequestMapping(value = "/exCourseView", produces = { "application/json;charset=UTF-8" })
	public ModelAndView exCourseView(int courseId) {
		ModelAndView mv = new ModelAndView("/UserManagement/Course_ex");
	    Coursetable courseList=iUsertableService.selectCourseBYid(courseId);//课件信息
	    int teachversionId=courseList.getTeachversionId();//教学版本id
	    Teachversiontable  teachversionList=iUsertableService.selectTeachversionBYid(teachversionId);
	    int gradeId=courseList.getGradeId();//年级id
	    Gradetable gradeList=iUsertableService.selectGradeBYid(gradeId);
	    int teacher_id=courseList.getTeacher_id();//老师id
	    Teachertable teacherList=iUsertableService.selectTeacherBYid(teacher_id);
	    int subjectId=teacherList.getSubjectId();//学科id
	    Subjecttable subjectList=iUsertableService.selectSubjectBYid(subjectId);
	    int paperId=courseList.getPapeId();
	    Papertable paperList=iYearTruthService.selectpaperBYpaperid(paperId);//试卷信息
	    mv.addObject("subjectList", subjectList);
	    mv.addObject("teachversionList", teachversionList);
	    mv.addObject("gradeList", gradeList);
		mv.addObject("teacherList", teacherList);
		mv.addObject("courseList", courseList);
		mv.addObject("paperList", paperList);
		return mv;
	}
	
	/**
	 * 历年真题页面
	 */
	@RequestMapping("/yearTtruth")
	public ModelAndView yearTtruth() {
		ModelAndView mv = new ModelAndView("/YearTtruth/yearTtruth");
		List<Subjecttable> subjectList=iUsertableService.selectSubject();
		List<Papertypetable> papertypeList =iYearTruthService.selectPapertype();
		mv.addObject("subjectList", subjectList);
		mv.addObject("papertypeList", papertypeList);
		return mv;
	}
	/**
	 * 学生管理页面
	 * @return
	 */
	@RequestMapping("/student")
	public ModelAndView student() {
		ModelAndView mv = new ModelAndView("/UserManagement/Student");
		return mv;
	}
	/**
	 * to学生详情页面
	 * @return
	 */
	@RequestMapping("/studentDetailView")
	public ModelAndView studentDetailView(int studentId) {
		ModelAndView mv = new ModelAndView("/UserManagement/Student_detail");
		Studenttable studentList=iUsertableService.selectStudentBYid(studentId);
		mv.addObject("studentList", studentList);
		return mv;
	}
	/**
	 * 评价页面
	 * @return
	 */
	@RequestMapping("/evaluationView")
	public ModelAndView evaluationView() {
		ModelAndView mv = new ModelAndView("/EvaluationManagement/Evaluation");
		return mv;
	}
	/**
	 * 日志页面
	 * @return
	 */
	@RequestMapping("/logView")
	public ModelAndView logView() {
		ModelAndView mv = new ModelAndView("/EvaluationManagement/Log");
		return mv;
	}
	/**
	 * 权限管理页面
	 * @return
	 */
	@RequestMapping("/privilegeView")
	public ModelAndView privilegeView() {
		ModelAndView mv = new ModelAndView("/PrivilegeManagement/Privilege");
		return mv;
	}
	/**
	 * 查询管理员信息
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectAdminALL", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String selectAdminALL(String account, String name,
			String address) throws Exception {
		JSONObject json = new JSONObject();
		String msg = "";
		json.put("state", "no");
		json.put("msg", "");
		json.put("data", "");
		try {
			// 获取管理员信息
			List<UserVo> adminALL=iUsertableService.selectAdminALL(account, name, address);
			json.put("state", "ok");
			json.put("data", adminALL);
		} catch (Exception e) {
			throw e;
		}
		json.put("msg", msg);
		return json.toString();
	}
	
	// 用户类型
		@RequestMapping(value = "/selectuserTypedo", produces = { "application/json;charset=UTF-8" })
		@ResponseBody
		public String selectuserType() {
			JSONObject json = new JSONObject();
			List<Usertypetable>  usertypeList=iUsertableService.selectuserType();
			json.put("usertypeList", usertypeList);
			return json.toString();
		}
		
		/**
		 * 新增修改管理员信息
		 * @param myFile
		 * @param userTable
		 * @param opType
		 * @return
		 * @throws IOException
		 */
		@ResponseBody
		@RequestMapping(value = "/IorUAdmin", produces = { "application/json;charset=UTF-8" })
		public String IorUAdmin(@RequestParam(value="upfile",required=false) MultipartFile myFile,Usertable userTable,String opType,String deletePicNo)throws IOException{
			//opType  1是新增，2是修改   
			JSONObject json = new JSONObject();
			json.put("msg", "");
			json.put("state", "no");
			String msg = "";
			String state = "no";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {
				String account=userTable.getAccount();
				List<Usertable> usertable=iUsertableService.selectOnlyAdminByAccount(account);
				if (opType.equals("1")) {//新增
					int total=usertable.size();
					if (total==0) {
						//文件上传路径 1368227496@qq.cn  13580035741
						String upDir="E:/GSEN_SSM_upload/";
						File uploadDir = new File(upDir);
						if (!uploadDir.exists()) {
							uploadDir.mkdir();//不存在就创建
						}
						if (myFile!=null) {
							//获取文件原名
							String fullName=myFile.getOriginalFilename();
							//获取扩展名称
							String ext=fullName.substring(fullName.lastIndexOf('.'));
							//拼接文件保存的名称
							String FileName=System.nanoTime()+ext;
							//保存文件
							FileUtils.writeByteArrayToFile(new File(upDir, FileName), myFile.getBytes());
							userTable.setPicture(upDir+FileName);
						}
						String str = sdf.format(new Date().getTime());//将当前时间格式转成字符串
						Timestamp creationTime= new Timestamp(sdf.parse(str).getTime());
						userTable.setCreationTime(creationTime);
						userTable.setLoginNumber(0);
						userTable.setEnabledBit(1);
						String password= userTable.getPassword();
						String pw= MD5Util.getMD5(password);
						userTable.setPassword(pw);
						int intR = iUsertableService.insertAdmin(userTable);
						if (intR > 0) {
							state = "ok";
							msg = "新增成功";
						} else {
							state = "no";
							msg = "新增失败";
						}
					} else {
						msg = "输入的用户账号已存在";
					}
				} else if(opType.equals("2")){//修改     
					//第一种：deletePicNo等于0，myFile等于null，图片不做任何操作；
					//第二种：deletePicNo等于1，myFile等于null，删除原来的图片，没有上传图片；
					//第三种：deletePicNo等于1或等于0，myFile不等于null，删了原来的图片上传新的图片，或者原来没有图片上传新的图片
					int userId=userTable.getUserId();
					List<Usertable> UserList=iUsertableService.selectOnlyAdminedit(account, userId);//不用也行，因为账号不能修改
					if(UserList.size()==0){
						String pictureOldPath=usertable.get(0).getPicture();//数据库的文件路径
						Date creationTime1=usertable.get(0).getCreationTime();//创建时间
						String str = sdf.format(creationTime1);//将当前时间格式转成字符串
						Timestamp creationTime= new Timestamp(sdf.parse(str).getTime());
						int loginNumber=usertable.get(0).getLoginNumber();//登录次数
						Integer enabledBit=usertable.get(0).getEnabledBit();//启用否
						String password=usertable.get(0).getPassword();//密码
						//文件上传路径 
						String upDir="E:/GSEN_SSM_upload/";
						File uploadDir = new File(upDir);
						String FileName="";//拼接文件保存的名称
						if (!uploadDir.exists()) {
							uploadDir.mkdir();//不存在就创建
						}
						if(deletePicNo.equals("0") && myFile==null){//第一种
							userTable.setPicture(pictureOldPath);
						}else if(deletePicNo.equals("1") && myFile==null){//第二种
							userTable.setPicture("");
						}else if (myFile!=null) {//第三种  E:/GSEN_SSM_upload/89380454180979.jpg
							//获取文件原名
							String fullName=myFile.getOriginalFilename();
							//获取扩展名称
							String ext=fullName.substring(fullName.lastIndexOf('.'));
							//拼接文件保存的名称
							 FileName=System.nanoTime()+ext;
							
							userTable.setPicture(upDir+FileName);
						}
						userTable.setPassword(password);
						userTable.setEnabledBit(enabledBit);
						userTable.setLoginNumber(loginNumber);
						userTable.setCreationTime(creationTime);
						int update=iUsertableService.updateAdmin(userTable);
						if (update > 0) {
							if((deletePicNo.equals("1") && myFile==null)|| myFile!=null){
								File oldFile = new File(pictureOldPath);
								if (oldFile.exists() && oldFile.isFile()) {
									oldFile.delete();//删除文件夹的图片
								}
								if(myFile!=null){
									//保存文件
									FileUtils.writeByteArrayToFile(new File(upDir, FileName), myFile.getBytes());
								}
							}
							state = "ok";
							msg = "修改成功";
						} else {
							state = "no";
							msg = "修改失败";
						}
					}else{
						state = "no";
						msg = "输入的用户名已存在";
					}
				}
			} catch (Exception e) {
				// TODO: handle exception
				msg = e.getMessage();
			}
			json.put("msg", msg);
			json.put("state", state);
			return json.toString();
		}
		/**
		 * 根据页面传过来的图片名称或图片路径在文件夹中查询图片(一张图片) 视频
		 * @param req
		 * @param resp
		 * @throws ServletException
		 * @throws IOException
		 */
		@SuppressWarnings("unused")
		@RequestMapping(value = "/getImg", produces = { "application/json;charset=UTF-8" })
		@ResponseBody
		private void getImg(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
			String strFileName = req.getParameter("file");//获取图片名称或路径
			File file = new File(strFileName);
			if (file.exists() && file.isFile()) {
				FileInputStream in = new FileInputStream(file);
				ServletOutputStream out = resp.getOutputStream();
				byte[] buf = new byte[1024];
				int count = 0;
				while (-1 != (count = in.read(buf, 0, buf.length))) {
					out.write(buf, 0, count);
				}
				resp.setContentType("image/png"); // 设置返回的文件类型
				out.flush();
				out.close();
				in.close();
			}
		}
		/**
		 * 删除管理员信息
		 * @param account
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value = "/delectAdmin", produces = { "application/json;charset=UTF-8" })
		@ResponseBody
		public String delectAdmin(String account) throws Exception {
			JSONObject json = new JSONObject();
			String msg = "";
			json.put("state", "no");
			json.put("msg", "");
			String state = "no";
			// 开启事务
			DefaultTransactionDefinition def = new DefaultTransactionDefinition();
			def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
			TransactionStatus status = transactionManager.getTransaction(def); // get
			try {
				Usertable user = iUsertableService.selectuserByName(account);
				String path=user.getPicture();
				
				 int delete=iUsertableService.deleteAdmin(account);
				 if (delete > 0) {
					    File oldFile = new File(path);
						if (oldFile.exists() && oldFile.isFile()) {
							oldFile.delete();//删除文件夹(上传图片时的路径)里的图片。
						}
						state = "ok";
						msg = "删除成功";
					} else {
						state = "no";
						msg = "删除失败";
					}
				// 提交事务
				if (state.equals("ok")) {
					transactionManager.commit(status);// 提交
				} else {
					transactionManager.rollback(status);// 回滚
				}
			} catch (Exception e) {
				// TODO: handle exception
				transactionManager.rollback(status);// 回滚
			}
			json.put("state", state);
			json.put("msg", msg);
			return json.toString();
		}

		/**
		 * 发送验证码短信，互亿无线api
		 * @param phone
		 */
		private static String Url = "http://106.ihuyi.com/webservice/sms.php?method=Submit";
		@SuppressWarnings("unused")
		@ResponseBody
		@RequestMapping(value="/huyiInfo")
		public String huyi(String phone){
			JSONObject json = new JSONObject();
			String mssg = "";
			
			HttpClient client = new HttpClient(); 
			PostMethod method = new PostMethod(Url);

			client.getParams().setContentCharset("GBK");
			method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=GBK");

			int mobile_code = (int)((Math.random()*9+1)*100000);

			mssg=String.valueOf(mobile_code);
			
		    String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。");

			NameValuePair[] data = {//提交短信
				    new NameValuePair("account", "C31120969"), //查看用户名 登录用户中心->验证码通知短信>产品总览->API接口信息->APIID
				    new NameValuePair("password", "12e866961cd0c6361037046b5cb4cf72"), //查看密码 登录用户中心->验证码通知短信>产品总览->API接口信息->APIKEY
				   // //new NameValuePair("password", util.StringUtil.MD5Encode("密码")),
				    new NameValuePair("mobile", phone), 
				    new NameValuePair("content", content),
			};
			method.setRequestBody(data);

			try {
				client.executeMethod(method);
				
				String SubmitResult =method.getResponseBodyAsString();

				////System.out.println(SubmitResult);

				Document doc = DocumentHelper.parseText(SubmitResult);
				Element root = doc.getRootElement();

				String code = root.elementText("code");
				String msg = root.elementText("msg");
				String smsid = root.elementText("smsid");

//				//System.out.println(code);
//				//System.out.println(msg);
//				//System.out.println(smsid);
				System.out.println("短信验证码："+mobile_code);
				 if("2".equals(code)){
					////System.out.println("短信提交成功");
				}
			} catch (HttpException e) {
				//// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				//// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (DocumentException e) {
				//// TODO Auto-generated catch block
				e.printStackTrace();
			}
			json.put("msg", mssg);
			return json.toString();
		}
		
		/**
		 * 修改用户密码
		 * @param userID
		 * @param newPassword
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value = "/updatePassword", produces = { "application/json;charset=UTF-8" })
		@ResponseBody
		public String updatePassword(int userID,String newPassword)throws Exception{
			JSONObject json = new JSONObject();
			String msg = "";
			json.put("state", "no");
			json.put("msg", "");
			String state = "no";
			Usertable userTable=new Usertable();
			String pw=MD5Util.getMD5(newPassword);
			userTable.setPassword(pw);
			 int intR=iUsertableService.updatePassword(userID, pw);
			 if (intR>0) {
				 state = "ok";
				 msg = "修改成功";
			} else {
				state = "no";
				msg = "修改失败";
			}
			json.put("msg", msg);
			json.put("state", state);
			return json.toString();
		}
		/**
		 * 查询老师信息
		 * @throws Exception
		 */
		@RequestMapping(value = "/selectTeacherALL", produces = { "application/json;charset=UTF-8" })
		@ResponseBody
		public String selectTeacherALL(String teachername,String graduationcollege,int subjectId,
				String startTime,String endTime,int teaTitle_id,int examineBit) throws Exception {
			JSONObject json = new JSONObject();
			String msg = "";
			json.put("state", "no");
			json.put("msg", "");
			json.put("data", "");
			try {
				// 获取管理员信息
				List<TeaVo> teaALL=iUsertableService.selectTeacherALL(teachername, graduationcollege, subjectId, startTime, endTime, teaTitle_id, examineBit);
				json.put("state", "ok");
				json.put("data", teaALL);
			} catch (Exception e) {
				throw e;
			}
			json.put("msg", msg);
			return json.toString();
		}
		
		/**
		 * 修改老师身份审核否
		 * @param id
		 * @return
		 * @throws IOException
		 */
		@RequestMapping(value = "/updateExamine", produces = { "application/json;charset=UTF-8" })
		@ResponseBody
		public String updateExamine(int id)throws IOException{
	 		JSONObject json = new JSONObject();
			String msg = "";
			String state = "no";
			json.put("state", "no");
			json.put("msg", "");
			int typeBitInt;
			Teachertable teachertable=new Teachertable();
			try {
				Teachertable teacher=iUsertableService.selectTeacherBYid(id);
				int bitInt=teacher.getExamineBit();//1是已审核 2是未审核
				if(bitInt==1){
					typeBitInt=2;
				}else{
					typeBitInt=1;
				}
				teachertable.setTeacherId(id);
				teachertable.setSubjectId(teacher.getSubjectId());
				teachertable.setTeaTitle_id(teacher.getTeaTitle_id());
				teachertable.setTeacherNickname(teacher.getTeacherNickname());
				teachertable.setTeachername(teacher.getTeachername());
				teachertable.setPassword(teacher.getPassword());
				teachertable.setPhonenumber(teacher.getPhonenumber());
				teachertable.setSex(teacher.getSex());
				teachertable.setTeachage(teacher.getTeachage());
				teachertable.setEducation(teacher.getEducation());
				teachertable.setAddress(teacher.getAddress());
				teachertable.setDatebirth(teacher.getDatebirth());
				teachertable.setGraduationcollege(teacher.getGraduationcollege());
				teachertable.setWorkunit(teacher.getWorkunit());
				teachertable.setQq(teacher.getQq());
				teachertable.setWechat(teacher.getWechat());
				teachertable.setTeacherstyle(teacher.getTeacherstyle());
				teachertable.setPicture(teacher.getPicture());
				teachertable.setPersonalprofile(teacher.getPersonalprofile());
				teachertable.setExamineBit(typeBitInt);
				teachertable.setCreationTime(teacher.getCreationTime());
				teachertable.setEdCertificates(teacher.getEdCertificates());
				teachertable.setTeaQuaNumber(teacher.getTeaQuaNumber());
				teachertable.setIdCard(teacher.getIdCard());
				int intR=iUsertableService.updateTeacher(teachertable);
				if (intR > 0) {
					state = "ok";
					msg = "修改成功";
				} else {
					state = "no";
					msg = "修改失败";
				}
			} catch (Exception e) {
				// TODO: handle exception
				msg = e.getMessage();
			}
			json.put("state", state);
			json.put("msg", msg);
			return json.toString();
		}

		/**
		 * 查询课件信息
		 * @throws Exception
		 */
		@RequestMapping(value = "/selectCourseALL", produces = { "application/json;charset=UTF-8" })
		@ResponseBody
		public String selectCourseALL(int teacherId,String coursename, int teachversionId,
				int gradeId) throws Exception {
			JSONObject json = new JSONObject();
			String msg = "";
			json.put("state", "no");
			json.put("msg", "");
			json.put("data", "");
			try {
				// 获取课件信息
				List<CourseVo> CourseAll=iUsertableService.selectCourseALL(coursename, teachversionId, gradeId,teacherId);
				json.put("state", "ok");
				json.put("data", CourseAll);
			} catch (Exception e) {
			//	throw e;
				msg = e.getMessage();
			}
			json.put("msg", msg);
			return json.toString();
		}
        /**
         * 新增课件包
         * @param myFile
         * @param coursetable
         * @return
         */
		@ResponseBody
		@RequestMapping(value = "/insertCourse", produces = { "application/json;charset=UTF-8" })
		public String insertCourse(@RequestParam(value="uploadFile",required=true) MultipartFile myFile,Coursetable coursetable){
			JSONObject json = new JSONObject();
			json.put("msg", "");
			json.put("state", "no");
			String msg = "";
			String state = "no";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {
				String name=coursetable.getCoursename();
				int id=coursetable.getTeacher_id();
				List<Coursetable> course=iUsertableService.selectCourseBYcoursename(name, id);
				int total=course.size();
				if(total==0){
					String upDir="E:/GSEN_SSM_upload/";
					File uploadDir = new File(upDir);
					if (!uploadDir.exists()) {
						uploadDir.mkdir();//不存在就创建
					}
					if (myFile!=null) {
						//获取文件原名
						String fullName=myFile.getOriginalFilename();
						//获取扩展名称
						String ext=fullName.substring(fullName.lastIndexOf('.'));
						//拼接文件保存的名称
						String FileName=System.nanoTime()+ext;
						//保存文件
						FileUtils.writeByteArrayToFile(new File(upDir, FileName), myFile.getBytes());
						coursetable.setVideo(upDir+FileName);
					}
					String str = sdf.format(new Date().getTime());//将当前时间格式转成字符串
				//	Timestamp creationTime= new Timestamp(sdf.parse(str).getTime());
					coursetable.setExaminebit(0);
					coursetable.setCreationTime(str);
					coursetable.setBrowsenumber(0);
					int intR=iUsertableService.insertCourse(coursetable);
					if (intR > 0) {
						state = "ok";
						msg = "新增成功";
					} else {
						state = "no";
						msg = "新增失败";
					}
				}else{
					msg = "当前老师已存在课件包名称，请重新输入";
				}
			} catch (Exception e) {
				// TODO: handle exception
				msg = e.getMessage();
			}
			json.put("state", state);
			json.put("msg", msg);
			return json.toString();
		}
		/**
		 * 修改课件包
		 * @param myFile
		 * @param coursetable
		 * @return
		 */
		@ResponseBody
		@RequestMapping(value = "/updateCourse", produces = { "application/json;charset=UTF-8" })
		public String updateCourse(@RequestParam(value="uploadFile",required=false) MultipartFile myFile,Coursetable coursetable){
			JSONObject json = new JSONObject();
			json.put("msg", "");
			json.put("state", "no");
			String msg = "";
			String state = "no";
			//第一种：myFile为null，视频不做任何操作
			//第二种：myFile不为null，上传新的视频
			try {
				String upDir="E:/GSEN_SSM_upload/";
				File uploadDir = new File(upDir);
				if (!uploadDir.exists()) {
					uploadDir.mkdir();//不存在就创建
				}
				int courseId=coursetable.getCourseId();
				Coursetable course=iUsertableService.selectCourseBYid(courseId);
				
				String coursename=coursetable.getCoursename();
				int teacher_id=coursetable.getTeacher_id();
				List<Coursetable> courseList=iUsertableService.selectCourseNameOnly(coursename,teacher_id , courseId);
				int total=courseList.size();
				if(total==0){
					String FileName="";
					if(myFile==null){//第一种
						coursetable.setVideo(course.getVideo());
					}else if(myFile!=null) {//第二种
						//获取文件原名
						String fullName=myFile.getOriginalFilename();
						//获取扩展名称
						String ext=fullName.substring(fullName.lastIndexOf('.'));
						//拼接文件保存的名称
						 FileName=System.nanoTime()+ext;
						coursetable.setVideo(upDir+FileName);
					}
					coursetable.setExaminebit(course.getExaminebit());
					coursetable.setCreationTime(course.getCreationTime());
					coursetable.setBrowsenumber(course.getBrowsenumber());
					int intR=iUsertableService.updateCourse(coursetable);
					if (intR > 0) {
						if(myFile!=null){
							File oldFile = new File(course.getVideo());
							if (oldFile.exists() && oldFile.isFile()) {
								oldFile.delete();//删除文件夹的视频
							}
							if(myFile!=null){
								//保存文件
								FileUtils.writeByteArrayToFile(new File(upDir, FileName), myFile.getBytes());
							}
						}
						state = "ok";
						msg = "修改成功";
					} else {
						state = "no";
						msg = "修改失败";
					}
				}else{
					msg = "输入的课件包已存在";
				}
			} catch (Exception e) {
				// TODO: handle exception
				msg = e.getMessage();
			}
			json.put("state", state);
			json.put("msg", msg);
			return json.toString();
		}
        /**
         * 删除课件包
         * @param courseId
         * @return
         */
		@RequestMapping(value = "/delectCourse", produces = { "application/json;charset=UTF-8" })
		@ResponseBody
        public String delectCourse(int courseId){
			JSONObject json = new JSONObject();
			String msg = "";
			json.put("state", "no");
			json.put("msg", "");
			String state = "no";
			// 开启事务
			DefaultTransactionDefinition def = new DefaultTransactionDefinition();
			def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
			TransactionStatus status = transactionManager.getTransaction(def); // get
			try {
				Coursetable course=iUsertableService.selectCourseBYid(courseId);
				String path=course.getVideo();
				 int delete=iUsertableService.deleteCourse(courseId);
				 if (delete > 0) {
					    File oldFile = new File(path);
						if (oldFile.exists() && oldFile.isFile()) {
							oldFile.delete();//删除文件夹(上传视频时的路径)里的视频。
						}
						List<Courseevatable> courseevaList=iUsertableService.selectCourseevaBYcourseId(courseId);
						if (courseevaList.size()>0) {
							iUsertableService.deleteCourseevaBYcourseId(courseId);
						}
						state = "ok";
						msg = "删除成功";
					} else {
						state = "no";
						msg = "删除失败";
					}
				// 提交事务
				if (state.equals("ok")) {
					transactionManager.commit(status);// 提交
				} else {
					transactionManager.rollback(status);// 回滚
				}
			} catch (Exception e) {
				// TODO: handle exception
				transactionManager.rollback(status);// 回滚
			}
			json.put("state", state);
			json.put("msg", msg);
			return json.toString();
        }

		/**
		 * 审核否课件包
		 * @param coursetable
		 * @return
		 * @throws IOException
		 */
		@RequestMapping(value = "/exCourse", produces = { "application/json;charset=UTF-8" })
		@ResponseBody
		public String exCourse(Coursetable coursetable)throws IOException{
	 		JSONObject json = new JSONObject();
			String msg = "";
			String state = "no";
			json.put("state", "no");
			json.put("msg", "");
			int typeBitInt;
			try {
				int id= coursetable.getCourseId();
				Coursetable course=iUsertableService.selectCourseBYid(id);
				int bitInt=course.getExaminebit();
				if(bitInt==0){
					typeBitInt=1;
				}else{
					typeBitInt=0;
				}
				coursetable.setBrowsenumber(course.getBrowsenumber());
				coursetable.setCreationTime(course.getCreationTime());
				coursetable.setExaminebit(typeBitInt);
				coursetable.setPapeId(course.getPapeId());
				coursetable.setTeacher_id(course.getTeacher_id());
				coursetable.setTeachversionId(course.getTeachversionId());
				coursetable.setGradeId(course.getGradeId());
				coursetable.setCoursename(course.getCoursename());
				coursetable.setCourseprice(course.getCourseprice());
				coursetable.setKnowledge(course.getKnowledge());
				coursetable.setVideo(course.getVideo());
				int intR=iUsertableService.updateCourse(coursetable);
				if (intR > 0) {
					state = "ok";
					msg = "修改成功";
				} else {
					state = "no";
					msg = "修改失败";
				}
			} catch (Exception e) {
				// TODO: handle exception
				msg = e.getMessage();
			}
			json.put("state", state);
			json.put("msg", msg);
			return json.toString();
		}
		/**
		 * 根据老师id查询老师积分信息    
		 * @throws Exception
		 */
		@RequestMapping(value = "/selectTeaIntegral", produces = { "application/json;charset=UTF-8" })
		@ResponseBody
		public String selectTeaIntegral(String teachername, String integraldirection,
				String startTime,String endTime,int teacherid) throws Exception {
			JSONObject json = new JSONObject();
			String msg = "";
			json.put("state", "no");
			json.put("msg", "");
			json.put("data", "");
			try {
				// 获取老师积分信息
				List<Integraltable> integral=iUsertableService.selectIntegral(teachername, integraldirection, startTime, endTime,teacherid);
				json.put("state", "ok");
				json.put("data", integral);
			} catch (Exception e) {
				//throw e;
				msg = e.getMessage();
			}
			json.put("msg", msg);
			return json.toString();
		}
		/**
		 * 根据积分id修改积分有效否
		 * @param id
		 * @return
		 * @throws IOException
		 */
		@RequestMapping(value = "/updateIntegral", produces = { "application/json;charset=UTF-8" })
		@ResponseBody
		public String updateIntegral(int id)throws IOException{
	 		JSONObject json = new JSONObject();
			String msg = "";
			String state = "no";
			json.put("state", "no");
			json.put("msg", "");
			int typeBitInt;
			try {
				Integraltable integraltable=new Integraltable();
				Integraltable integral=iUsertableService.selectIntegralBYid(id);
				int bitInt=integral.getValiditybit();//1是有效 2是无效
				if(bitInt==1){
					typeBitInt=2;
				}else{
					typeBitInt=1;
				}
				integraltable.setIntegralId(id);
				integraltable.setTeacher_id(integral.getTeacher_id());
				integraltable.setStudentId(integral.getStudentId());
				integraltable.setIntegralflow(integral.getIntegralflow());
				integraltable.setIntegraldirection(integral.getIntegraldirection());
				integraltable.setIntegral(integral.getIntegral());
				integraltable.setOperationtime(integral.getOperationtime());
				integraltable.setValiditybit(typeBitInt);
				int intR=iUsertableService.updateIntegral(integraltable);
				if (intR > 0) {
					state = "ok";
					msg = "修改成功";
				} else {
					state = "no";
					msg = "修改失败";
				}
			} catch (Exception e) {
				// TODO: handle exception
				msg = e.getMessage();
			}
			json.put("state", state);
			json.put("msg", msg);
			return json.toString();
		}
		/**
		 * 查询学生信息
		 * @throws Exception
		 */
		@RequestMapping(value = "/selectStudentALL", produces = { "application/json;charset=UTF-8" })
		@ResponseBody
		public String selectStudentALL(String name, int enabledbit,
				String startTime,String endTime) throws Exception {
			JSONObject json = new JSONObject();
			String msg = "";
			json.put("state", "no");
			json.put("msg", "");
			json.put("data", "");
			try {
				// 获取学生信息
				List<Studenttable> studentALL=iUsertableService.selectStudentALL(name, enabledbit, startTime, endTime);
				json.put("state", "ok");
				json.put("data", studentALL);
			} catch (Exception e) {
				throw e;
			}
			json.put("msg", msg);
			return json.toString();
		}
		/**
		 * 学生启用否
		 * @param studentId
		 * @param studentTable
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value = "/exStudent", produces = { "application/json;charset=UTF-8" })
		@ResponseBody
		public String exStudent(int studentId, Studenttable studentTable) throws Exception{
			JSONObject json = new JSONObject();
			String msg = "";
			String state = "no";
			json.put("state", "no");
			json.put("msg", "");
			int typeBitInt;
			try {
				Studenttable student=iUsertableService.selectStudentBYid(studentId);
				int bitInt=student.getEnabledbit();
				if(bitInt==1){
					typeBitInt=2;
				}else{
					typeBitInt=1;
				}
				studentTable.setEnabledbit(typeBitInt);
				studentTable.setStudentId(studentId);
				studentTable.setNickname(student.getNickname());
				studentTable.setName(student.getName());
				studentTable.setPassword(student.getPassword());
				studentTable.setPhonenumber(student.getPhonenumber());
				studentTable.setSex(student.getSex());
				studentTable.setQq(student.getQq());
				studentTable.setWechat(student.getWechat());
				studentTable.setPicture(student.getPicture());
				studentTable.setCreationtime(student.getCreationtime());
				int intR=iUsertableService.updateStudentBYstudentId(studentTable);
				if (intR > 0) {
					state = "ok";
					msg = "修改成功";
				} else {
					state = "no";
					msg = "修改失败";
				}
			} catch (Exception e) {
				// TODO: handle exception
				msg = e.getMessage();
			}
			json.put("state", state);
			json.put("msg", msg);
			return json.toString();
		}
		/**
		 * 根据学生id查询学生积分信息    
		 * @throws Exception
		 */
		@RequestMapping(value = "/selectStuIntegral", produces = { "application/json;charset=UTF-8" })
		@ResponseBody
		public String selectStuIntegral(String name, String integraldirection,
				String startTime,String endTime,int studentId) throws Exception {
			JSONObject json = new JSONObject();
			String msg = "";
			json.put("state", "no");
			json.put("msg", "");
			json.put("data", "");
			try {
				// 获取老师积分信息
				List<Integraltable> integral=iUsertableService.selectIntegralBYstudentId(name, integraldirection, startTime, endTime, studentId);
				json.put("state", "ok");
				json.put("data", integral);
			} catch (Exception e) {
				msg = e.getMessage();
			}
			json.put("msg", msg);
			return json.toString();
		}
		/**
		 * -查询课件评价信息 
		 * @throws Exception
		 */
		@RequestMapping(value = "/selectCourseevaALL", produces = { "application/json;charset=UTF-8" })
		@ResponseBody
		public String selectCourseevaALL( String coursename,String name,int enabledbit) 
				throws Exception {
			JSONObject json = new JSONObject();
			String msg = "";
			json.put("state", "no");
			json.put("msg", "");
			json.put("data", "");
			try {
				// 获取课件评价信息
				List<CourseVo> course=iUsertableService.selectCourseevaALL(coursename, name, enabledbit);
				json.put("state", "ok");
				json.put("data", course);
			} catch (Exception e) {
				msg = e.getMessage();
			}
			json.put("msg", msg);
			return json.toString();
		}
		/**
		 * 修改课件评价启用否
		 * @param id
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value = "/updateEvaluation", produces = { "application/json;charset=UTF-8" })
		@ResponseBody
		public String updateEvaluation(int id) throws Exception{
			JSONObject json = new JSONObject();
			String msg = "";
			String state = "no";
			json.put("state", "no");
			json.put("msg", "");
			int typeBitInt;
			try {
				Courseevatable courseevaList=iUsertableService.selectCourseevaBYid(id);
				Courseevatable courseevatable=new Courseevatable();
				int bitInt=courseevaList.getEnabledbit();
				if(bitInt==1){//1是启用 2是禁用
					typeBitInt=2;
				}else{
					typeBitInt=1;
				}
				courseevatable.setCourseevaId(id);
				courseevatable.setCourseId(courseevaList.getCourseId());
				courseevatable.setStudentId(courseevaList.getStudentId());
				courseevatable.setSatisfaction(courseevaList.getSatisfaction());
				courseevatable.setEvaluationcontent(courseevaList.getEvaluationcontent());
				courseevatable.setEnabledbit(typeBitInt);
				courseevatable.setEvaluationTime(courseevaList.getEvaluationTime());
				int intR=iUsertableService.exCourseevaBYid(courseevatable);
				if (intR > 0) {
					state = "ok";
					msg = "修改成功";
				} else {
					state = "no";
					msg = "修改失败";
				}
			} catch (Exception e) {
				// TODO: handle exception
				msg = e.getMessage();
			}
			json.put("state", state);
			json.put("msg", msg);
			return json.toString();
		}
		/**
		 * 查询日志信息 
		 * @throws Exception
		 */
		@RequestMapping(value = "/selectLog", produces = { "application/json;charset=UTF-8" })
		@ResponseBody
		public String selectLog(HttpServletRequest request,String name,int userType_id) 
				throws Exception {
			JSONObject json = new JSONObject();
			String msg = "";
			json.put("state", "no");
			json.put("msg", "");
			json.put("data", "");
			try {
				// 获取日志信息
				List<Logtable> log=iUsertableService.selectLog(name, userType_id);
				json.put("state", "ok");
				json.put("data", log);
			} catch (Exception e) {
				msg = e.getMessage();
			}
			json.put("msg", msg);
			return json.toString();
		}
		/**
		 * 新增日志
		 * @param request
		 * @param operType
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value = "/insertLog", produces = { "application/json;charset=UTF-8" })
		@ResponseBody
		public void insertLog(HttpServletRequest request, HttpServletResponse response,String operType) throws ServletException, IOException {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {
				// 获取session的验证码
				HttpSession session = request.getSession();
				if(session.getAttribute("userId")!=null){
					String userId = session.getAttribute("userId").toString();
					int userID=Integer.parseInt(userId);
					Logtable logtable=new Logtable();
					logtable.setUserId(userID);
					logtable.setOpertype(operType);
					String str = sdf.format(new Date().getTime());//将当前时间格式转成字符串
					Timestamp creationTime= new Timestamp(sdf.parse(str).getTime());
					logtable.setOpertime(creationTime);
					String ip=getIpAddr(request);
					
//					String ip = request.getHeader("x-forwarded-for");
//					if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//						ip = request.getHeader("Proxy-Client-IP");
//					}
//					if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//						ip = request.getHeader("WL-Proxy-Client-IP");
//					}
//					if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//						ip = request.getRemoteAddr();
//					}
					logtable.setIP(ip);
					iUsertableService.insertLog(logtable);
				}else{
					//response.sendRedirect("/WEB-INF/jsp/LoginManagement/Login.jsp");
					 //request.getRequestDispatcher("/WEB-INF/jsp/LoginManagement/Login.jsp").forward(request, response);
					//ModelAndView mv = new ModelAndView("/LoginManagement/Login");
					//return mv;
					//response.sendRedirect("/GSEN_SSM/");  
					// return "redirect:/WEB-INF/jsp/LoginManagement/Login.jsp";
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		/** 
	     * 获取当前网络ip 
	     * @param request 
	     * @return 
	     */  
	    public String getIpAddr(HttpServletRequest request){  
	        String ipAddress = request.getHeader("x-forwarded-for");  
	            if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {  
	                ipAddress = request.getHeader("Proxy-Client-IP");  
	            }  
	            if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {  
	                ipAddress = request.getHeader("WL-Proxy-Client-IP");  
	            }  
	            if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {  
	                ipAddress = request.getRemoteAddr();  
	                if(ipAddress.equals("127.0.0.1") || ipAddress.equals("0:0:0:0:0:0:0:1")){  
	                    //根据网卡取本机配置的IP  
	                    InetAddress inet=null;  
	                    try {  
	                        inet = InetAddress.getLocalHost();  
	                    } catch (UnknownHostException e) {  
	                        e.printStackTrace();  
	                    }  
	                    ipAddress= inet.getHostAddress();  
	                }  
	            }  
	            //对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割  
	            if(ipAddress!=null && ipAddress.length()>15){ //"***.***.***.***".length() = 15  
	                if(ipAddress.indexOf(",")>0){  
	                    ipAddress = ipAddress.substring(0,ipAddress.indexOf(","));  
	                }  
	            }  
	            return ipAddress;   
	    }
}
