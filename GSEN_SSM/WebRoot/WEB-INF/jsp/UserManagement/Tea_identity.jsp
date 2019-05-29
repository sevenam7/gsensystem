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
    
    <title>老师管理</title>
    
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
         <legend>老师信息</legend> 
      </fieldset>
	  <input type="hidden" id="path" value="${ctx}">
	  <div id="operationDIV" ontouchstart style="position:absolute ;left:0px;right:0px;top:58px;margin-bottom:10px;">
		 <form class="layui-form">
			<div class="layui-row">
				<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3" >
					<label class="layui-form-label">姓名 </label>
					<div class="layui-input-inline" >
						<input type="text" name="teachername" id="Steachername" style="font-size:10px;"
							autocomplete="off" placeholder="请输入姓名" 
							class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
					<label class="layui-form-label">毕业院校</label>
					<div class="layui-input-inline">
						<input type="text" name="graduationcollege" style="font-size:10px;"
							autocomplete="off" placeholder="请输入毕业院校" id="Sgraduationcollege"
							class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
					<label class="layui-form-label">学科</label>
					<div class="layui-input-inline" style="width: 159px;">
						<select name="subjectId" id="SsubjectId">
						    <option value="0">---请选择---</option>
							<c:forEach items="${subjectList}" var="subjectList">
									<option value="${subjectList.subjectId}">${subjectList.subject}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
					<input class="layui-btn" value="查询" type="button"
						style="float:left;margin-left: 40px;" onclick="selectTeacher()">
					<div style="margin-top: 5px; margin-left: 130px;">
						<input type="checkbox" name="checkname" lay-filter="allChoose" title="高级">
					</div>
				</div>
			</div>
			<!-- 打开高级查询 -->
			<div class="layui-row" style="margin-top: 15px" id="seniorSelect" hidden>
				<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
					<label class="layui-form-label">创建时间</label>
					<div class="layui-input-inline" style="width: 159px;">
						<input type="text" class="layui-input" id="SdateTimeRange"
							placeholder=" - " style="font-size: 10px;">
					</div>
				</div>
				<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
					<label class="layui-form-label">职称</label>
					<div class="layui-input-inline" style="width: 159px;">
						<select name="teaTitle_id" id="SteaTitle_id" lay-verify="required" lay-search="">
						    <option value="0">---请选择---</option>
						    <c:forEach items="${teachertitleList}" var="teachertitleList">
									<option value="${teachertitleList.teatitleId}">${teachertitleList.teatitle}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
					<label class="layui-form-label">状态</label>
					<div class="layui-input-inline" style="width: 159px;">
						<select name="examineBit" id="SexamineBit" lay-verify="required" lay-search="">
						    <option value="0">---请选择---</option>
						    <option value="1">已审核</option>
						    <option value="2">未审核</option>
						</select>
					</div>
				</div>
			</div>
		</form>
	 </div>
	 <div id="tableDiv" style="margin-left: 20px;margin-top: 60px;margin-right: 30px;">
		 <table id="teaTable" lay-filter="tableTea"></table>
	 </div>
	 <script type="text/html" id="barDemo">
       <a class="layui-btn layui-btn-xs" lay-event="detail">详情</a>
	 </script>
	 <script>
	     var ctx = $("#path").val();
	     var from, table, laypage,laydate;
	     layui.use([ 'form', 'table', 'laypage', 'upload','laydate' ], function(){
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
		       // 监听行工具事件
			 table.on('tool(tableTea)', function(obj){
			     var data = obj.data;
			    if(obj.event === 'detail'){//详情
				    teaDetail(data);
				 }
			 });
		     
		     selectTeacher();
	     });//layui.use
	     
	     //查询老师信息
	     function selectTeacher(){
	        var teachername=$("#Steachername").val();
	        var graduationcollege=$("#Sgraduationcollege").val();
	        var subjectId=$("#SsubjectId").val();
	        var dateTimeRange=$("#SdateTimeRange").val();
	        var teaTitle_id=$("#SteaTitle_id").val();
	        var examineBit=$("#SexamineBit").val();
	        var division;
			var startTime;
			var endTime;
			if(SdateTimeRange!=""){
			    division=dateTimeRange.split(" - ");
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
				url : ctx + "/user/selectTeacherALL.do",
				// 这里是接收数据的PHP程序
				data : {
					teachername : teachername,
					graduationcollege : graduationcollege,
					subjectId : subjectId,
					startTime:startTime,
					endTime:endTime,
					teaTitle_id:teaTitle_id,
					examineBit:examineBit
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
					teaTable(data.data);
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
	     // 老师渲染
		function teaTable(data) {
			// 执行渲染
			table.render({
						elem : '#teaTable',
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
									field : 'teachername',
									title : '姓名',
									 width : 90,

								}, {
									field : 'teacherNickname',
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
									field : 'teachage',
									title : '教龄',
                                    width : 60,
								}, {
									field : 'subject',
									title : '学科',
									 width : 60,
								}, {
									field : 'teatitle',
									title : '职称',
								}, {
									field : 'graduationcollege',
									title : '毕业院校',
								}, {
									field : 'creationTimeStr',
									title : '创建时间',

								}, {
									field : 'examineBit',
									title : '状态',
									width : 90,
                                    templet : function(d) {
                                        if(d.examineBit==2){//1是已审核  2是未审核
                                             return '<button type="button" class="layui-btn layui-btn-xs layui-btn-danger" >未审核</button>';
                                        }else{
                                             return '<button type="button" class="layui-btn layui-btn-xs layui-btn-warm">已审核</button>';
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
		//打开老师详情界面
		function teaDetail(data){
		    window.location.href = "${ctx}/user/detailView.do?teacherId="+data.teacherId;
		}
	 </script>
  </body>
</html>
