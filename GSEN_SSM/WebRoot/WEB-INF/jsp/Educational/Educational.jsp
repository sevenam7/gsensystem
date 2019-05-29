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
    
    <title>教育资讯</title>
    
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
       .layui-form-checkbox{
            margin-left: 20px;
       }
        #tableDiv .layui-table-cell {
	        height: auto;
	        line-height: 28px;
       }
      .c-red{
         color: red;
      }
    </style>
   
    
  </head>
  
  <body style="max-height: 100%">
      <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">   
         <legend>教育资讯信息</legend> 
      </fieldset>
	  <input type="hidden" id="path" value="${ctx}">
	  <div id="operationDIV" ontouchstart style="position:absolute ;left:0px;right:0px;top:58px;margin-bottom:10px;">
		 <form class="layui-form">
			<div class="layui-row">
				<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3" >
					<label class="layui-form-label">大标题 </label>
					<div class="layui-input-inline" >
						<input type="text" name="headline" style="font-size:10px;"
							autocomplete="off" placeholder="请输入大标题" id="Sheadline"
							class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
					<label class="layui-form-label">副标题</label>
					<div class="layui-input-inline">
						<input type="text" name="subtitle" style="font-size:10px;"
							autocomplete="off" placeholder="请输入副标题" id="Ssubtitle"
							class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
					<label class="layui-form-label">状态</label>
					<div class="layui-input-inline" style="width: 165px;">
						<select name="enabledBit" id="SenabledBit" lay-verify="required" lay-search="">
						    <option value="0">---请选择---</option>
						    <option value="1">启用</option>
						    <option value="2">停用</option>
						</select>
					</div>
				</div>
				<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
					<input class="layui-btn" value="查询" type="button"
						style="float:left;margin-left: 20px;" onclick="selectInformation()">
					<input class="layui-btn layui-btn-normal" value="新增" type="button"
						style="float:left;margin-left: 20px;" onclick="insertInformation()">
					<div style="margin-top: 5px">
						<input type="checkbox" name="checkname" lay-filter="allChoose" title="高级">
					</div>
				</div>
			</div>
			<!-- 打开高级查询 -->
			<div class="layui-row" style="margin-top: 15px" id="seniorSelect" hidden>
				<div class="layui-inline">
					<label class="layui-form-label">创建日期</label>
					<div class="layui-input-inline">
						<input type="text" class="layui-input" id="SdateTimeRange"
							placeholder=" - " >
					</div>
				</div>
			</div>
		</form>
	 </div>
	 <div id="tableDiv" style="margin-left: 20px;margin-top: 60px;margin-right: 30px;">
		 <table id="informationTable" lay-filter="tableInformation"></table>
	 </div>
      <!--新增-->
	<div id="inserDiv" style="display:none;" >
	   <form class="layui-form" id="formInsert" enctype="multipart/form-data">
	        <div style="width: 100%;max-width: 100%;overflow: auto;position: absolute;top: 10px;bottom: 0px;left: 0px;right: 0px;" >
			<div class="layui-form" style="padding: 2px 120px" >
				<div class="layui-row" style="margin-top:10px;">
					<div class="layui-form-item">
						<label class="layui-form-label"><span class="c-red">*</span>大标题</label>
						<div class="layui-input-block">
							<input type="text" name="headline" id="Iheadline" lay-verify="title"
									autocomplete="off" placeholder="请输入大标题" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
							<label class="layui-form-label"><span class="c-red">*</span>副标题</label>
							<div class="layui-input-block">
								<input type="text" name="subtitle" id="Isubtitle" lay-verify="title"
									autocomplete="off" placeholder="请输入副标题" class="layui-input">
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
							<div name="h_Content" id="h_Content" style="height:350px;"></div>
							<input style="display: none" type="text" name="prevContent" id="prevContent">
						</div>
					</div>

				</div>

				<div class="layui-row" style="margin-top:25px;">
					<div class="layui-col-md1 layui-col-md-offset5">
						 <button type="button" class="layui-btn" lay-filter="insertSave"lay-submit="" >确认保存</button>
					</div>
					<div class="layui-col-md1"style="margin-left:20px;">
						<button type="reset" class="layui-btn layui-btn-primary" onclick="Ireset()">重置</button>
					</div>
				</div>
			</div>
		</div>
	   </form>
	</div>
	
      
      <script type="text/html" id="barDemo">
       <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
       <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除</a>      
	 </script>
     
     <script>
     var ue;
        $(function(){
        //实例化编辑器
			//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，
			//直接调用UE.getEditor('editor')就能拿到相关的实例
            UE.getEditor('h_Content');
        });
         var ctx = $("#path").val();
         var from, table, laypage,laydate;
        
         layui.use([ 'form', 'table', 'laypage', 'upload' ,'laydate'], function(){
             form = layui.form;
			 table = layui.table;
			 laypage = layui.laypage;
             upload = layui.upload;
             laydate = layui.laydate;
		     //日期时间
		     laydate.render({
			    elem : '#SdateTimeRange',
			    range: true//范围
		     });
		    
             //复选框监听事件--高级
		     form.on('checkbox(allChoose)', function(obj) {
			 //获取复选框状态，是否选中
			    var check = obj.elem.checked;
			    if (check) {
				   $("#seniorSelect").show();
				   $("#tableDiv").css("margin-top","110px");
			    } else {
				   $("#seniorSelect").hide();
				   $("#tableDiv").css("margin-top","60px");
			    }
		     });
		     // 监听提交
		    form.on('submit(insertSave)', function(data) {
				insertSave(data);//新增保存
				return false;
			});
             
             // 监听行工具事件
			 table.on('tool(tableInformation)', function(obj){
			     var data = obj.data;
			     if (obj.event === 'delete') { // 删除
					deleteInformation(data);
				 }else if(obj.event === 'edit'){//修改
				    informationEditView(data);
				 }
			 });
             
             selectInformation();
         });//layui.use
         //查询资讯
         function selectInformation(){
            var Sheadline = $("#Sheadline").val(); // 大标题
			var Ssubtitle = $("#Ssubtitle").val(); // 副标题
			var SenabledBit = $("#SenabledBit").val(); // 启用否
			var SdateTimeRange=$("#SdateTimeRange").val();
			var division;
			var startTime;
			var endTime;
			if(SdateTimeRange!=""){
			    division=SdateTimeRange.split(" - ");
			    startTime=division[0];
			    endTime=division[1];
			}
			// 显示加载页面
			var loadIndex = layer.load(0, {
				shade : 0.3
			}); // 0代表加载的风格，支持0-2
			$.ajax({
			    type : 'post',
				// 可选get
				url : ctx + "/educational/selectInformation.do",
				// 这里是接收数据的PHP程序
				data : {
					headline : Sheadline,
					subtitle : Ssubtitle,
					enabledBit : SenabledBit,
					startTime:startTime,
					endTime:endTime
				},
				// 传给PHP的数据，多个参数用&连接
				dataType : 'Json',
				// 服务器返回的数据类型 可选XML ,Json jsonp script html text等
				success : function(data, textStatus) {
					layer.close(loadIndex);
					if (data.state != 'ok') {
						layer.msg(data.msg);
						return false;
					}
					informationTable(data.data);
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					layer.close(loadIndex);
					layer.msg('查询失败:' + errorThrown);
					// 					console.log(textStatus);
					// 					console.log(XMLHttpRequest);
					// 					console.log(errorThrown);
				}
			});
         }
         
        // 资讯渲染
		function informationTable(data) {
			// 执行渲染
			table.render({
						elem : '#informationTable',
						// 指定原始表格元素选择器（推荐id选择器）
						data : data,
						page : { // 支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
							layout : [ 'count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip' ],
							// 自定义分页布局
							limit : 10,
							limits : [ 1, 2, 3, 5, 10, 15, 20, 30, 40, 50, 100,
									150, 200 ],
							groups : 5
						// 只显示 1 个连续页码
						},
						cols : [ [

								 {
									field : 'headline',
									title : '大标题',

								}, {
									field : 'subtitle',
									title : '副标题',

								},{
									field : 'inforpicture',
									title : '资讯图片',
									height : 80,
									align : 'center',
									templet : function(d) {
										return '<div><img src="${ctx}/educational/getImgs.do?file='
												+ d.inforpicture
												+ '"   width="45px" height="50px"></div>';
									}
								}, {
									field : 'uploadtimeStr',
									title : '创建时间',

								}, {
									field : 'enabledBit',
									title : '状态',
									width : 100,
                                    templet : function(d) {
                                        if(d.enabledBit==0){
                                             return '<button type="button" class="layui-btn layui-btn-xs layui-btn-danger" onclick="prohibit('+d.informationId+')" title="点击启用">已禁用</button>';
                                        }else{
                                             return '<button type="button" class="layui-btn layui-btn-xs layui-btn-warm" onclick="prohibit('+d.informationId+')" title="点击禁用">已启用</button>';
                                        }
									}
								}, {
									fixed : 'right',
									title : '操作',
									width : 160,
									toolbar : '#barDemo'

								} ] ] // 设置表头
						,
						limit : data.length
					});
		}
		//新增重置
		function Ireset(){
		    $("#formInsert")[0].reset();
            // 删除方法
			$(".file_del").click();
// 		    $("#demo").css("height","198px");
// 		    $("#preview").css("height","0px");
		    
		}
		//删除资讯信息
		function deleteInformation(data){
		     if (data.informationId != "") {
						// 询问框
						layer.confirm('是否删除这条资讯信息?', {
							icon : 3,
							title : '提示',
							shade : 0.3,
							// 遮罩
							fixed : true,
							// 固定
							shadeClose : false,
							// 是否点击遮罩关闭
							btn : [ '确定', '取消' ]
						}, function(index) { // 确定回调方法
							layer.close(index);
							// 显示加载页面
							$.ajax({
								type : 'post',
								// 可选get
								url : ctx + '/educational/delectInformation.do',
								// 这里是接收数据的PHP程序
								data : {
									informationId : data.informationId
								},
								// 传给PHP的数据，多个参数用&连接
								dataType : 'Json',
								// 服务器返回的数据类型 可选XML ,Json jsonp script html text等
								scriptCharset : 'UTF-8',
								async : false,
								// 禁止异步
								success : function(data, textStatus) {
									if (data.state == 'ok') {
										layer.msg(data.msg);
										selectInformation(); // 刷新查询
										$.post("${ctx}/user/insertLog.do",{operType:"删除教育资讯"},function(){});
									} else {
										layer.msg(data.msg);
									}
								}
							});
						});
					} else {
						myMsg("未检测到选中的数据！");
					}
		}
		// 新增弹窗用户
		var inserView = -1;
		function insertInformation(){
		     Ireset();
		     inserView = layer.open({
				type : 1,
				//area : [ '500px', '300px' ],
				content : $('#inserDiv'),
				title : "新增资讯信息"
			});
			layer.full(inserView); // 最大化
			
		}
		var arrayPicture = new Array();　//存放图片数组
		var one="1";
		//新增保存
		function insertSave(){
		   var Iheadline= $("#Iheadline").val();
		   var Isubtitle=$("#Isubtitle").val();
		   var uploadFile = ZYFILE.uploadFile;
		   var h_Content = UE.getEditor('h_Content').getContentTxt();
           var b = false;
            var arr = "";
            arrayPicture=[];
            one="1";
            if(Iheadline==""||Iheadline==null){
                layer.msg("大标题不能为空，请输入");
				return false;
            }else if(Isubtitle==""||Isubtitle==null){
                layer.msg("副标题不能为空，请输入");
				return false;
            }else if(uploadFile.length == 0){
                 layer.msg("资讯图片不能为空，请输入");
				return false;
            }else if(h_Content==""||h_Content==null){
                layer.msg("资讯内容不能为空，请输入");
				return false;
            }else{
                 if (uploadFile.length != 0) { 
                    // 遍历所有文件，在调用单个文件上传的方法
                    $.each(uploadFile, function (k, v) {
                        if (v.size / 1024 > 50*1024) 
                             arr = v.name + ","; 
                             funUploadFile(Iheadline,Isubtitle,uploadFile.length,v);
                        });
                     b = true;
                 }
                 if (b == true) {
                     if (arr != "" && arr != undefined)
                        alert(arr + "大小超过50M,无法同步JIRA");    
                         //  alert("上传成功");
                         // location.reload();
                 }
            }
           
		}
		 // 上传单个个文件
        function funUploadFile(Iheadline,Isubtitle,length,file) {
            var self = this;  // 在each中this指向没个v  所以先将this保留
            var formdata = new FormData();
            formdata.append("headline", Iheadline);
            formdata.append("subtitle", Isubtitle);
             formdata.append("files", file);
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "${ctx}/educational/uploadPictures.do",true);
            xhr.send(formdata);
            xhr.onreadystatechange = function() {
               if(xhr.responseText!="" ){
                   var data=eval('[' + xhr.responseText + ']');//转换成js对象 
				   data=data[0].msg;
                  var hh= arrayPicture.indexOf(data)
                  if(hh<0){
                       arrayPicture.push(data);
                  }
               }
               if(arrayPicture.length==length && one=="1"){
                  one="2";
                  // 显示加载页面
			     var loadIndex = layer.load(0, {shade : 0.3 }); // 0代表加载的风格，支持0-2
                 $("#formInsert").ajaxSubmit({
					type : 'POST',
					// 可选get
					url : ctx + "/educational/saveInformation.do?arrayPicture="+arrayPicture,
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
							layer.close(inserView);
							selectInformation();//查询表格
							$.post("${ctx}/user/insertLog.do",{operType:"新增教育资讯"},function(){});
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
       // alert(xhr.responseText);//显示当前页面的代码，不是{“message”, 1}
       // var json = JSON.parse(xhr.responseText);
            }
        }
        //打开修改页面回填信息
        function informationEditView(data){
             window.location.href = "${ctx}/educational/updateView.do?informationId="+data.informationId;
        }
        //启用否
        function prohibit(id){
            $.post("${ctx}/educational/prohibit.do",{informationId:id,},function(data){
                 if (data.state == 'ok') {
					 layer.msg(data.msg,{icon:1,time:1000});
					 selectInformation(); // 刷新查询
					 $.post("${ctx}/user/insertLog.do",{operType:"修改教育资讯的启用否"},function(){});
				  } else {
					 layer.msg(data.msg,{icon:2,time:1000});
				  }
            });
          
        }
     </script>
  </body>
</html>
