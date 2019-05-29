package com.lm.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.lm.po.Informationtable;
import com.lm.service.IInformationService;

/**
 *教育资讯
 */
@Controller
@RequestMapping(value = "/educational")
public class EducationalController {
	// 注入service层
	@Autowired
	private IInformationService iInformationService;
    
	/**
	 * 查询教育资讯
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectInformation", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String selectInformation(String headline, String subtitle,int enabledBit,
			String startTime,String endTime) throws Exception {
		JSONObject json = new JSONObject();
		String msg = "";
		json.put("state", "no");
		json.put("msg", "");
		json.put("data", "");
		try {
			// 获取教育资讯信息
			List<Informationtable> information=iInformationService.selectInformation(headline, subtitle, enabledBit,startTime,endTime);
			json.put("state", "ok");
			json.put("data", information);
		} catch (Exception e) {
			throw e;
		}
		json.put("msg", msg);
		return json.toString();
	}
	/**
	 * 上传单张图片和多张图片
	 * @param myFile
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/uploadPictures", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String uploadPictures(@RequestParam(value="files",required=false) MultipartFile myFile)throws IOException{
 		JSONObject json = new JSONObject();
		String msg = "";
		json.put("msg", "");
		try {
			String upDir="E:/GSEN_SSM_upload/";
			File uploadDir = new File(upDir);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();//不存在就创建
			}
			//获取文件原名
			String fullName=myFile.getOriginalFilename();
			//获取扩展名称
			String ext=fullName.substring(fullName.lastIndexOf('.'));
			//拼接文件保存的名称
			String FileName=System.nanoTime()+ext;
			//保存文件
			FileUtils.writeByteArrayToFile(new File(upDir, FileName), myFile.getBytes());
			msg=FileName;
		} catch (Exception e) {
			// TODO: handle exception
			e.getMessage();
		}
		json.put("msg", msg);
		return json.toString();
	}
	/**
	 *新增资讯信息
	 * @param headline
	 * @param subtitle
	 * @param req
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/saveInformation", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String saveInformation(String headline,String subtitle,HttpServletRequest req)throws IOException{
 		JSONObject json = new JSONObject();
		String msg = "";
		String state = "no";
		json.put("state", "no");
		json.put("msg", "");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Informationtable informationtable=new Informationtable();
		try {
			List<Informationtable> informationList=iInformationService.selectInformationOnly(headline);
			if(informationList.size()==0){
				   //拿到编辑器的内容
				String content = req.getParameter("h_Content");
				String upDir="E:/GSEN_SSM_upload/";
				//获取所有图片
				String[] arrayPicture = req.getParameterValues("arrayPicture");
				// 将字符串数组转换成字符串格式（将数组以符号或其他字符串为间隔组成新的字符串）
				String str1 = StringUtils.join(arrayPicture);
				// 通过正则表达式将字符串切割成新的字符串数组
				String[] str2 = str1.split(",");
				String picturePath="";
				for (int i = 0; i < str2.length; i++) {
					 picturePath+=upDir+str2[i]+";";
				}
				informationtable.setInforpicture(picturePath);
				String str = sdf.format(new Date().getTime());//将当前时间格式转成字符串
				Timestamp creationTime= new Timestamp(sdf.parse(str).getTime());
				informationtable.setUploadtime(creationTime);
				informationtable.setEnabledBit(0);
				informationtable.setHeadline(headline);
				informationtable.setSubtitle(subtitle);
				informationtable.setContent(content);
				int intR = iInformationService.insertInformation(informationtable);
				if (intR > 0) {
					state = "ok";
					msg = "新增成功";
				} else {
					state = "no";
					msg = "新增失败";
				}
			}else{
				state = "no";
				msg = "输入的大标题已存在";
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
     * 
     * 删除资讯信息	
     * @param informationID
     * @return
     * @throws Exception
     */
	@RequestMapping(value = "/delectInformation", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String delectInformation(int informationId) throws Exception {
		JSONObject json = new JSONObject();
		String msg = "";
		json.put("state", "no");
		json.put("msg", "");
		String state = "no";
		try {
			Informationtable information=iInformationService.selectInformationById(informationId);
			String picturePath=information.getInforpicture();
			String[] path=picturePath.split(";");
			int delete=iInformationService.deleteInformation(informationId);
			 if (delete > 0) {
				    for (int i = 0; i < path.length; i++) {
				    	 File oldFile = new File(path[i]);
							if (oldFile.exists() && oldFile.isFile()) {
								oldFile.delete();//删除文件夹(上传图片时的路径)里的图片。
							}
					}
					state = "ok";
					msg = "删除成功";
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
	 * 根据页面传过来的图片名称或图片路径在文件夹中查询图片(多张图片)
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/getImgs", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	private void getImgs(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String strFileName = req.getParameter("file");//获取图片名称或路径
		String[] path=strFileName.split(";");
		File file = new File(path[0]);//只显示一张图片
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
	 * to修改资讯信息页面
	 * @param informationId
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings("unused")
	@ResponseBody
	@RequestMapping(value="/updateView")
	private void updateView(int informationId, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Informationtable information=iInformationService.selectInformationById(informationId);
		if(information!=null){
			request.setAttribute("information", information);
			request.getRequestDispatcher("/WEB-INF/jsp/Educational/Educational_up.jsp").forward(request, response);
		}
	}
	/**
	 * 修改教育资讯启用否
	 * @param informationId
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/prohibit", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String prohibit(int informationId)throws IOException{
 		JSONObject json = new JSONObject();
		String msg = "";
		String state = "no";
		json.put("state", "no");
		json.put("msg", "");
		int typeBitInt;
		Informationtable informationtable=new Informationtable();
		try {
			Informationtable information=iInformationService.selectInformationById(informationId);
			int bitInt=information.getEnabledBit();
			if(bitInt==0){
				typeBitInt=1;
			}else{
				typeBitInt=0;
			}
			informationtable.setInformationId(informationId);
			informationtable.setHeadline(information.getHeadline());
			informationtable.setSubtitle(information.getSubtitle());
			informationtable.setInforpicture(information.getInforpicture());
			informationtable.setContent(information.getContent());
			informationtable.setEnabledBit(typeBitInt);
			informationtable.setUploadtime(information.getUploadtime());
			int intR=iInformationService.updateInformation(informationtable);
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
	 * 修改保存教育资讯
	 * @param informationId
	 * @param headline
	 * @param subtitle
	 * @param req
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/updateSaveInformation", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String updateSaveInformation(int informationId,String headline,String subtitle,HttpServletRequest req)throws IOException{
 		JSONObject json = new JSONObject();
		String msg = "";
		String state = "no";
		json.put("state", "no");
		json.put("msg", "");
		Informationtable informationtable=new Informationtable();
		try {
			List<Informationtable> informationList=iInformationService.selectInformationOnlyedit(headline, informationId);
		    if (informationList.size()==0) {
		    	//拿到编辑器的内容
				String content = req.getParameter("Uh_Content");
				Informationtable information=iInformationService.selectInformationById(informationId);
				informationtable.setInformationId(informationId);
				informationtable.setHeadline(headline);
				informationtable.setSubtitle(subtitle);
				informationtable.setInforpicture(information.getInforpicture());
				informationtable.setContent(content);
				informationtable.setEnabledBit(information.getEnabledBit());
				informationtable.setUploadtime(information.getUploadtime());
				int intR=iInformationService.updateInformation(informationtable);
				if (intR > 0) {
					state = "ok";
					msg = "修改成功";
				} else {
					state = "no";
					msg = "修改失败";
				}
			} else {
				state = "no";
				msg = "输入的大标题已存在";
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
