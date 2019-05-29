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
    
    <title>学生管理</title>
    
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
     <style>
      #tableDiv .layui-table-cell {
	        height: auto;
	        line-height: 28px;
       }
    </style>
  </head>
  
  <body>
      <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">   
         <legend>学生信息</legend> 
      </fieldset>
	  <input type="hidden" id="path" value="${ctx}">
	  <div id="operationDIV" ontouchstart style="position:absolute ;left:0px;right:0px;top:58px;margin-bottom:10px;">
		 <form class="layui-form">
			<div class="layui-row">
				<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3" >
					<label class="layui-form-label">姓名 </label>
					<div class="layui-input-inline" >
						<input type="text" name="name" id="name" style="font-size:10px;"
							autocomplete="off" placeholder="请输入姓名" 
							class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
					<label class="layui-form-label">状态</label>
					<div class="layui-input-inline" style="width: 159px;">
						<select name="enabledbit" id="enabledbit" lay-verify="required" lay-search="">
						    <option value="0">---请选择---</option>
						    <option value="1">已启用</option>
						    <option value="2">未启用</option>
						</select>
					</div>
				</div>
				<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
					<label class="layui-form-label">创建日期</label>
					<div class="layui-input-inline" style="width: 159px;">
						<input type="text" class="layui-input" id="creationTime"
							placeholder=" - " style="font-size: 10px;">
					</div>
				</div>
				<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
					<input class="layui-btn" value="查询" type="button"
						style="float:left;margin-left: 40px;" onclick="selectStudent()">
				</div>
			</div>
		</form>
	 </div>
	 <div id="tableDiv" style="margin-left: 20px;margin-top: 60px;margin-right: 30px;">
		 <table id="stuTable" lay-filter="tableStu"></table>
	 </div>
	 <script type="text/html" id="barDemo">
       <a class="layui-btn layui-btn-xs" lay-event="detail">详情</a>
	 </script>
	 <script>
	        layui.use([ 'form', 'table', 'laypage', 'upload','laydate'], function(){
	              form = layui.form;
			      table = layui.table;
			      laypage = layui.laypage;
                  upload = layui.upload;
                  laydate = layui.laydate;
		     //日期时间
		     laydate.render({
			    elem : '#creationTime',
			    range: true//范围
		     });
                table.on('tool(tableStu)', function(obj){
			        var data = obj.data;
			        if (obj.event === 'detail') { // to学生详情
					    studentDetailView(data);
				    }
			    });
			    
               selectStudent();   
	        });
	        //查询学生信息
	        function selectStudent(){
			    var name = $("#name").val();
				var enabledbit = $("#enabledbit").val();//1是启用，2是未启用
				var dateTimeRange = $("#creationTime").val();
				var division;
				var startTime;
				var endTime;
				if (dateTimeRange != "") {
					division = dateTimeRange.split(" - ");
					startTime = division[0];
					endTime = division[1];
				}
				// 显示加载页面
				var loadIndex = layer.load(0, {
					shade : 0.3
				}); // 0代表加载的风格，支持0-2
				$.ajax({
					type : 'post',
					// 可选get
					url : "${ctx}/user/selectStudentALL.do",
					// 这里是接收数据的PHP程序
					data : {
						name : name,
						enabledbit : enabledbit,
						startTime : startTime,
						endTime : endTime,
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
						stuTable(data.data);
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
			
			function stuTable(data){
			     // 执行渲染
			table.render({
						elem : '#stuTable',
						// 指定原始表格元素选择器（推荐id选择器）
						data : data,
						page : { // 支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
							layout : [ 'count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip' ],
							// 自定义分页布局
							limit : 10,
							limits : [ 1, 2, 3, 5, 10, 15, 20, 30, 40, 50, 100, 150, 200 ],
							groups : 5
						// 只显示 1 个连续页码
						},
						cols : [ [
								 {
									field : 'name',
									title : '姓名',
									 width : 90,

								}, {
									field : 'nickname',
									title : '昵称',
									 width : 90,

								}, {
									field : 'sex',
									title : '性别',
									 width : 60,

								},{
									field : 'picture',
									title : '头像',
									height : 80,
									align : 'center',
									templet : function(d) {
										return '<div><img src="${ctx}/user/getImg.do?file='
												+ d.picture
												+ '"   width="45px" height="50px"></div>';
									}
								}, {
									field : 'phonenumber',
									title : '手机号码',
								}
								, {
									field : 'qq',
									title : 'QQ',
								}
								, {
									field : 'wechat',
									title : '微信号',
								}, {
									field : 'creationtimeStr',
									title : '创建时间',

								}, {
									field : 'enabledbit',
									title : '状态',
									width : 90,
                                    templet : function(d) {
                                        if(d.enabledbit==2){//1是已启用 2是未启用
                                             return '<button type="button" class="layui-btn layui-btn-xs layui-btn-danger" >未启用</button>';
                                        }else{
                                             return '<button type="button" class="layui-btn layui-btn-xs layui-btn-warm">已启用</button>';
                                        }
									}
								}, {
									fixed : 'right',
									title : '操作',
									width : 90,
									toolbar : '#barDemo'

								} ] ] // 设置表头
						,
						limit : data.length
					});
			}
			//to 学生详情
			function studentDetailView(data){
			    window.location.href = "${ctx}/user/studentDetailView.do?studentId="+data.studentId;
			}
		</script>
  </body>
</html>
