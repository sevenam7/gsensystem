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
    
    <title>历年真题</title>
    
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
    
    </style>
  </head>
  
  <body style="max-height: 100%">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">   
         <legend>历年真题信息</legend> 
      </fieldset>
	  <input type="hidden" id="path" value="${ctx}">
	  <div id="operationDIV" ontouchstart style="position:absolute ;left:0px;right:0px;top:58px;margin-bottom:10px;">
		 <form class="layui-form">
			<div class="layui-row">
				<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3" >
					<label class="layui-form-label">试卷名称 </label>
					<div class="layui-input-inline" >
						<input type="text" style="font-size:10px;"
							autocomplete="off" placeholder="请输入试卷名称" id="papername"
							class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
					<label class="layui-form-label">试卷类型</label>
					<div class="layui-input-inline" style="width: 165px;">
						<select name="papertypeId" id="papertypeId" lay-verify="required" lay-search="">
						    <option value="0">---请选择---</option>
						    <c:forEach items="${papertypeList}" var="papertypeList">
								<option value="${papertypeList.papertypeId}">${papertypeList.papertype}</option>
						    </c:forEach>
						</select>
					</div>
				</div>
				<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
					<label class="layui-form-label">学科</label>
					<div class="layui-input-inline" style="width: 165px;">
						<select name="subjectId" id="subjectId" lay-verify="required" lay-search="">
						    <option value="0">---请选择---</option>
						    <c:forEach items="${subjectList}" var="subjectList">
								<option value="${subjectList.subjectId}">${subjectList.subject}</option>
						    </c:forEach>
						</select>
					</div>
				</div>
				<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
					<input class="layui-btn" value="查询" type="button"
						style="float:left;margin-left: 20px;" onclick="selectYear()">
					<input class="layui-btn layui-btn-normal" value="新增" type="button"
						style="float:left;margin-left: 20px;" onclick="insertYearView()">
				</div>
			</div>
		</form>
	 </div>
	 <div id="tableDiv" style="margin-left: 20px;margin-top: 60px;margin-right: 30px;">
		 <table id="yearTable" lay-filter="tableYear"></table>
	 </div>
	 
	 <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
       <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除</a> 
	 </script>
	 <script>
	      layui.use([ 'form','laypage','table'], function(){
	            form = layui.form;
                laypage = layui.laypage;
                table = layui.table;
                 
                 // 监听行工具事件
                 table.on('tool(tableYear)', function(obj){
                     var data = obj.data;
                     if (obj.event == 'delete') { // 删除
					     deletePaper(data);
				     }else if(obj.event == 'edit'){//修改
				         updateYearView(data);
				     }
                 });
                 
                 selectYear();  
	      });// layui.use
	      
	      //查询试卷
	      function selectYear(){
	           var papername=$("#papername").val();
		    var papertypeId=$("#papertypeId").val();
		    var subjectId=$("#subjectId").val();
		      // 显示加载页面
			var loadIndex = layer.load(0, {
				shade : 0.3
			}); // 0代表加载的风格，支持0-2
			$.ajax({
			    type : 'post',
				// 可选get
				url :  "${ctx}/yearTtruth/selectPaper.do",
				// 这里是接收数据的PHP程序
				data : {
					papername : papername,
					papertypeId : papertypeId,
					subjectId : subjectId
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
					yearTable(data.data);
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
	      //试卷渲染
		function yearTable(data){
		     // 执行渲染
			table.render({
						elem : '#yearTable',
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
									field : 'papername',
									title : '试卷名称',
								}, {
									field : 'papertype',
									title : '试卷类型',
								}, {
									field : 'gradename',
									title : '年级',
									width : 76,
								}, {
									field : 'subject',
									title : '学科',
									width : 76,
								},{
									field : 'creationTime',
									title : '创建时间',
									width : 180,
								}, {
									field : 'enablebit',
									title : '状态',
									width : 76,
                                    templet : function(d) {
                                        if(d.enablebit==0){
                                             return '<button type="button" class="layui-btn layui-btn-xs layui-btn-warm">未发布</button>';
                                        }else{
                                             return '<button type="button" class="layui-btn layui-btn-xs layui-btn-warm">已发布</button>';
                                        }
									}
								}, {
									fixed : 'right',
									title : '操作',
									width : 112,
									toolbar : '#barDemo'

								} ] ] // 设置表头
						,
						limit : data.length
					});
		}
		//to新增页面
		function insertYearView(){
		      window.location.href = "${ctx}/yearTtruth/insertYearView.do";
		}
		//删除试卷
		function deletePaper(data){
		    if(data.enablebit==1){
		         layer.msg("已经发布的试卷不能进行删除");
		         return false;
		    }else{
		          // 询问框
			layer.confirm('是否删除这条试卷信息?', {
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
						url : '${ctx}/yearTtruth/delectPaper.do',
						// 这里是接收数据的PHP程序
						data : {
							papername : data.papername
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
								selectYear(); // 刷新查询
								$.post("${ctx}/user/insertLog.do",{operType:"删除历年真题信息"},function(){});
							} else {
								layer.msg(data.msg);
							}
						}
					});
				});
		    }
		}
			//to修改试卷页面
			function updateYearView(data){
// 			     if(data.enablebit==1){
// 			          layer.msg("已经发布的试卷不能进行修改");
// 		              return false;
// 			     }else{
			       
// 			     }
			      window.location.href = "${ctx}/yearTtruth/updateYearView.do?paperId="+data.papeId;
			}
		</script>
  </body>
</html>
