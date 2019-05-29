package com.lm.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.lm.po.Gradetable;
import com.lm.po.Papertable;
import com.lm.po.Papertypetable;
import com.lm.po.Subjecttable;
import com.lm.po.Titletable;
import com.lm.po.Titletypetable;
import com.lm.service.IUsertableService;
import com.lm.service.IYearTruthService;
import com.lm.util.DeleteDirectory;

/**
 * 历年真题
 */
@Controller
@RequestMapping(value = "/yearTtruth")
public class YearTtruthController {
	//注入service层
	//历年真题
	@Autowired
	private IYearTruthService iYearTruthService;
	//用户管理
	@Autowired
    private IUsertableService iUsertableService;
	
	/**
	 * 查询试卷信息
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectPaper", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String selectPaper(String papername, int papertypeId,
			int subjectId) throws Exception {
		JSONObject json = new JSONObject();
		String msg = "";
		json.put("state", "no");
		json.put("msg", "");
		json.put("data", "");
		try {
			// 获取试卷信息
			List<Papertable> paper=iYearTruthService.selectPaper(papername, papertypeId, subjectId);
			json.put("state", "ok");
			json.put("data", paper);
		} catch (Exception e) {
			//throw e;
			msg = e.getMessage();
		}
		json.put("msg", msg);
		return json.toString();
	}

	/**
	 * to新增试卷页面
	 */
	@RequestMapping("/insertYearView")
	public ModelAndView insertYearView() {
		ModelAndView mv = new ModelAndView("/YearTtruth/yearTtruth_in");
		List<Gradetable> gradeList=iUsertableService.selectGrade();//年级表
		List<Subjecttable> subjectList=iUsertableService.selectSubject();//学科
		List<Papertypetable> papertypeList =iYearTruthService.selectPapertype();//试卷类型
		mv.addObject("subjectList", subjectList);
		mv.addObject("gradeList", gradeList);
		mv.addObject("papertypeList", papertypeList);
		return mv;
	}
	/**
	 * to修改试卷页面
	 */
	@RequestMapping("/updateYearView")
	public ModelAndView updateYearView(int paperId) {
		ModelAndView mv = new ModelAndView("/YearTtruth/yearTtruth_up");
		List<Gradetable> gradeList=iUsertableService.selectGrade();//年级表
		List<Subjecttable> subjectList=iUsertableService.selectSubject();//学科
		List<Papertypetable> papertypeList =iYearTruthService.selectPapertype();//试卷类型
		Papertable paperList=iYearTruthService.selectpaperBYpaperid(paperId);//试卷信息
		mv.addObject("subjectList", subjectList);
		mv.addObject("gradeList", gradeList);
		mv.addObject("papertypeList", papertypeList);
		mv.addObject("paperList", paperList);
		return mv;
	}
	/**
	 * 上传图片到临时文件夹
	 * @param IntPicture 图片
	 * @param pw 返回data
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value="/IntPatchPicture")
	@ResponseBody
	private void IntPatchPicture(@RequestParam(value="IntPicture", required=true) MultipartFile IntPicture, PrintWriter pw, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String strReturn = "error", ext = "";
		long time = 0;
		if (IntPicture != null) {
			String fullName = IntPicture.getOriginalFilename();
			ext = fullName.substring(fullName.lastIndexOf("."));//获取扩展名称
			time = System.nanoTime();
			strReturn = time + ext;//设置文件保存的名称
			
			//上传图片
			//String path = System.getProperty("java.io.tmpdir");//文件上传路径 - F:\java\apache-tomcat-7.0.52\temp
			//String p = request.getSession().getServletContext().getRealPath("/");
			//如果目录不存在就创建
			String uploadPath="C:\\gsen_ssm_picture_temp";
			//DeleteDirectory.DeleteDir(uploadPath);
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			try {
				FileUtils.writeByteArrayToFile(new File("C:\\gsen_ssm_picture_temp", strReturn), IntPicture.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		pw.write(strReturn);
	}
	/**
	 * 显示临时文件夹中的图片
	 * @param request 客户端的请求
	 * @param response 服务器的响应
	 * @throws IOException IO流异常
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value="/reveal_photo")
	private void reveal_HeadPortrait(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String strFileName=request.getParameter("file");
		if (!strFileName.equals("")) {
			//构建上传目录的路径
			//String uploadPath=System.getProperty("java.io.tmpdir");
			String uploadPath="C:\\gsen_ssm_picture_temp";
			//如果目录不存在就创建
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			File file=new File(uploadPath+File.separator+strFileName);
			if (file.exists() && file.isFile()) {
				FileInputStream in=new FileInputStream(file);
				ServletOutputStream out=response.getOutputStream();
				
				byte[] buf=new byte[1024];
				int count=0;
				while(-1!=(count=in.read(buf, 0, buf.length))){
					out.write(buf, 0, count);
				}
				response.setContentType("image/png"); // 设置返回的文件类型
				out.flush();
				out.close();
				in.close();
			}
		}
	}
	/**
	 * 修改时显示文件夹中的图片
	 * @param request 客户端的请求
	 * @param response 服务器的响应
	 * @throws IOException IO流异常
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value="/reveal_photo_up")
	private void reveal_photo_up(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String strFileName=request.getParameter("file");
		if (!strFileName.equals("")) {
			//构建上传目录的路径
			//String uploadPath=System.getProperty("java.io.tmpdir");
			String uploadPath="E:\\GSEN_SSM_upload";
			//如果目录不存在就创建
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			File file=new File(uploadPath+File.separator+strFileName);
			if (file.exists() && file.isFile()) {
				FileInputStream in=new FileInputStream(file);
				ServletOutputStream out=response.getOutputStream();
				
				byte[] buf=new byte[1024];
				int count=0;
				while(-1!=(count=in.read(buf, 0, buf.length))){
					out.write(buf, 0, count);
				}
				response.setContentType("image/png"); // 设置返回的文件类型
				out.flush();
				out.close();
				in.close();
			}
		}
	}
	/**
	 * 新增历年真题
	 * @param papername
	 * @param papertypeId
	 * @param gradeId
	 * @param subjectId
	 * @param paperscore
	 * @param testtime
	 * @param notes
	 * @param IntarrTitle
	 * @param IntarrTopic
	 * @param IntPicture
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/insertYearTruth", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String insertYearTruth(String papername,int papertypeId,int gradeId,int subjectId,
			BigDecimal paperscore,String testtime,String notes,
			@RequestParam(value = "IntarrTitle[]", required=false) String[] IntarrTitle, 
			@RequestParam(value = "IntarrTopic[]", required=false) String[] IntarrTopic, 
			@RequestParam(value = "IntPicture[]", required=false) String[] IntPicture,int saveType)throws IOException{
 		JSONObject json = new JSONObject();
		String msg = "";
		String state = "no";
		json.put("state", "no");
		json.put("msg", "");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str = sdf.format(new Date().getTime());//将当前时间格式转成字符串
	    Papertable papertable=new Papertable();
		try {
			 List<Papertable> paperList=iYearTruthService.selectPaperBYpaperName(papername);
		   if(paperList.size()==0){
			    papertable.setPapername(papername);
				papertable.setPapertypeId(papertypeId);
				papertable.setGradeId(gradeId);
				papertable.setSubjectId(subjectId);
				papertable.setPaperscore(paperscore);
				papertable.setTesttime(testtime);
				papertable.setNotes(notes);
				papertable.setCreationTime(str);
				papertable.setEnablebit(saveType);
				int intR=iYearTruthService.insertPaper(papertable);//新增试卷表
				if (intR > 0) {
					String uploadPath="E:\\GSEN_SSM_upload";
					File uploadDir = new File(uploadPath);
					if (!uploadDir.exists()) {
						uploadDir.mkdir();
					}
					//先循环保存题目类型，保存题目类型同时循环保存当前题目类型下的所有题目
					if (IntarrTitle != null) {
						Papertable paper=iYearTruthService.selectpapeId_MAX();
						int paperid=paper.getPapeId();//试卷id
						for (int i = 0; i < IntarrTitle.length; i++) {
							Titletypetable titletypetable=new Titletypetable();
							titletypetable.setPapeId(paperid);
							titletypetable.setTitletype(IntarrTitle[i]);
							titletypetable.setSerial(String.valueOf(i+1));
							titletypetable.setRemarks("题目类型备注");
							titletypetable.setCreationtime(str);
							titletypetable.setEnablebit(1);
							int titletype=iYearTruthService.insertTitletype(titletypetable);//新增题目类型表
							if (titletype>0) {
								if(IntarrTopic!=null){
									Titletypetable titletype1= iYearTruthService.selectTitletypeId_MAX();
									int titletypeId= titletype1.getTitletypeId();//题目类型id
									for (int j = 0; j < IntarrTopic.length; j++) {
										if(j<IntarrTopic.length-1){//防止超出数组界限
											if(IntarrTopic[j+1].equals(String.valueOf(i+"titleType"))){//当前题目类型下的所有题目
												Titletable titletable=new Titletable();
												titletable.setTitletypeId(titletypeId);
												Timestamp creationTime= new Timestamp(sdf.parse(str).getTime());
												titletable.setCreationtime(creationTime);
												titletable.setEnablebit(1);
												int type=Integer.valueOf(IntarrTopic[j + 2]);//传过来的题目类型   118单选题，119多选题，120问答题，121判断题
												String topic = IntarrTopic[j].toString();
												if (IntPicture != null) {
													String[] topicsplit = topic.split("\\/yearTtruth\\/reveal_photo.do\\?file=");
													topic = "";
													for (String string : topicsplit) {
														int index = string.indexOf('.');
														if (index > 0) {
															String topicSubstring = string.substring(0, index);//获取图片名称
															for (int l = 0; l < IntPicture.length; l++) {
																if (topicSubstring.equals(IntPicture[l])) {
																	String pictureName = topicSubstring + "." + IntPicture[l + 1];
																	File file = new File("C:\\gsen_ssm_picture_temp\\" + pictureName);
																	File fileTarget = new File("E:\\GSEN_SSM_upload\\");
																	if (!file.renameTo(new File(fileTarget + "/"+ pictureName))) {//上传临时文件夹中的图片//移动文件，判断是否成功
																		string = "/yearTtruth/reveal_photo.do?file=" + string.replace(pictureName, "");
																	} else {
																		string = "/yearTtruth/reveal_photo.do?file=" + string;
																	}
																}
															}
														}
														topic += string;
													}
												}
												titletable.setTitleA(topic);//题目、题目附图
												if (!IntarrTopic[j + 4].equals("")) {
													titletable.setTitlescore(Double.valueOf(IntarrTopic[j + 4]));//题目分数
												} else {
													titletable.setTitlescore(0.0);//题目分数
												}
												//根据页面传过来的题目类型修改选项、答案
												titletable.setOptionA(IntarrTopic[j + 5].toString());//选项   问答题就直接给空值了
												titletable.setAnswerA(IntarrTopic[j + 6].toString());//答案
												if(type==118|| type==119){//单选题或多选题
													String option = IntarrTopic[j + 5].toString();//选项
													if (IntPicture != null) {
														String[] optionsplit = option.split("\\/yearTtruth\\/reveal_photo.do\\?file=");
														option = "";
														for (String string : optionsplit) {
															int index = string.indexOf('.');
															if (index > 0) {
																String optionSubstring = string.substring(0, index);//获取图片名称
																for (int l = 0; l < IntPicture.length; l++) {
																	if (optionSubstring.equals(IntPicture[l])) {
																		String pictureName = optionSubstring + "." + IntPicture[l + 1];
																		File file = new File("C:\\gsen_ssm_picture_temp\\" + pictureName);
																		File fileTarget = new File("E:\\GSEN_SSM_upload\\");
																		if (!file.renameTo(new File(fileTarget + "/"+ pictureName))) {//上传临时文件夹中的图片//移动文件，判断是否成功
																			string = "/yearTtruth/reveal_photo.do?file=" + string.replace(pictureName, "");
																		} else {
																			string = "/yearTtruth/reveal_photo.do?file=" + string;
																		}
																	}
																}
															}
															option += string;
														}
													}
													titletable.setOptionA(option);//选项，有图片	
												}else{//问答题
													String answer = IntarrTopic[j + 6].toString();//答案
													if (IntPicture != null) {
														String[] answersplit = answer.split("\\/yearTtruth\\/reveal_photo.do\\?file=");
														answer = "";
														for (String string : answersplit) {
															int index = string.indexOf('.');
															if (index > 0) {
																String answerSubstring = string.substring(0, index);//获取图片名称
																for (int l = 0; l < IntPicture.length; l++) {
																	if (answerSubstring.equals(IntPicture[l])) {
																		String pictureName = answerSubstring + "." + IntPicture[l + 1];
																		File file = new File("C:\\gsen_ssm_picture_temp\\" + pictureName);
																		File fileTarget = new File("E:\\GSEN_SSM_upload\\");
																		if (!file.renameTo(new File(fileTarget + "/"+ pictureName))) {//上传临时文件夹中的图片//移动文件，判断是否成功
																			string = "/yearTtruth/reveal_photo.do?file=" + string.replace(pictureName, "");
																		} else {
																			string = "/yearTtruth/reveal_photo.do?file=" + string;
																		}
																	}
																}
															}
															answer += string;
														}
													}
													titletable.setAnswerA(answer);//答案，有图片
												}
												titletable.setSerial(Integer.valueOf(IntarrTopic[j + 3]));//序号
												titletable.setTitle_type(type);
												int title=iYearTruthService.insertTitle(titletable);
												if(title>0){
													state = "ok";
													msg = "新增成功";
												}else{
													state = "no";
													msg = "新增失败";
												}
											}
										}
										
									}//循环保存题目
								}
							} else{
								state = "no";
								msg = "新增失败";
							}
						}//循环保存题目类型
						DeleteDirectory.DeleteDir("C:\\gsen_ssm_picture_temp");//删除文件夹
					}
				} else {
					state = "no";
					msg = "新增失败";
				}
				
		   }else{
				state = "no";
				msg = "该试卷名已经存在";
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
	 * 删除题目
	 * @param papername
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delectPaper", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String delectPaper(String papername) throws Exception {
		JSONObject json = new JSONObject();
		String msg = "";
		json.put("state", "no");
		json.put("msg", "");
		String state = "no";
		try {
			List<Papertable> paper=iYearTruthService.selectPaperBYpaperName(papername);//根据试卷名称查询试卷
			int paperID=paper.get(0).getPapeId();//试卷id
			 List<Titletypetable> titleTypeList=iYearTruthService.selectTitleTyle_paperid(paperID);//根据试卷id查询题目类型
			 int titleTypeSize=titleTypeList.size();
			 int delete=iYearTruthService.deletePaper(paperID);//删除试卷表
			 if (delete > 0) {//一张试卷有多个题目类型，一个题目类型下面有多条题目
				   for (int i = 0; i < titleTypeSize; i++) {//循环题目类型
					  int titleTypeid=titleTypeList.get(i).getTitletypeId();//题目类型id
					  List<Titletable> TitleList=iYearTruthService.selectTitle_titleTypeid(titleTypeid);//根据题目类型id查询题目
					  int deleteTitleType= iYearTruthService.deleteTitleType(titleTypeid);//删除题目类型表
					  if(deleteTitleType>0){
						  for (int j = 0; j < TitleList.size(); j++) {//循环题目
							  int titleid=TitleList.get(j).getTitleId();//题目id
							  String titleName=TitleList.get(j).getTitleA();
							  String option=TitleList.get(j).getOptionA();
							  String answer=TitleList.get(j).getAnswerA();
							  int deleteTitle=iYearTruthService.deleteTitle(titleid);//删除题目表
							  if(deleteTitle>0){
								  boolean titleName_picture=titleName.contains("<img src=");
								  boolean option_picture=option.contains("<img src=");
								  boolean answer_picture=answer.contains("<img src=");
								  if(titleName_picture==true){
									String[] titleName_fg= titleName.split("<img src=");
									if(titleName_fg.length>0){
										for (int k = 0; k < titleName_fg.length; k++) {
											int index=titleName_fg[k].lastIndexOf("?file=");
											if(index!=-1){
												int length=titleName_fg[k].indexOf("\">");
												String titleName_pictureName=titleName_fg[k].substring(index+6,length);//获取图片名称
												DeleteDirectory.DeleteFile("E:/GSEN_SSM_upload/"+titleName_pictureName);//删除图片
											}
										}
									}
								  }
                                  if(option_picture==true){
                                	  String[] option_fg= option.split("<img src=");
                                	  if(option_fg.length>0){
  										for (int k = 0; k < option_fg.length; k++) {
  											int index=option_fg[k].lastIndexOf("?file=");
											if(index!=-1){
												int length=option_fg[k].indexOf("\">");
												String option_pictureName=option_fg[k].substring(index+6,length);//获取图片名称
												DeleteDirectory.DeleteFile("E:/GSEN_SSM_upload/"+option_pictureName);//删除图片
											}
  										}
  									  }
								  }
                                  if(answer_picture==true){
                                	  String[] answer_fg= answer.split("<img src=");
                                	  if(answer_fg.length>0){
  										for (int k = 0; k < answer_fg.length; k++) {
  											int index=answer_fg[k].lastIndexOf("?file=");
  											if(index!=-1){
  												int length=answer_fg[k].indexOf("\">");
  												String answer_pictureName=answer_fg[k].substring(index+6,length);//获取图片名称
  	  											DeleteDirectory.DeleteFile("E:/GSEN_SSM_upload/"+answer_pictureName);//删除图片
  											}
  										}
  									  }
								  }
                          		state = "ok";
            					msg = "删除成功";
							  }
						  }
					  } 
				   }
				} else {
					state = "no";
					msg = "删除失败";
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
	 * 查询绑定题目类型
	 */
	@RequestMapping(value = "/showTitleType", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String showTitleType(String id) throws Exception {
		JSONObject json = new JSONObject();
		String msg = "";
		json.put("state", "no");
		json.put("msg", "");
		json.put("data", "");
		try {
			int papersId = Integer.valueOf(id);
			List<Titletypetable> ddd= iYearTruthService.selectTitleTyle_paperid(papersId);//根据试卷id查询题目类型
			json.put("state", "ok");
			json.put("data", ddd);
		} catch (Exception e) {
			msg = e.getMessage();
		}
		json.put("msg", msg);
		return json.toString();
	}
	
	/**
	 * 查询绑定题目
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/showTitle", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String showTitle(String id) throws Exception {
		JSONObject json = new JSONObject();
		String msg = "";
		json.put("state", "no");
		json.put("msg", "");
		json.put("data", "");
		try {
			int titletypeId = Integer.valueOf(id);
			List<Titletable> ddd= iYearTruthService.selectTitle_titleTypeid(titletypeId);//根据題目類型id查询题目类型
			json.put("state", "ok");
			json.put("data", ddd);
		} catch (Exception e) {
			msg = e.getMessage();
		}
		json.put("msg", msg);
		return json.toString();
	}
	/**
	 * 修改试卷
	 * @param paperId
	 * @param papername
	 * @param papertypeId
	 * @param gradeId
	 * @param subjectId
	 * @param paperscore
	 * @param testtime
	 * @param notes
	 * @param IntarrTitle
	 * @param IntarrTopic
	 * @param IntPicture
	 * @param saveType
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/editYearTruth", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String editYearTruth(int paperId,String papername,int papertypeId,int gradeId,int subjectId,
			BigDecimal paperscore,String testtime,String notes,
			@RequestParam(value = "IntarrTitle[]", required=false) String[] IntarrTitle, 
			@RequestParam(value = "IntarrTopic[]", required=false) String[] IntarrTopic, 
			@RequestParam(value = "IntPicture[]", required=false) String[] IntPicture,int saveType)throws IOException{
 		JSONObject json = new JSONObject();
		String msg = "";
		String state = "no";
		json.put("state", "no");
		json.put("msg", "");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str = sdf.format(new Date().getTime());//将当前时间格式转成字符串
	    Papertable papertable=new Papertable();
		try {
			 List<Papertable> paperList=iYearTruthService.selectPaperNameOnly(papername, paperId);
			 List<Titletypetable> titleTypeList=iYearTruthService.selectTitleTyle_paperid(paperId);//根据试卷id查询题目类型
			 Papertable paper=iYearTruthService.selectpaperBYpaperid(paperId);
		   if(paperList.size()==0){
			    papertable.setPapeId(paperId);
			    papertable.setPapername(papername);
				papertable.setPapertypeId(papertypeId);
				papertable.setGradeId(gradeId);
				papertable.setSubjectId(subjectId);
				papertable.setPaperscore(paperscore);
				papertable.setTesttime(testtime);
				papertable.setNotes(notes);
				papertable.setCreationTime(paper.getCreationTime());
				papertable.setEnablebit(saveType);
				int intR=iYearTruthService.updatePaperBYpapeId(papertable);//修改试卷表
				if (intR > 0) {
					//先循环删除题目类型和题目，图片就移走，再循环新增题目类型和题目
					String uploadPath="C:\\gsen_ssm_picture_temp";
					String uploadPath1="E:\\GSEN_SSM_upload";
					File uploadDir = new File(uploadPath);
					File uploadDir1 = new File(uploadPath1);
					if (!uploadDir.exists()) {
						uploadDir.mkdir();
					}
					if (!uploadDir1.exists()) {
						uploadDir1.mkdir();
					}
					for (int i = 0; i < titleTypeList.size(); i++) {//循环删除题目类型
						 int titleTypeid=titleTypeList.get(i).getTitletypeId();//题目类型id
						  List<Titletable> TitleList=iYearTruthService.selectTitle_titleTypeid(titleTypeid);//根据题目类型id查询题目
						  int deleteTitleType= iYearTruthService.deleteTitleType(titleTypeid);//删除题目类型表
						  if(deleteTitleType>0){
							   for(int j = 0; j < TitleList.size(); j++){//循环删除题目
								      int titleid=TitleList.get(j).getTitleId();//题目id
									  String titleName=TitleList.get(j).getTitleA();
									  String option=TitleList.get(j).getOptionA();
									  String answer=TitleList.get(j).getAnswerA();
									  int deleteTitle=iYearTruthService.deleteTitle(titleid);//删除题目表
									  if(deleteTitle>0){
										  boolean titleName_picture=titleName.contains("<img src=");
										  boolean option_picture=option.contains("<img src=");
										  boolean answer_picture=answer.contains("<img src=");
										  if(titleName_picture==true){
											String[] titleName_fg= titleName.split("<img src=");
											if(titleName_fg.length>0){
												for (int k = 0; k < titleName_fg.length; k++) {
													int index=titleName_fg[k].lastIndexOf("?file=");
													if(index!=-1){
														int length=titleName_fg[k].indexOf("\">");
														String titleName_pictureName=titleName_fg[k].substring(index+6,length);//获取图片名称
														File file = new File("E:\\GSEN_SSM_upload\\" + titleName_pictureName);
														File fileTarget = new File("C:\\gsen_ssm_picture_temp\\");
														if(file.exists()){
															file.renameTo(new File(fileTarget + "/"+ titleName_pictureName));
														}
													}
												}
											}
										  }
		                                  if(option_picture==true){
		                                	  String[] option_fg= option.split("<img src=");
		                                	  if(option_fg.length>0){
		  										for (int k = 0; k < option_fg.length; k++) {
		  											int index=option_fg[k].lastIndexOf("?file=");
													if(index!=-1){
														int length=option_fg[k].indexOf("\">");
														String option_pictureName=option_fg[k].substring(index+6,length);//获取图片名称
														File file = new File("E:\\GSEN_SSM_upload\\" + option_pictureName);
														File fileTarget = new File("C:\\gsen_ssm_picture_temp\\");
														if(file.exists()){
															file.renameTo(new File(fileTarget + "/"+ option_pictureName));
														}
													}
		  										}
		  									  }
										  }
		                                  if(answer_picture==true){
		                                	  String[] answer_fg= answer.split("<img src=");
		                                	  if(answer_fg.length>0){
		  										for (int k = 0; k < answer_fg.length; k++) {
		  											int index=answer_fg[k].lastIndexOf("?file=");
		  											if(index!=-1){
		  												int length=answer_fg[k].indexOf("\">");
		  												String answer_pictureName=answer_fg[k].substring(index+6,length);//获取图片名称
		  												File file = new File("E:\\GSEN_SSM_upload\\" + answer_pictureName);
														File fileTarget = new File("C:\\gsen_ssm_picture_temp\\");
														if(file.exists()){
															file.renameTo(new File(fileTarget + "/"+ answer_pictureName));
														}
		  											}
		  										}
		  									  }
										  }
									  }
							   }
						  }
					}
					//先循环新增保存题目类型，保存题目类型同时循环新增保存当前题目类型下的所有题目  
					if (IntarrTitle != null) {
						for (int i = 0; i < IntarrTitle.length; i++) {
							Titletypetable titletypetable=new Titletypetable();
							titletypetable.setPapeId(paperId);
							titletypetable.setTitletype(IntarrTitle[i]);
							titletypetable.setSerial(String.valueOf(i+1));
							titletypetable.setRemarks("题目类型备注");
							titletypetable.setCreationtime(str);
							titletypetable.setEnablebit(1);
							int titletype=iYearTruthService.insertTitletype(titletypetable);//新增题目类型表
							if (titletype>0) {
								if(IntarrTopic!=null){
									Titletypetable titletype1= iYearTruthService.selectTitletypeId_MAX();
									int titletypeId= titletype1.getTitletypeId();//题目类型id
									for (int j = 0; j < IntarrTopic.length; j++) {
										if(j<IntarrTopic.length-1){//防止超出数组界限
											if(IntarrTopic[j+1].equals(String.valueOf(i+"titleType"))){//当前题目类型下的所有题目
												Titletable titletable=new Titletable();
												titletable.setTitletypeId(titletypeId);
												Timestamp creationTime= new Timestamp(sdf.parse(str).getTime());
												titletable.setCreationtime(creationTime);
												titletable.setEnablebit(1);
												int type=Integer.valueOf(IntarrTopic[j + 2]);//传过来的题目类型   118单选题，119多选题，120问答题，121判断题
												String topic = IntarrTopic[j].toString();
												if (IntPicture != null) {
													String[] topicsplit = topic.split("\\/yearTtruth\\/reveal_photo.do\\?file=");
													topic = "";
													for (String string : topicsplit) {
														int index = string.indexOf('.');
														if (index > 0) {
															String topicSubstring = string.substring(0, index);//获取图片名称
															for (int l = 0; l < IntPicture.length; l++) {
																if (topicSubstring.equals(IntPicture[l])) {
																	String pictureName = topicSubstring + "." + IntPicture[l + 1];
																	File file = new File("C:\\gsen_ssm_picture_temp\\" + pictureName);
																	File fileTarget = new File("E:\\GSEN_SSM_upload\\");
																	if (!file.renameTo(new File(fileTarget + "/"+ pictureName))) {//上传临时文件夹中的图片//移动文件，判断是否成功
																		string = "/yearTtruth/reveal_photo.do?file=" + string.replace(pictureName, "");
																	} else {
																		string = "/yearTtruth/reveal_photo.do?file=" + string;
																	}
																}
															}
														}
														topic += string;
													}
												}
												titletable.setTitleA(topic);//题目、题目附图
												if (!IntarrTopic[j + 4].equals("")) {
													titletable.setTitlescore(Double.valueOf(IntarrTopic[j + 4]));//题目分数
												} else {
													titletable.setTitlescore(0.0);//题目分数
												}
												//根据页面传过来的题目类型修改选项、答案
												titletable.setOptionA(IntarrTopic[j + 5].toString());//选项   问答题就直接给空值了
												titletable.setAnswerA(IntarrTopic[j + 6].toString());//答案
												if(type==118|| type==119){//单选题或多选题
													String option = IntarrTopic[j + 5].toString();//选项
													if (IntPicture != null) {
														String[] optionsplit = option.split("\\/yearTtruth\\/reveal_photo.do\\?file=");
														option = "";
														for (String string : optionsplit) {
															int index = string.indexOf('.');
															if (index > 0) {
																String optionSubstring = string.substring(0, index);//获取图片名称
																for (int l = 0; l < IntPicture.length; l++) {
																	if (optionSubstring.equals(IntPicture[l])) {
																		String pictureName = optionSubstring + "." + IntPicture[l + 1];
																		File file = new File("C:\\gsen_ssm_picture_temp\\" + pictureName);
																		File fileTarget = new File("E:\\GSEN_SSM_upload\\");
																		if (!file.renameTo(new File(fileTarget + "/"+ pictureName))) {//上传临时文件夹中的图片//移动文件，判断是否成功
																			string = "/yearTtruth/reveal_photo.do?file=" + string.replace(pictureName, "");
																		} else {
																			string = "/yearTtruth/reveal_photo.do?file=" + string;
																		}
																	}
																}
															}
															option += string;
														}
													}
													titletable.setOptionA(option);//选项，有图片	
												}else{//问答题
													String answer = IntarrTopic[j + 6].toString();//答案
													if (IntPicture != null) {
														String[] answersplit = answer.split("\\/yearTtruth\\/reveal_photo.do\\?file=");
														answer = "";
														for (String string : answersplit) {
															int index = string.indexOf('.');
															if (index > 0) {
																String answerSubstring = string.substring(0, index);//获取图片名称
																for (int l = 0; l < IntPicture.length; l++) {
																	if (answerSubstring.equals(IntPicture[l])) {
																		String pictureName = answerSubstring + "." + IntPicture[l + 1];
																		File file = new File("C:\\gsen_ssm_picture_temp\\" + pictureName);
																		File fileTarget = new File("E:\\GSEN_SSM_upload\\");
																		if (!file.renameTo(new File(fileTarget + "/"+ pictureName))) {//上传临时文件夹中的图片//移动文件，判断是否成功
																			string = "/yearTtruth/reveal_photo.do?file=" + string.replace(pictureName, "");
																		} else {
																			string = "/yearTtruth/reveal_photo.do?file=" + string;
																		}
																	}
																}
															}
															answer += string;
														}
													}
													titletable.setAnswerA(answer);//答案，有图片
												}
												titletable.setSerial(Integer.valueOf(IntarrTopic[j + 3]));//序号
												titletable.setTitle_type(type);
												int title=iYearTruthService.insertTitle(titletable);
												if(title>0){
													state = "ok";
													msg = "修改成功";
												}else{
													state = "no";
													msg = "修改失败";
												}
											}
										}
										
									}//循环保存题目
								}
							} else{
								state = "no";
								msg = "修改失败";
							}
						}//循环保存题目类型
						DeleteDirectory.DeleteDir("C:\\gsen_ssm_picture_temp");//删除文件夹
					}
				} else {
					state = "no";
					msg = "修改失败";
				}
				
		   }else{
				state = "no";
				msg = "该试卷名已经存在";
		   }
			
		} catch (Exception e) {
			// TODO: handle exception
			msg = e.getMessage();
		}
		json.put("state", state);
		json.put("msg", msg);
		return json.toString();
	}
	
}
