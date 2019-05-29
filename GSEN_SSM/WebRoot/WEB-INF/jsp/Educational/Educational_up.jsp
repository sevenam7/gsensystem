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
    
    <title>修改教育资讯</title>
    
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
    
    <link href="${ctx}/common/upload/control/css/zyUpload.css" rel="stylesheet" />
    <script src="${ctx}/common/upload/core/zyFile.js"></script>
    <script src="${ctx}/common/upload/control/js/zyUpload.js"></script>
    <script src="${ctx}/common/upload/core/lanrenzhijia.js"></script>
    
    <script type="text/javascript" charset="utf-8" src="${ctx}/common/Ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8"src="${ctx}/common/Ueditor/ueditor.all.min.js"></script>
<!-- 	建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败 -->
<!-- 	这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文 -->
	<script type="text/javascript" charset="utf-8" src="${ctx}/common/Ueditor/lang/zh-cn/zh-cn.js"></script>
     
     <style>
        .c-red{
           color:red;
        }
        .layui-input-block{
           width:790px;
        }
     </style>
  </head>
  
  <body>
	  <input type="hidden" id="path" value="${ctx}">
      <form class="layui-form" id="formUpdate" enctype="multipart/form-data">
	     <div style="width: 100%;max-width: 100%;overflow: auto;position: absolute;top: 10px;bottom: 0px;left: 0px;right: 0px;" >
			  <fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">   
                  <legend>修改教育资讯</legend> 
              </fieldset>
			<input type="text" id="UinforId" name="informationId" style="display:none;"value="${information.informationId}">
			<div class="layui-form" style="padding: 2px 120px;margin-top: -10px;" >
				<div class="layui-row">
					<div class="layui-form-item">
						<label class="layui-form-label"><span class="c-red">*</span>大标题</label>
						<div class="layui-input-block">
							<input type="text" name="headline" id="Uheadline" lay-verify="title"
									autocomplete="off" placeholder="请输入大标题" class="layui-input"value="${information.headline}">
						</div>
					</div>
					<div class="layui-form-item">
							<label class="layui-form-label"><span class="c-red">*</span>副标题</label>
							<div class="layui-input-block">
								<input type="text" name="subtitle" id="Usubtitle" lay-verify="title"
									autocomplete="off" placeholder="请输入副标题" class="layui-input"value="${information.subtitle}">
							</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label"><span class="c-red">*</span>资讯图片</label>
							<div class="row">
								<div id="rootwizard" class="form-wizard">
									<div class="form-horizontal">
										<div id="demo" class="demo" style="margin-left: 110px;"></div>
									</div>
								</div>
							</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label"><span class="c-red">*</span>内容</label>
						<div class="layui-input-block">
							<div name="Uh_Content" id="Uh_Content" style="height:350px;"></div>
						</div>
					</div>

				</div>
				<div class="layui-row" style="margin-top:25px;">
					<div class="layui-col-md1 layui-col-md-offset5">
						 <button type="button" class="layui-btn" lay-filter="updateSave"lay-submit="" >确认保存</button>
					</div>
					<div class="layui-col-md1"style="margin-left:28px;">
						<button type="reset" class="layui-btn layui-btn-primary" id="Ureset">重置</button>
					</div>
					<div class="layui-col-md1">
						<button type="button" class="layui-btn layui-btn-warm" id="close1">关闭</button>
					</div>
				</div>
			</div>
		</div>
	   </form>
	   
	   <script type="text/javascript">
	       var upId=$("#UinforId").val();
	       var ctx = $("#path").val();
           var ue,from,upload;
	       $(function(){
	          ue= UE.getEditor('Uh_Content');
	          var str = '${information.content}';
			  ue.addListener("ready", function () {
              ////  editor准备好之后才可以使用
                 ue.setContent(str,false);
               //// true表示清空编辑器俩面的内容，在内容后面添加内容，不传，默认是true；false表示清空当前编辑器的内容后，在插入内容。
              });  
              
              var picture='${information.inforpicture}';
              if(picture!=""){
                   var splitStr=picture.split(";");
                   for ( var int = 0; int < splitStr.length-1; int++) {
					  var index= splitStr[int].lastIndexOf("/");
					  var pictureName=splitStr[int].substring(index+1,splitStr[int].length);
					  var html='';
				    html += '<div id="uploadList_'+ int +'" class="upload_append_list">';
					html += '	<div class="file_bar">';
					html += '		<div style="padding:5px;">';
					html += '			<p class="file_name">' + pictureName + '</p>';
					html += '<span class="file_del" data-index="'+int+'" title="删除"></span>';   // 删除按钮的html
					html += '		</div>';
					html += '	</div>';
					html += '	<a style="height:100px;width:120px;" href="javascript:;" class="imgBox">';
					html += '		<div class="uploadImg" style="width:105px">';				
					html += '			<img id="uploadImage_'+int+'" class="upload_image" src="${ctx}/educational/getImgs.do?file='
												+ splitStr[int]
												+ '" style="width:105px" />';                                                                 
					html += '		</div>';
					html += '	</a>';
					html += '	<p id="uploadProgress_'+int+'" class="file_progress"></p>';
					html += '	<p id="uploadFailure_'+int+'" class="file_failure">上传失败，请重试</p>';
					html += '	<p id="uploadSuccess_'+int+'" class="file_success"></p>';
					html += '</div>';
					$("#preview").append(html);
					$("#preview").css("height","200px");
       				$("#demo").css("height","400px");
				   }
              }
	       })
	       $("#close1").click(function(){
                window.location.href = "${ctx}/user/Educational.do";
           });
	       $("#Ureset").click(function(){
	           location=location;
	       });
           layui.use([ 'form','upload' ], function(){
                form = layui.form;
                upload = layui.upload;
                
                 // 监听提交
		        form.on('submit(updateSave)', function() {
				    updateSave();//修改保存
				    return false;
			    });
           });//layui.use
           //修改保存
           function updateSave(){
                 var Uheadline= $("#Uheadline").val();
		         var Usubtitle=$("#Usubtitle").val();
		         var h_Content = UE.getEditor('Uh_Content').getContentTxt();
		         if(Uheadline=="" ||Uheadline==null){
		              layer.msg("大标题不能为空，请输入");
				      return false;
		         }else if(Usubtitle==""||Usubtitle==null){
		               layer.msg("副标题不能为空，请输入");
				       return false;
		         }else if(h_Content==""||h_Content==null){
		              layer.msg("内容不能为空，请输入");
				       return false;
		         }else{
		                // 显示加载页面
			     var loadIndex = layer.load(0, {shade : 0.3 }); // 0代表加载的风格，支持0-2
			      $("#formUpdate").ajaxSubmit({
					type : 'POST',
					// 可选get
					url : ctx + "/educational/updateSaveInformation.do",
					// 这里是接收数据的PHP程序
					data : {
						//arrayPicture:arrayPicture
					},
					// 传给PHP的数据，多个参数用&连接
					dataType : 'json',
					// 服务器返回的数据类型 可选XML ,Json jsonp script html text等
					scriptCharset : 'UTF-8',
					success : function(data, textStatus) {
						layer.close(loadIndex);
						if (data.state == 'ok') {
							layer.msg(data.msg);
							setTimeout('$("#close1").click()', 1000);
							$.post("${ctx}/user/insertLog.do",{operType:"修改教育资讯"},function(){});
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
           }
          
          
	   </script>
  </body>
</html>
