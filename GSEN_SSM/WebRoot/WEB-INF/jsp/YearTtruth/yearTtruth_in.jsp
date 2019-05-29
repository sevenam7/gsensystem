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
    
    <title>My JSP 'yearTtruth_in.jsp' starting page</title>
    
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
    <script type="text/javascript" src="${ctx}/common/js/verification.js"></script>
    <style>
    .c-red{
     color:red;
    }
    .papeContent{
        width: 80px;
    height: 29px;
    line-height: 2;
    text-align: center;
    font-size: 15px;
    margin-top: 7px;
    border: 1px solid #d2cfcf;
    background: #d2cfcf;
    color: white;
    }
    
    
    .div-margin {
	margin: 12px 0 !important;
}
.div-margin .div-span {
	display: none;
}
.div-margin:HOVER .div-span {
	display: block;
}
.fff-wrap {
	position: relative;
	border-radius: 4px;
    background-color: #ffffff;
    box-shadow: 0px 2px 8px 6px rgba(0, 0, 0, 0.1);
    padding: 10px 20px;
    width:95%
}
.fff-wrap input {
	border: none !important;
    font-size: 18px;
    font-weight: bold;
}
.fff-wrap .auto:HOVER {
	border: dashed 1px #AEAEAD !important;
}
.fff-wrap .auto:FOCUS {
	border: none !important;
	background-color: #F4F4F4;
}
.title-span {
	position: absolute;
    font-size: 18px;
    font-weight: bold;
    z-index: 1000;
    left: 32px;
    top: 20px;
}
.input-radius {
	border-radius: 4px;
}
.title-left {
	width: 78%;
	padding: inherit;
}
.input-span {
	padding-left: 40px;
}
.div-span {
	position: absolute;
    right: 18px;
    top: 10px;
}
.div-span span {
	font-size: 22px;
	color: #AAAAAA;
	padding: 0 6px;
}
.div-span span:HOVER {
	color: #2672FF;
	cursor: hand;
}
.left {
	float: left;
}
.show-span:HOVER ul.title-menu {
	display: block;
}
.title-menu {
	position: absolute;
    top: 0;
    left: -138px;
    z-index: 1000;
    display: none;
    float: left;
    min-width: 160px;
    padding: 5px 0;
    margin: 2px 0 0;
    cursor: pointer;
}
.select-padding {
	padding: 0px !important;
}
.checkbox-map-top {
	margin-top: 0px !important; 
}
.topic-span {
	position: absolute;
    font-size: 14px;
    font-weight: unset;
    z-index: 1000;
    left: 38;
    top: 20;
}
.title_content p {
	margin-bottom: 0px 	!important; 
}
/*单选题选项*/
.title_option {
	position: relative;
	padding-left: 28px;
	margin-top: 6px;
}
.title_option i {
	position: absolute;
    top: 7px;
    left: 42px;
}
.title_option .title_content {
	padding-left: 38px;
	min-height: 32px;
	line-height:32px;
}
.title_option .answer_content {
	padding-left: 56px;
	 line-height: 32px;
}
.title_option .score_content {
	padding-left: 84px;
	height: 32px;
}
.score-span {
	position: absolute;
    font-size: 14px;
    left: 42px;
    z-index: 1000;
    line-height: 32px;
}
.input-height {
	min-height: 20px;
}
.rights {
	float: right;
}
.score-input {
	font-size: 14px !important;
	font-weight: normal !important;
}
.div-span-top {
	margin-top: 32px;
}
.radio-margin {
	margin-top: -4px !important;
}
.label-right {
	padding-right: 10px;
}


    </style>
  </head>
  
  <body>
       <input type="hidden" id="path" value="${ctx}">
      <form class="layui-form" id="formInsert" action="${ctx}/yearTtruth/IntPatchPicture.do" method="post"  enctype="multipart/form-data">
	     <div style="width: 100%;max-width: 100%;overflow: auto;position: absolute;top: 10px;bottom: 0px;left: 0px;right: 0px;" >
			  <fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">   
                  <legend>新增试卷</legend> 
              </fieldset>
              <input type='file' class="file-hidden" id='IntPicture' name='IntPicture' multiple='' hidden>
			<div class="layui-form" style="padding: 2px 80px;margin-top: -10px;" >
				<div class="layui-row">
					<div class="layui-form-item">
						<div class="layui-inline ">
							<label class="layui-form-label"><span class="c-red">*</span>试卷名称</label>
							<div class="layui-input-block" style="width:340px;">
								<input type="text" name="papername" id="papername" lay-verify="title"
									autocomplete="off" placeholder="请输入试卷名称" class="layui-input">
							</div>
						</div>
						<div class="layui-inline" style="float: right;margin-right:0px;">
							<label class="layui-form-label"><span class="c-red">*</span>试卷类型</label>
							<div class="layui-input-block" style="width:340px;">
								<select name="papertypeId" id="papertypeId">
									<option value="">---请选择---</option>
									<c:forEach items="${papertypeList}" var="papertypeList">
										<option value="${papertypeList.papertypeId}">${papertypeList.papertype}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline ">
							<label class="layui-form-label"><span class="c-red">*</span>教学年级</label>
							<div class="layui-input-block" style="width:340px;">
								<select name="gradeId" id="gradeId">
									<option value="">---请选择---</option>
									<c:forEach items="${gradeList}" var="gradeList">
										<option value="${gradeList.gradeId}">${gradeList.gradename}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="layui-inline" style="float: right;margin-right:0px;">
							<label class="layui-form-label"><span class="c-red">*</span>学科</label>
							<div class="layui-input-block" style="width:340px;">
								<select name="subjectId" id="subjectId">
									<option value="">---请选择---</option>
									<c:forEach items="${subjectList}" var="subjectList">
										<option value="${subjectList.subjectId}">${subjectList.subject}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						 <div class="layui-inline " >
								<label class="layui-form-label"><span class="c-red">*</span>试卷总分</label>
								<div class="layui-input-block"style="width:340px;" >
									<input type="text" name="paperscore" id="paperscore" lay-verify="title"
									autocomplete="off" placeholder="请输入试卷总分" class="layui-input" onkeyup="this.value= this.value.match(/\d+(\.\d{0,1})?/) ? this.value.match(/\d+(\.\d{0,1})?/)[0] : ''">
								</div>
						</div>
							<div class="layui-inline"style="float: right;margin-right:0px;">
								<label class="layui-form-label"><span class="c-red">*</span>考试限时</label>
								<div class="layui-input-block" style="width:340px;">
									<input type="text" name="testtime" id="testtime" lay-verify="title"
									autocomplete="off" placeholder="请输入考试限时" class="layui-input" >
								</div>
							</div>
					</div>
					<div class="layui-form-item">
							<label class="layui-form-label"><span class="c-red">*</span>注意事项</label>
							<div class="layui-input-block">
								<input type="text" name="notes" id="notes" lay-verify="title"
									autocomplete="off" placeholder="请输入注意事项" class="layui-input" >
							</div>
					</div>
				</div>
				
				<div  class="layui-row">
				   <div class="layui-col-xs6">
				       <p class="papeContent">试卷内容</p>
				   </div>
				   <div class="layui-col-xs6">
				         <button type="button" class="layui-btn layui-btn-primary" onClick="javascript :history.back(-1);"style="float: right;margin-left:10px;">返回</button>
				         <button type="button" class="layui-btn" onclick="insertSave(1)" style="float: right;">保存后发布</button>
				         <button type="button" class="layui-btn" onclick="insertSave(0)" style="float: right;">保存为草稿</button>
				         <button type="button" class="layui-btn layui-btn-normal" id="addTitleType" style="float: right;">添加题目类型</button>
				   </div>
				</div>
				<hr class="layui-bg-gray" style="margin:4 0;">
				<div id="div_count"style="margin-top:16px;"></div>
			</div>
		</div>
	   </form>
	   
	   <script>
	     var father_spanEle, spanEle;//获取最后所在的父级id, 获取最后所在的id
	     var arrTitle = new Array,//所有题目类型
	         arrTopic = new Array,//所有题目
	         IntPicture=new  Array,//题目和选项的图片
	         IntarrTitle = new Array, //保存时所有题目类型的内容
	         IntarrTopic = new Array;//保存时所有题目的内容
	     var loading = ["A","B","C","D","E","F","G","H","I","J","k","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
	       layui.use('form',function(){
	            form = layui.form ,layer = layui.layer;
	              
	               // 监听提交
// 		        form.on('submit(insertSave)', function(data) {
// 				     insertSave(data);//保存后发布
// 				     return false;
// 			    });
	       });//layui.use
	       //获取最后所在的id
	       function getCursortPosition(e) {
	           father_spanEle = "";
	       	   spanEle = "";
		       var eleP = e.target.parentNode;//获取父级元素
		       if (e.target.offsetParent.attributes.length >= 2) {
		       	   father_spanEle = e.target.offsetParent.attributes[1].nodeValue;
		       }
		       if (eleP.attributes.length >= 2) {
			       spanEle = eleP.attributes[1].nodeValue;
		       }
		       if (father_spanEle == spanEle) {
			       spanEle = "";
		       }
		       if (e.target.attributes.length >= 2 && spanEle == "") {
		           spanEle = e.target.attributes[1].nodeValue;
		       }
           }
	       //选择照片
	       var imgReaderI = new FileReader();
	       var regexImageFilter = /^(?:image\/bmp|image\/png|image\/jpeg|image\/jpg)$/i;
	       //显示上传图片的名称
	       $("#IntPicture").on('change', function(e){
	          	//选取选择图片,e.currentTarget.files 是一个数组，如果支持多个文件，则需要遍历
		       var imgfFile = e.currentTarget.files[0];
	          	//加载image标签中
	          	if (imgfFile != undefined) {
	          		if (!regexImageFilter.test(e.currentTarget.files[0].type)) {
	          			layer.msg("选择的不是一个有效的图片文件",{icon:5,time:1000});
	          			return false;
	          		} else {
	       	   		imgReaderI.readAsDataURL(imgfFile);
	       		   }
	          	}
	       });
	        //添加图片
            function appPicture() {
    	        if (spanEle != "" && spanEle != undefined) {
    		        $("#IntPicture").click();
    		        //文件读取 onload事件
			        imgReaderI.onload = function(evt) {
				        $("#formInsert").ajaxSubmit(function(data) {
					        if (data != "error") {
						        var dataSplit = data.split(".");
						        for (var i = 0; i < dataSplit.length; i++) {
							        IntPicture.push(dataSplit[i]);
						        }
    					        $("#" + spanEle).append("<img src='${ctx}/yearTtruth/reveal_photo.do?file=" + data + "'>");//改为先上传图片到c盘，后显示
					           spanEle="";
					        } else {
						        layer.msg('上传图片失败',{icon:5,time:1000});
					        }
					        $("#IntPicture").val("");
				        });
			        };
    	        } else {
    		        layer.msg('请选择所要插入图片的位置',{icon:5,time:1000});
    	        }
            }
	       //删除
	       function deleteDiv(e) {
		       if (e.path[2].attributes.length >= 2) {
			       layer.confirm("是否删除该题目", function() {
				       var Id = e.path[2].id;
				       var bol = false;
				       var index;
				       for (var i = 0; i < arrTopic.length; i++) {
					       if (arrTopic[i][0] == Id && !bol) {
						       index = arrTopic[i][1];
						       arrTopic.splice(i, 1);
						       bol = true;
					       }
					       if (bol && i < arrTopic.length) {
						       if (index == arrTopic[i][1]) {
							       var r = document.getElementById(arrTopic[i][0]).childNodes[0].innerText.split("、");
							       document.getElementById(arrTopic[i][0]).childNodes[0].innerText = parseInt(r[0]) - 1 + "、";//改界面的序号
						       }
					       }
				       }
				       if (bol) {
					       var k = 0;
					       for (var p = 0; p < arrTopic.length; p++) {
						       if (index == arrTopic[p][1]) {//判断是不是当前题目类型下的题目
							       arrTopic[p][3] = k + 1;//改数组里的序号
							       k++;
						       }
					       }
				       }
				       e.path[2].remove();
				       layer.msg('',{time:1});
			       });
		       } else {
			       layer.confirm("是否删除该题目类型，相关的题目同样会删除", function() {
				       var Id = e.path[3].id;
				       var IntId = parseInt(Id.split("_")[2]);
				       var strId = Id.substring(0, Id.lastIndexOf("_")+1);
				       for (var i = 0; i < arrTitle.length; i++) {
					       if (arrTitle[i] == Id) {
						       arrTitle.splice(i, 1);
						       var bol = false;
						       for (var p = 0; p < arrTopic.length; p++) {
							       if (parseInt(arrTopic[p][1]) == i) {//删除当前题目类型下的所有题目
								       arrTopic.splice(p, 1);
								       p = p - 1;
								       bol = true;
							       } else if (arrTopic[p][1] > i) {
								       arrTopic[p][1] = parseInt(arrTopic[p][1]) - 1;
							       }
						       }
						       i = arrTitle.length;
					       }
				       }
				       for (var o = 0; o < arrTitle.length; o++) {//修改题目类型序号
					       document.getElementById(arrTitle[o]).childNodes[0].childNodes[0].innerText = (o + 1) + "、";
				       }
				       e.path[3].remove();
				       layer.msg('',{time:1});
			       });
		       }
	       }
	       //添加选项
	       function IntOption(e) {
		       if (e.path[2].attributes.length >= 2) {
			       var index = e.path[2].children[2].children.length;
			       if (index < loading.length) {
				       var titleIndex = e.path[2].children[2].children[index - 1].children[1].id.split("_")[2];
				       $("#" + e.path[2].children[2].id).append("<div class='title_option'><i class='icon_wj'>" + loading[index] + "、</i><div class='title_content auto title-left' id='dart_list_" + titleIndex + "_" + (index + 1) + "' contenteditable='true' onclick='getCursortPosition(event)'>选项</div></div>");
			       } else {
				       layer.msg('最多可添加26个选项', {icon:5,time:2000});
			       }
		       }
	       }
	       //删除选项
	       function DeleteOption(e) {
		       if (father_spanEle == "" && spanEle != "" && spanEle != undefined) {
			       layer.confirm("是否确定删除该选项", function() {
				       var option = document.getElementById("option_" + spanEle.split("_")[2]);
				       if (option.children.length > 0) {
				           if(option.children.length==1){
				              layer.msg('不能再删除选项了', {icon:5,time:2000});
				              return false;
				           }
					       var up = false;
					       for (var i = 0; i < option.children.length; i++) {
						       if (option.children[i].children[1].id == spanEle) {
							       option.children[i].remove();
							       up = true;
							       spanEle="";
						       }
						       if (up) {
							       if (i != option.children.length) {
								       option.children[i].children[0].innerText = loading[i] + "、";
							       }
						       }
					       }
				       }
				       layer.msg('',{time:1});
			       });
		       } else {
			       layer.msg('请选择所需要删除的选项', {icon:5,time:2000});
		       }
	       }
	       //上移
	       function MoveUpDiv(e) {
		       var Id = e.path[2].id;
		       var IntId = parseInt(Id.split("_")[2]);
		       var strId = Id.substring(0, (parseInt(Id.lastIndexOf("_")) + 1));
		
		       var superiorId = "", superiorHtml = "";
		       for (var u = 0; u < arrTopic.length; u++) {
			       if (arrTopic[u][0] == Id && u != 0) {
				       if (arrTopic[u][1] == arrTopic[u - 1][1]) {
					       superiorId = arrTopic[u - 1][0];
					       superiorHtml = $("#" + arrTopic[u - 1][0]).html();
					       u = arrTopic.length;
				       } else {
					       for (var y = 0; y < arrTopic.length; y++) {
						       if (arrTopic[u][1] == arrTopic[y][1]) {
							       if (parseInt(arrTopic[u][3]) == parseInt(arrTopic[y][3] + 1)) {
								       superiorId = arrTopic[y][0];
								       superiorHtml = $("#" + arrTopic[y][0]).html();
								       y = arrTopic.length;
								       u = arrTopic.length;
							       }
						       }
					       }
				       }
			       }
		       }
		       if (superiorHtml == "") {
			       layer.msg('已到达第一条题目',{icon:1,time:2000});
		       } else {
			       var superiorSpan = document.getElementById(superiorId).childNodes[0].innerText;
			       var rawHtml = $("#" + Id).html();
			       var rawSpan = document.getElementById(Id).childNodes[0].innerText;
			       $("#" + Id).html("");
			       $("#" + Id).html(superiorHtml);
			       $("#" + superiorId).html("");
			       $("#" + superiorId).html(rawHtml);
			       document.getElementById(Id).children[0].innerText = rawSpan;
			       document.getElementById(superiorId).children[0].innerText = superiorSpan;
			
			       superiorSpan = "", rawSpan = "";
			       for (var i = 0; i < arrTopic.length; i++) {
				       if (arrTopic[i][0] == Id) {
					       superiorSpan = arrTopic[i][2];
					       for (var o = 0; o < arrTopic.length; o++) {
						       if (arrTopic[o][0] == superiorId) {
							       rawSpan = arrTopic[o][2];
							       arrTopic[i][2] = rawSpan;
							       arrTopic[o][2] = superiorSpan;
							       o = arrTopic.length;
							       i = arrTopic.length;
						       }
					       }
				       }
			       }
		       }
	       }
	
	       //下移
	       function MoveDownDiv(e) {
		       var Id = e.path[2].id;
		       var IntId = parseInt(Id.split("_")[2]);
		       var strId = Id.substring(0, (parseInt(Id.lastIndexOf("_")) + 1));
		
		       var subordinateId = "", subordinateHtml = "";
		       for (var u = 0; u < arrTopic.length; u++) {
			       if (arrTopic[u][0] == Id && u != (arrTopic.length - 1)) {
				       if (arrTopic[u][1] == arrTopic[u + 1][1]) {
					       subordinateId = arrTopic[u + 1][0];
					       subordinateHtml = $("#" + arrTopic[u + 1][0]).html();
					       u = arrTopic.length;
				       } else {//添加所有题目类型下的题目都是接着按顺序的  比如单选题："father_dart_1" 多选题： "father_dart_2"
					       for (var y = 0; y < arrTopic.length; y++) {
						       if (arrTopic[u][1] == arrTopic[y][1]) {
							       if (parseInt(arrTopic[u][3] + 1) == parseInt(arrTopic[y][3])) {//序号相等就是要移动的题目了
								       subordinateId = arrTopic[y][0];
								       subordinateHtml = $("#" + arrTopic[y][0]).html();
								       y = arrTopic.length;
								       u = arrTopic.length;
							       }
						       }
					       }
				       }
			       }
		       }
		       if (subordinateHtml == "") {
			       layer.msg('已到达最后一条题目',{icon:1,time:2000});
		       } else {
			       var superiorSpan = document.getElementById(subordinateId).childNodes[0].innerText;
			       var rawHtml = $("#" + Id).html();
			       var rawSpan = document.getElementById(Id).childNodes[0].innerText;
			       $("#" + Id).html("");
			       $("#" + Id).html(subordinateHtml);
			       $("#" + subordinateId).html("");
			       $("#" + subordinateId).html(rawHtml);
			       document.getElementById(Id).children[0].innerText = rawSpan;
			       document.getElementById(subordinateId).children[0].innerText = superiorSpan;
			
			       superiorSpan = "", rawSpan = "";
			       for (var i = 0; i < arrTopic.length; i++) {
				       if (arrTopic[i][0] == Id) {
					       superiorSpan = arrTopic[i][2];
					       for (var o = 0; o < arrTopic.length; o++) {
						       if (arrTopic[o][0] == subordinateId) {
							       rawSpan = arrTopic[o][2];
							       arrTopic[i][2] = rawSpan;
							       arrTopic[o][2] = superiorSpan;
							       o = arrTopic.length;
							       i = arrTopic.length;
						       }
					       }
				       }
			       }
		       }
	       }
	        //添加题目类型
	        $("#addTitleType").click(function(){
	              var IntId = arrTitle.length;
		          if (arrTitle.length > 0) {
			          var Id = arrTitle[arrTitle.length - 1];
			          IntId = parseInt(Id.split("_")[2]);
		          }
		          var id = "div_headline_" + (IntId + 1);
		          $("#div_count").append("<div id='" + id + "'><div class='div-margin form-group fff-wrap'>" + 
							   "<span class='title-span'>" + (arrTitle.length + 1) + "、</span>" + 
							   "<input class='input-text input-qbc input-radius auto title-left input-span' id='input_dart_" + (IntId + 1) + "' type='text' title='题目类型' value='题目类型'>" + 
							   "<div class='div-span rights'><div class='left show-span'>" + 
							   "<span class='layui-icon layui-icon-app' title='添加题目'></span>" + 
							   "<ul class='title-menu select-padding checkbox-map-top'>" + 
							   "<li class='left line-height-zero' onclick='IntLiTopic(event, 0)'> <span class='layui-icon layui-icon-radio' title='添加单选题'></span> </li>" + 
							   "<li class='left line-height-zero' onclick='IntLiTopic(event, 1)'> <span class='layui-icon layui-icon-tabs' title='添加多选题'></span> </li>" + 
							   "<li class='left line-height-zero' onclick='IntLiTopic(event, 2)'> <span class='layui-icon layui-icon-survey' title='添加问答题'></span> </li>" + 
							   "<li class='left line-height-zero' onclick='IntLiTopic(event, 3)'> <span class='layui-icon layui-icon-ok-circle' title='添加判断题'></span> </li>" + 
							   "</ul></div><span class='layui-icon layui-icon-delete' title='删除题目类型' onclick='deleteDiv(event)'></span>" + 
							   "</div></div></div>");
	         	arrTitle.push(id);
	        });
	        //添加题目
	        function IntLiTopic(e, index){
	            var Id = e.path[6].id;
	        	var titleIndex = 0;//题目索引
		   	   	for (var i = 0; i < arrTitle.length; i++) {//arrTitle 题目类型
			   	   	if (arrTitle[i] == Id) {
			   	   		titleIndex = i;
				   	   	i = arrTitle.length;
		   	   		}
		   	   	}
		   	   	var textindex = "单选题";
		   	   	var topicType = 118;
		   	   	if (index == 1) {
		   	   		textindex = "多选题";
		   	   		topicType = 119;
		   	   	}
		   	   	var IntId = arrTopic.length;
		   	   	if (arrTopic.length > 0) {
			   	   	var idIndex = arrTopic[arrTopic.length - 1];//获取最后一条题目的信息
			   	   	IntId = parseInt(idIndex[0].split("_")[2]);//获取最后一条题目的序号
		   	   	}
		   	   	var id = "father_dart_" + (IntId + 1);
		   	   	//题目中的span序列
		   	   	var intNum = 0;
		   	   	for (var o = 0; o < arrTopic.length; o++) {
		   	   		if (parseInt(arrTopic[o][1]) == (parseInt(titleIndex))) {
		   	   			intNum++;
		   	   		}
		   	   	}
		   	   	var topicLength = arrTopic.length + 1;//当前所有题目的条数
		   	   	if (index == 0 || index == 1) {//单选题、多选题
			   	$("#" + Id).append("<div class='div-margin form-group fff-wrap' id='" + id + "'>" + 
				   				   "<span class='topic-span'>" + (intNum + 1) + "、</span>" + 
					   			   "<div class='title_content auto title-left input-span input-height' id='dart_" + topicLength + "' contenteditable='true' onclick='getCursortPosition(event);'>" + textindex + "</div>" + 
						   		   "<div id='option_" + topicLength + "'><div class='title_option'><i class='icon_wj'>A、</i>" + 
							   	   "<div class='title_content auto title-left' id='dart_list_" + (IntId + 1) + "_1' contenteditable='true' onclick='getCursortPosition(event)'>选项</div></div>" + 
							      	"<div class='title_option'><i class='icon_wj'>B、</i>" + 
				   				   "<div class='title_content auto title-left' id='dart_list_" + (IntId + 1) + "_2' contenteditable='true' onclick='getCursortPosition(event)'>选项</div></div>" + 
			   					   "</div><div class='div-span rights'>" + 
					   			   "<span class='layui-icon layui-icon-picture-fine' title='添加图片' onclick='appPicture()'></span>" + 
						   		   "<span class='layui-icon layui-icon-up' title='上移' onclick='MoveUpDiv(event)'></span>" + 
							   	   "<span class='layui-icon layui-icon-down' title='下移' onclick='MoveDownDiv(event)'></span>" + 
			   					   "<span class='layui-icon layui-icon-delete' title='删除' onclick='deleteDiv(event)'></span>" + 
				   				   "</div><div class='div-span rights div-span-top'>" + 
					   			   "<span class='layui-icon layui-icon-add-1' title='添加选项' onclick='IntOption(event)'></span>" + 
						   		   "<span class='layui-icon layui-icon-more' title='删除选项' onclick='DeleteOption(event)'></span>" + 
							   	   "</div><div class='title_option'><span class='score-span'>答案：</span>" + 
				   				   "<input id='answer_" + topicLength + "' class='input-text input-radius auto title-left input-span answer_content score-input' type='text' title='答案'>" + 
					   			   "</div><div class='title_option'><span class='score-span'>本题得分：</span>" + 
						   		   "<input id='score_" + topicLength + "' class='input-text input-radius auto title-left input-span score_content score-input' type='text' title='本题得分'onkeyup='clearNoNum(this)' onblur='clearNoNum(this)'>" + 
							   	   "</div></div>");
	   		   } else if (index == 2) {//问答题
			         textindex = "问答题";
			         topicType = 120;
			         $("#" + Id).append("<div class='div-margin form-group fff-wrap' id='" + id + "'>" + 
							   "<span class='topic-span'>" + (intNum + 1) + "、</span>" + 
							   "<div class='title_content auto title-left input-span input-height' id='dart_" + topicLength + "' contenteditable='true' onclick='getCursortPosition(event)'>" + textindex + "</div>" + 
							   "<div class='div-span rights'>" + 
							   "<span class='layui-icon layui-icon-picture-fine' title='添加图片' onclick='appPicture()'></span>" +
							   "<span class='layui-icon layui-icon-up' title='上移' onclick='MoveUpDiv(event)'></span>" + 
							   "<span class='layui-icon layui-icon-down' title='下移' onclick='MoveDownDiv(event)'></span>" + 
							   "<span class='layui-icon layui-icon-delete' title='删除' onclick='deleteDiv(event)'></span>" + 
							   "</div><div class='title_option'><i class='icon_wj'>答案：</i>" + 
							   "<div class='answer_content auto title-left' id='answer_" + topicLength + "' contenteditable='true' onclick='getCursortPosition(event)'></div>" + 
							   "</div><div class='title_option'><span class='score-span'>本题得分：</span>" + 
							   "<input id='score_" + topicLength + "' class='input-text input-radius auto title-left input-span score_content score-input' type='text' title='本题得分' onkeyup='clearNoNum(this)' onblur='clearNoNum(this)'>" + 
							   "</div></div>");
		      } else if (index == 3) {//判断题
			      textindex = "判断题";
			      topicType = 121;
			      $("#" + Id).append("<div class='div-margin form-group fff-wrap' id='" + id + "'>" +
							   "<span class='topic-span'>" + (intNum + 1) + "、</span>" + 
							   "<div class='title_content auto title-left input-span input-height' id='dart_" + topicLength + "' contenteditable='true' onclick='getCursortPosition(event)'>" + textindex + "</div>" + 
							   "<div class='div-span rights'>" + 
							   "<span class='layui-icon layui-icon-picture-fine' title='添加图片' onclick='appPicture()'></span>" + 
							   "<span class='layui-icon layui-icon-up' title='上移' onclick='MoveUpDiv(event)'></span>" + 
							   "<span class='layui-icon layui-icon-down' title='下移' onclick='MoveDownDiv(event)'></span>" + 
							   "<span class='layui-icon layui-icon-delete' title='删除' onclick='deleteDiv(event)'></span>" + 
							   "</div>"+
							   
							  "<div id='option_" + topicLength + "'><div class='title_option'><i class='icon_wj'>A、</i>" + 
							   	   "<div class='title_content auto title-left' id='dart_list_" + (IntId + 1) + "_1' contenteditable='false'>正确</div></div>" + 
							      	"<div class='title_option'><i class='icon_wj'>B、</i>" + 
				   				   "<div class='title_content auto title-left' id='dart_list_" + (IntId + 1) + "_2' contenteditable='false'>错误</div></div>" + 
			   					   "</div>"+
			   				   "<div class='title_option'><i class='icon_wj'>答案：</i>" + 
							   "<div class='answer_content auto title-left' id='answer_" + topicLength + "' contenteditable='true'></div>" + 
							   "</div>"+
							   
// 							   "<div class='title_option'><i class='icon_wj'>答案：</i>" + 
// 							   "<div id='answer_" + topicLength + "' class='answer_content title-left'>" + 
// 							  "<label class='label-right'><input class='radio-margin' type='radio' name='judge_" + topicLength + "' value='1' checked='checked'>正确</label>" + 
// 							   "<label><input class='radio-margin' type='radio' name='judge_" + topicLength + "' value='0'>错误</label>" + 
// 							   "</div></div>"+
							   "<div class='title_option'><span class='score-span'>本题得分：</span>" + 
							   "<input id='score_" + topicLength + "' class='input-text input-radius auto title-left input-span score_content score-input' type='text' title='本题得分' onkeyup='clearNoNum(this)' onblur='clearNoNum(this)'>" + 
							   "</div></div>");
		     }
		     arrTopic.push([id, titleIndex, topicType, (intNum + 1)]);
		     //arrTopic  [题目id， 标题id，题目类型，序号]
		     //           div的id，当前题目的id是属于哪种题目类型(是界面上的id，从0开始)，118、119、120、121 ，
		   	   	
	        }
	       
	        //保存试卷
	        function insertSave(saveType){
	              var papername=$("#papername").val();
	              var papertypeId=$("#papertypeId").val();
	              var gradeId=$("#gradeId").val();
	              var subjectId=$("#subjectId").val();
	              var paperscore=$("#paperscore").val();
	              var testtime=$("#testtime").val();
	              var notes=$("#notes").val();
	              if(papername==null ||papername==""){
	                  layer.msg("请输入试卷名称");
	                  return false;
	              }else if(papertypeId==0 ||papername==""){
	                  layer.msg("请选择试卷类型");
	                  return false;
	              }else if(gradeId==0 ||gradeId==""){
	                  layer.msg("请选择教学年级");
	                  return false;
	              }else if(subjectId==0 ||subjectId==""){
	                  layer.msg("请选择学科");
	                  return false;
	              }else if(paperscore==null ||paperscore==""){
	                  layer.msg("请输入试卷总分");
	                  return false;
	              }else if(testtime==null ||testtime==""){
	                  layer.msg("请输入考试限时");
	                  return false;
	              }else if(notes==null ||notes==""){
	                  layer.msg("请输入注意事项");
	                  return false;
	              }else{
	                  var title="";
	                  if(saveType==1){
	                      title="是否保存后直接发布";
	                  }else{
	                      title="是否保存为草稿";
	                  }
	                  layer.confirm(title,function(){
                      //题目类型IntarrTitle
				      IntarrTitle = new Array;
				      for (var i = 0; i < arrTitle.length; i++) {
					      var index = arrTitle[i].split("_")[2];
					      IntarrTitle[i] = $("#input_dart_" + index).val();
				      }
				      //题目IntarrTopic
				      IntarrTopic = new Array;
				      var optionType = "", answer = "";
				      for (var o = 0; o < arrTopic.length; o++) {
					      optionType = "";
					      var index = arrTopic[o][0].split("_")[2];
					      var e = document.getElementById(arrTopic[o][0]);
					      //选项optionType - 多选题和单选题的选项，其它为空
					      //答案answer - 根据题目类型获取答案
					      //[{option:Tom is me.},{option:This is Tom speaking.},{option:I am Tom.},{option:My name is Tom.}]
					      if (arrTopic[o][2] == 118 || arrTopic[o][2] == 119) {//单选题、多选题
						      var eLength = e.children[2].children.length;
						      optionType += "[";
						      for (var p = 0; p < eLength; p++) {
							      optionType += "{option:" + $("#" + e.children[2].children[p].children[1].id).html() + "}";
							      if ((p + 1) != eLength) optionType += ",";
						      }
						      optionType += "]";
						      answer = $("#" + e.children[5].children[1].id).val();
					      } else if (arrTopic[o][2] == 120) {//问答题
						      answer = $("#" + e.children[3].children[1].id).html();
					      } else if (arrTopic[o][2] == 121) {//判断题
					           var answerIndex = e.children[3].id.split("_");
						      answer = $("#" + e.children[4].children[1].id).html();
						      
// 						      var answerIndex = e.children[3].children[1].id.split("_");
// 						      answer = $("input[name='judge_" + answerIndex[1] + "']:checked").val();
					      }
					      //IntarrTopic  [题目id(题目、题目附图)， 题目类型id(当前题目是属于哪种题目类型(界面上的id),新增保存返回id)，题目类型(118,119,120,121)，序号， 题目得分、选项，答案]
					      IntarrTopic.push(e.children[1].innerHTML, arrTopic[o][1]+"titleType", arrTopic[o][2], arrTopic[o][3], $("#" + e.children[e.children.length - 1].children[1].id).val(), optionType, answer);
				      }
				       $.post("${ctx}/yearTtruth/insertYearTruth.do",{
	                      papername: papername,
	                      papertypeId: papertypeId,
	                      gradeId: gradeId,
	                      subjectId: subjectId,
	                      paperscore: paperscore,
	                      testtime: testtime,
	                      notes: notes,
	                      IntarrTitle:IntarrTitle,
	                      IntarrTopic:IntarrTopic,
	                      IntPicture:IntPicture,
	                      saveType:saveType
	                  },function(data){
	                       if(data.state == 'ok'){
	                            layer.msg(data.msg,{icon:1,time:1000});
	                            setTimeout('window.history.back(-1)', 1000);
	                            $.post("${ctx}/user/insertLog.do",{operType:"新增历年真题信息"},function(){});
	                       }else{
	                           layer.msg(data.msg,{icon:2,time:1000});
	                       }
	                  });
                  });
	              }//else
	        }
	   </script>
  </body>
</html>
