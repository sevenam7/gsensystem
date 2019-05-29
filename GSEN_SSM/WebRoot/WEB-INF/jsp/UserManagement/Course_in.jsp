<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新增课件包</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <link rel="stylesheet" href="${ctx}/common/layuis/css/layui.css"type="text/css"></link>
    <script type="text/javascript" src="${ctx}/common/layuis/layui.js"></script>
    <script type="text/javascript" src="${ctx}/common/js/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="${ctx}/common/js/jquery.form.js"></script>

    <style>
        .c-red{
            color:red;
        }
    </style>
  </head>
  
  <body>
      <input type="hidden" id="path" value="${ctx}">
      <form class="layui-form" id="formInsert" action="${ctx}/user/insertCourse.do" method="post" enctype="multipart/form-data">
	     <div style="width: 100%;max-width: 100%;overflow: auto;position: absolute;top: 10px;bottom: 0px;left: 0px;right: 0px;" >
			  <fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">   
                  <legend>新增课件包</legend> 
              </fieldset>
			<div class="layui-form" style="padding: 2px 120px;margin-top: -10px;" >
				<div class="layui-row">
					<div class="layui-form-item">
						<label class="layui-form-label"><span class="c-red">*</span>课件包名称</label>
						<div class="layui-input-block">
						<input type="text" name="teacher_id" style="display:none;"value="${teacherList.teacherId}">
							<input type="text" name="coursename" id="coursename" lay-verify="title"
									autocomplete="off" placeholder="请输入课件包名称" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
							<label class="layui-form-label"><span class="c-red">*</span>知识点</label>
							<div class="layui-input-block">
								<input type="text" name="knowledge" id="knowledge" lay-verify="title"
									autocomplete="off" placeholder="请输入知识点" class="layui-input">
							</div>
					</div>
					<div class="layui-form-item">
						 <div class="layui-inline " >
								<label class="layui-form-label"><span class="c-red">*</span>教学版本</label>
								<div class="layui-input-block"style="width:320px;" >
									<select name="teachversionId" id="teachversionId">
									     <option value="">---请选择---</option>
									     <c:forEach items="${teachversionList}" var="teachversionList">
											<option value="${teachversionList.teachversionId}">${teachversionList.teachversion}</option>
										 </c:forEach>
									</select>
								</div>
						</div>
							<div class="layui-inline"style="float: right;margin-right:0px;">
								<label class="layui-form-label"><span class="c-red">*</span>年级</label>
								<div class="layui-input-block" style="width:320px;">
									<select name="gradeId" id="gradeId">
									     <option value="">---请选择---</option>
									     <c:forEach items="${gradeList}" var="gradeList">
											<option value="${gradeList.gradeId}">${gradeList.gradename}</option>
										 </c:forEach>
									</select>
								</div>
							</div>
					</div>
					<div class="layui-form-item">
							<label class="layui-form-label"><span class="c-red">*</span>课件价格</label>
							<div class="layui-input-block">
								<input type="text" name="courseprice" id="courseprice" lay-verify="title"
									autocomplete="off" placeholder="请输入课件价格" class="layui-input" onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''">
							</div>
					</div>
					<div class="layui-form-item">
							<label class="layui-form-label"><span class="c-red">*</span>视频附件</label>
							<div class="layui-input-block">
							   <input type="file"id="uploadFile" name="uploadFile" style="display:none;">
								<img alt="" src="${ctx}/img/tree.png" >
								<a style="cursor:pointer;color: #0083e4;line-height: 35px;" id="upload">上传视频</a>&nbsp;&nbsp;
							    <a id="showApellation" style="font-size:12px;color: #0083e4;"></a>    
							</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label"><span class="c-red">*</span>试卷附件</label>
						<div class="layui-input-block"><!-- layui-input-inline -->
							<select name="papeId" lay-verify="required" lay-search="">
								<option value="" >直接选择或搜索选择</option>
								<c:forEach items="${paperList}" var="paperList">
									<option value="${paperList.papeId}">${paperList.papername}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="layui-row" style="margin-top:25px;">
					<div class="layui-col-md1 layui-col-md-offset4">
						 <button type="button" class="layui-btn" lay-filter="insertSave"lay-submit="" >确认保存</button>
					</div>
					<div class="layui-col-md1"style="margin-left: 40px;">
						<button type="button" class="layui-btn layui-btn-warm" onClick="javascript :history.back(-1);">关闭</button>
					</div>
				</div>
			</div>
		</div>
	   </form>
	   
    	<script>
    	 var ctx = $("#path").val();
    	 layui.use([ 'form', 'upload' ], function(){
    	     form = layui.form;
             upload = layui.upload;
          
              // 监听提交
		    form.on('submit(insertSave)', function(data) {
				insertSave(data);//新增保存
				return false;
			});
             
             $("#upload").click(function(){
                    $("#uploadFile").click();
             });
    	 });//layui.use
    	 //选择视频
	     var imgReaderI = new FileReader();
	     var regexImageFilter = /\w+(.flv|.rvmb|.mp4|.avi|.wmv)$/;
	     //var regexImageFilter = /^(?:image\/bmp|image\/png|image\/jpeg|image\/jpg)$/i;
	     var file = $("#uploadFile"), aim = $("#showApellation");
	     file.on('change', function(e){
		     //选取选择图片,e.currentTarget.files 是一个数组，如果支持多个文件，则需要遍历
		     var imgfFile = e.currentTarget.files[0];
		     //加载image标签中
		     if (imgfFile != undefined) {
			    if (!regexImageFilter.test(e.currentTarget.files[0].type)) {
				    layer.msg("选择的不是一个有效的视频文件",{icon:5,time:1000});
				    //$("#InImges").removeProp("File");
				    return false;
			    } else {
				   imgReaderI.readAsDataURL(imgfFile);
	    		   aim.text(e.currentTarget.files[0].name);
			    }
		     }
	     });
	     var one="1";
	    //新增保存
	     function insertSave(data){
	          if(data.field.coursename==null ||data.field.coursename==""){
	              layer.msg("请输入课件包名称");
	              return false;
	          }else if(data.field.knowledge==null ||data.field.knowledge==""){
	             layer.msg("请输入知识点");
	              return false;
	          }else if(data.field.teachversionId=="" ||data.field.teachversionId==0){
	              layer.msg("请选择教学版本");
	              return false;
	          }else if(data.field.gradeId=="" ||data.field.gradeId==0){
	              layer.msg("请选择年级");
	              return false;
	          }else if(data.field.courseprice=="" ||data.field.courseprice==null){
	              layer.msg("请输入课件价格");
	              return false;
	          }else if(data.field.uploadFile=="" ||data.field.uploadFile==null){
	              layer.msg("请上传视频附件");
	              return false;
	          }else if(data.field.papeId=="" ||data.field.papeId==0){
	              layer.msg("请选择试卷附件");
	              return false;
	          }else{
	               if(one=="1"){
	                   one="2";
	                    // 显示加载页面
			           var loadIndex = layer.load(0, {shade : 0.3}); // 0代表加载的风格，支持0-2
	                   $("#formInsert").ajaxSubmit(function(data){
	                       	layer.close(loadIndex);
	                       if(data.state == 'ok'){
	                            layer.msg(data.msg,{icon:1,time:1000});
	                            one="1";
	                          window.history.back(-1); 
	                          $.post("${ctx}/user/insertLog.do",{operType:"新增课件包信息"},function(){});
	                       }else{
	                           layer.msg(data.msg,{icon:2,time:1000});
	                            one="1";
	                       }
	                   });
	               }else{
	                     layer.msg("正在保存中...");
	               }
	          }
	     }
	
    	</script>
  </body>
</html>
