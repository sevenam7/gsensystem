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
    
    <title>审核课件包</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
     <link rel="stylesheet" href="${ctx}/common/layuis/css/layui.css"type="text/css"></link>
     	<link rel="stylesheet" href="${ctx}/common/flowplayer/skin/skin.css" type="text/css"></link>	
    <script type="text/javascript" src="${ctx}/common/layuis/layui.js"></script>
    <script type="text/javascript" src="${ctx}/common/js/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="${ctx}/common/js/jquery.form.js"></script>
    <script type="text/javascript" src="${ctx}/common/flowplayer/flowplayer.min.js"></script>
    <script type="text/javascript" src="${ctx}/common/js/customfunction.js"></script>
    <style>
      .pId{
        line-height: 36px;
     }
     
     /*=================试卷*/
.test-context {
	border: 1px solid #ccc;
	padding: 30px;
	margin: 0 auto;
}
.test-title {
	text-align: center;
}
.test-title-size {
	font-weight: 600;
	color: #333;
	font-size: 22px;
}
.test-little-title {
	font-weight: bold;
	font-size: 18px;
	line-height: 40px;
	color: #333;
}
.padding-UD {
	padding: 10px 0;
}
.padding-UD p img {
	vertical-align: middle;/*图片垂直居中*/
	padding: 2px 2px;
}
.test-option {
	height: 50px;
	line-height: 50px;
	background: #e8e8e8;
}
.test-option b {
	display: inline-block;
	padding: 0 15px;
}
.test-option label {
	display: inline-block;
	padding-right: 10px;
}
.test-option span {
	display: inline-block;
    width: 96px;
    height: 32px;
    text-align: center;
    line-height: 32px;
    margin-left: 50px;
    background: #6fc467;
    color: #fff;
    cursor: pointer;
}
.test-answer {
	background: #ebffe9;
	border: 1px solid #e2e2e2;
	margin-top: 10px;
	padding: 10px;
	line-height: 37px;
	display: none;
}
.label-top{
  margin-top: 15px;
}
.careful{
  margin: 12px 0;
}
.title_bottom{
margin-bottom: 10px;
}
   .titleOption {
       margin-bottom: 10px;
   }
    </style>
  </head>
  
  <body>
       <input type="hidden" id="path" value="${ctx}">
      <form class="layui-form" id="formUpdate" enctype="multipart/form-data">
	     <div style="width: 100%;max-width: 100%;overflow: auto;position: absolute;top: 10px;bottom: 0px;left: 0px;right: 0px;" >
			  <fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">   
                  <legend>审核课件包</legend> 
              </fieldset>
			<div class="layui-form" style="padding: 2px 30px;margin-top: -10px;" >
				<div class="layui-row">
					<div class="layui-col-xs5">
						<div class="layui-form-item">
						<input type="text" name="courseId" title="课件id" style="display:none;"value="${courseList.courseId}">
							<label class="layui-form-label" style="width: 85px;margin-left:-4px;">课件包名称：</label>
							<div class="layui-input-block">
								<p class="pId" id="coursename"></p>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">上传者：</label>
							<div class="layui-input-block">
								<p class="pId" id="teachername"></p>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">教学版本：</label>
							<div class="layui-input-block">
								<p class="pId" id="teachversion"></p>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">课件价格：</label>
							<div class="layui-input-block">
								<p class="pId" id="courseprice"></p>
							</div>
						</div>
					</div>
					<div class="layui-col-xs4">
					     <div class="layui-form-item">
							<label class="layui-form-label">知识点：</label>
							<div class="layui-input-block">
								<p class="pId" id="knowledge"></p>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">学科：</label>
							<div class="layui-input-block">
								<p class="pId" id="subject"></p>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">年级：</label>
							<div class="layui-input-block">
								<p class="pId" id="gradename"></p>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">状态：</label>
							<div class="layui-input-block" id="zt">
							
							</div>
						</div>
					</div>
					<div class="layui-col-xs3" id="but">
<!-- 						  <button type="button" class="layui-btn" lay-filter="examine"lay-submit="" style="margin-top: 160px;">审核通过</button> -->
<!-- 						  <button type="button" class="layui-btn layui-btn-warm"onClick="javascript :history.back(-1);" id="retop" style="margin-top: 160px;">返回</button> -->
					</div>
				</div>
				<div class="layui-tab" style="margin-top:0px;">
					<ul class="layui-tab-title">
						<li class="layui-this">视频附件</li>
						<li>试卷附件</li>
					</ul>
					<div class="layui-tab-content">
						<div class="layui-tab-item layui-show">
							<div class="flowplayer" data-swf="flowplayer.swf"
								data-ratio="0.4167">
								<video controls preload> 
								    <source type="video/mp4" src="${ctx}/user/getImg.do?file=${courseList.video}">
							    </video>
							</div>
						</div>
						<div class="layui-tab-item test-context" id="div_count"></div>
					</div>
				</div>
			</div>
		</div>
	   </form>
    
    <script>
         var ctx = $("#path").val();
	     var loading = ["A","B","C","D","E","F","G","H","I","J","k","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
    	 layui.use([ 'form','element'], function(){
    	      var $ = layui.jquery ,element = layui.element;
    	      form = layui.form;
    	       // 监听提交
		        form.on('submit(examine)', function(data) {
				    examine(data);//课件审核
				    return false;
			    });
			    
    	     $("#coursename").text("${courseList.coursename}");
    	     $("#knowledge").text("${courseList.knowledge}");
    	     $("#courseprice").text("${courseList.courseprice}"+" 元");
    	     $("#teachername").text("${teacherList.teachername}");
    	     $("#gradename").text("${gradeList.gradename}");
    	     $("#teachversion").text("${teachversionList.teachversion}");
    	     $("#subject").text("${subjectList.subject}");
    	     var examinebit="${courseList.examinebit}";
    	     if(examinebit==0){
    	       $("#zt").append('<button type="button" class="layui-btn layui-btn layui-btn-xs layui-btn-danger" style="margin-top: 6px;">未审核</button>');
    	        $("#but").append('<button type="button" class="layui-btn" lay-filter="examine" lay-submit="" style="margin-top: 160px;">通过审核</button>');
    	        $("#but").append('<button type="button" class="layui-btn l layui-btn-primary"onClick="javascript :history.back(-1);" id="retop" style="margin-top: 160px;">返回</button>');
    	     }else{
    	         $("#zt").append('<button type="button" class="layui-btn layui-btn layui-btn-xs layui-btn-danger"style="margin-top: 6px;">已审核</button>');
    	         $("#but").append('<button type="button" class="layui-btn layui-btn-warm" lay-filter="examine" lay-submit="" style="margin-top: 160px;">取消审核</button>');
    	         $("#but").append('<button type="button" class="layui-btn  layui-btn-primary"onClick="javascript :history.back(-1);" id="retop" style="margin-top: 160px;">返回</button>');
    	     }
    	     
    	     var Id = "${courseList.papeId}";
    	     if(Id!="" && Id!=null){
    	            if("${paperList}"!=null && "${paperList}"!="" ){
    	                $("#div_count").html("");
    	                var apphead = "<div class='test-title test-title-size'>" + "${paperList.papername}" + "</div>" + 
     							  "<div class='test-title label-top'>（满分 " + "${paperList.paperscore}" + "分，限时" + "${paperList.testtime}" + "分钟）</div>" +
     							  "<div class='label-top careful'>注意事项：" + "${paperList.notes}" + "</div>";
     					var appcontent = "";		  
    	                $.post("${ctx}/yearTtruth/showTitleType.do",{id:Id},function(data){
	                        var data=data.data;
	                        for(var i=0;i<data.length;i++){
	                            var titletypeId = data[i].titletypeId;
	                            var serial=data[i].serial;
								 serial=NumberToChinese(parseInt(serial));//阿拉伯数字转换成汉字
								 // var sss= ChineseToNumber("一");//汉字转换成阿拉伯数字
	                            appcontent += "<div class='test-little-title label-top'>" + serial + "、" + data[i].titletype + "</div>";
	                            $.ajaxSettings.async = false;
	                            $.post("${ctx}/yearTtruth/showTitle.do",{id:titletypeId},function(datas){
	                                  var datas=datas.data;
	                                  for ( var o = 0; o < datas.length; o++) {
										  var titletypeId=datas[o].titletypeId;
										  var titleA=datas[o].titleA;
										   while(titleA.indexOf("reveal_photo.do")!=-1){
								                titleA=titleA.replace("reveal_photo.do", "reveal_photo_up.do");
								           }
								           var answerA= datas[o].answerA;
								            while(answerA.indexOf("reveal_photo.do")!=-1){
								                answerA=answerA.replace("reveal_photo.do", "reveal_photo_up.do");
								           }
								           var type="";
										  //显示答案选项或答案输入框
	     						          var varinput = "";
	     						          var titleType = datas[o].title_type;
     							          var titleOption = datas[o].optionA;
										  if (titleType == 120) {//问答题
										     type="您的答案";
	     							         varinput = "<input type='text'>";
	     							      } else if (titleType == 118 || titleType == 119) {//单项题、多项题
	     							           type="您的选择";
	     							         var option = datas[o].optionA.replace("[", "").replace("]", "").split("{option:");
	     							         titleOption = "";
	     							         for (var p = 1; p < option.length; p++) {
	     								         var radio = "radio";
	     								         if (titleType == 119) radio = "checkbox";
	     								         varinput += "<label><input type='" + radio + "' name='name" + datas[o].serial + "' value='" + loading[p-1] + "'>" + loading[p-1] + "</label>";
										         var optionSubstr = option[p].substr(0,option[p].length - 1);
										         while(optionSubstr.indexOf("reveal_photo.do")!=-1){
								                      optionSubstr=optionSubstr.replace("reveal_photo.do", "reveal_photo_up.do");
								                 }
								                 if(optionSubstr.indexOf("},")!=-1){
								                       optionSubstr=optionSubstr.replace("},","");
								                 }
								                 if(optionSubstr.indexOf("}")!=-1){
								                       optionSubstr=optionSubstr.replace("}","");
								                 }
										         titleOption +="<p class='titleOption'>"+ loading[p-1] + "." + optionSubstr + "<br>"+"</p>";
	     							         }
	     						         } else if (titleType == 121) {//判断题
	     						            type="您的选择";
	     							         varinput = "<label><i class='icon_wj'>A、</i>√</label>" +
	     									   "<label><i class='icon_wj'>B、</i>×</label>";
	     						         }
										  appcontent += "<div class='padding-UD'><p class='title_bottom'>" + datas[o].serial + "、" +titleA + "</p>" + 
     										  "<p class='p-left'>" + titleOption + "</p><div class='test-option'>" + 
     										  "<b>"+type+"</b>" + varinput + "<span onclick='showAnswer(" + titletypeId + "," + datas[o].serial + ")'>查看答案</span>" + 
     										  "</div><div class='test-answer' id='answer_" + titletypeId + "_" + datas[o].serial + "'> 【参考答案】" + answerA + 
     										  "</div></div>";
     										 // $(".layui-form input[type=radio]").css("display","none");
     										 // document.getElementByName(".layui-form input[type=radio]").removeAttribute("style");
     										 // $(".layui-form input[type=radio]").removeAttr("style");
									  }
	                            });
	                             $.ajaxSettings.async = true;
	                        } 
	                         $("#div_count").append(apphead + appcontent);
	                    });
	                   
    	            }else{
    	                $("#div_count").html("");
    	                $("#div_count").append("暂无试卷附件...");
    	            }
	          }
    	     
    	 });//layui.use
    	 //显示参考答案
	function showAnswer(index, id) {
		if ($("#answer_" + index + "_" + id).css("display") == "none") {
			$("#answer_" + index + "_" + id).css("display","block");
		} else {
			$("#answer_" + index + "_" + id).css("display","none");
		}
	}
	
    	 //课件审核
    	 function examine(data){
    	     // 显示加载页面
			     var loadIndex = layer.load(0, {shade : 0.3 }); // 0代表加载的风格，支持0-2
                 $("#formUpdate").ajaxSubmit({
					type : 'POST',
					// 可选get
					url : ctx + "/user/exCourse.do",
					// 这里是接收数据的PHP程序
					data : {
					   //courseId:data.courseId
					},
					// 传给PHP的数据，多个参数用&连接
					dataType : 'json',
					// 服务器返回的数据类型 可选XML ,Json jsonp script html text等
					scriptCharset : 'UTF-8',
					success : function(data, textStatus) {
						layer.close(loadIndex);
						if (data.state == 'ok') {
							layer.msg(data.msg);
							setTimeout('$("#retop").click()', 1000);
							$.post("${ctx}/user/insertLog.do",{operType:"审核课件包信息"},function(){});
						} else {
							layer.msg(data.msg);
						}
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						layer.close(loadIndex);
						layer.msg('保存失败:' + errorThrown);
					}
				});
    	 }
    </script>
  </body>
</html>
