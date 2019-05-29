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
    
    <title>日志管理</title>
    
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

  </head>
   
  <body>
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">   
         <legend>课件评价信息</legend> 
      </fieldset>
	  <input type="hidden" id="path" value="${ctx}">
	  <div id="operationDIV" ontouchstart style="position:absolute ;left:0px;right:0px;top:58px;margin-bottom:10px;">
		 <form class="layui-form">
			<div class="layui-row">
				<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3" >
					<label class="layui-form-label">用户名称 </label>
					<div class="layui-input-inline" >
						<input type="text" id="name" style="font-size:10px;"
							autocomplete="off" placeholder="请输入用户名称" 
							class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
					<label class="layui-form-label">用户类型 </label>
					<div class="layui-input-block" >
						<select name="userType_id" id="userType_id">
							
						</select>
					</div>
				</div>
				
				<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
					<input class="layui-btn" value="查询" type="button"
						style="float:left;margin-left: 40px;" onclick="selectLog()">
					<input class="layui-btn" value="导出" type="button"
						style="float:left;margin-left: 20px;" onclick="printdrugstock()">
				</div>
			</div>
		</form>
	 </div>
	 <div id="tableDiv" style="margin-left: 20px;margin-top: 60px;margin-right: 30px;">
		 <table id="logTable" lay-filter="tableLog"></table>
	 </div>
	 <script>
	      var printdata;
	       layui.use([ 'form', 'table', 'laypage'], function(){
	              form = layui.form;
			      table = layui.table;
			      laypage = layui.laypage;
                
                  $.ajax({
				     type : 'post',//可选get
				     url : '${ctx}/user/selectuserTypedo.do',//这里是接收数据的PHP程序
				     dataType : 'text',//服务器返回的数据类型 可选XML ,Json jsonp script html text等
				     scriptCharset : 'UTF-8',
				     success : function(data, textStatus) {
					     data = eval('[' + data + ']');
					     data = data[0];
					     //console.log(data);
					     var html_two = '<option value="0">---请选择---</option>';//下拉框加入‘请选择’
					     $('#userType_id').html(html_two);
					     //用户类型下拉框绑定
					     $.each(data.usertypeList, function(index, item) {
						     $('#userType_id').append(
								new Option(item.usertype, item.usertypeId));//往下拉菜单里添加元素
					     });
					     form.render('select');
				     },
				     error : function(XMLHttpRequest, textStatus, errorThrown) {
					     alert(errorThrown);
					     // 					console.log(textStatus);
					     // 					console.log(XMLHttpRequest);
					     // 					console.log(errorThrown);
				     }
			     });
			    selectLog();
	        });
	        //查询日志
	        function selectLog(){
	        	var name = $("#name").val();
	            var userType_id = $("#userType_id").val();
	            if(userType_id==null || userType_id==undefined){
	               userType_id=0;
	            }
				// 显示加载页面
				var loadIndex = layer.load(0, {
					shade : 0.3
				}); // 0代表加载的风格，支持0-2
				$.ajax({
					type : 'post',
					// 可选get
					url : "${ctx}/user/selectLog.do",
					// 这里是接收数据的PHP程序
					data : {
						name : name,
						userType_id : userType_id
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
						logTable(data.data);
						printdata=data.data;
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
	        var ins;
	        function logTable(data){
			 // 执行渲染
			ins=table.render({
						elem : '#logTable',
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
									title : '用户名称',
									 width : 140,
								}, {
									field : 'usertype',
									title : '用户类型',
									 width : 140,

								}, {
									field : 'opertype',
									title : '操作类型',

								}, {
									field : 'IP',
									title : 'IP',
									width : 120,
								}
								, {
									field : 'opertimeStr',
									title : '操作时间',
									width : 180,
								}
								 ] ] // 设置表头
						,
						limit : data.length
					});
			}
		function printdrugstock(printdata) {
 			table.exportFile(ins.config.id, printdata);
 			$.post("${ctx}/user/insertLog.do",{operType:"导出操作日志信息"},function(){});
		}
	 </script>
  </body>
</html>
