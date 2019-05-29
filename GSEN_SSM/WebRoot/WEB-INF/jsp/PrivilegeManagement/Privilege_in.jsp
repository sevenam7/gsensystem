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
    
    <title>My JSP 'Privilege_in.jsp' starting page</title>
    
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
        .c-red{
         color: red;
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
    .layui-table-cell{
       text-align: center;
    }
    .layui-table-view{
    width:803px;
    margin-left: 108px;
    }
    </style>
  </head>
  
  <body>
      <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">   
         <legend>新增用户类型</legend> 
      </fieldset>
	<div class="layui-form-item">
		<label class="layui-form-label"><span class="c-red">*</span>用户类型 </label>
		<div class="layui-input-inline" style="width:200px;">
			<input type="text" id="usertype" autocomplete="off" placeholder="请输入用户类型名称" class="layui-input">
		</div>
		<label class="layui-form-label">备注</label>
		<div class="layui-input-inline" style="width:430px;">
			<input type="text" id="remarks" autocomplete="off" placeholder="请输入备注" class="layui-input">
		</div>
		<input class="layui-btn" value="保存" type="button"
			style="float:left;margin-left: 28px;" onclick="saveUserType()">
		 <input class="layui-btn layui-btn-normal" value="重置" type="button"
			style="float:left;" onclick="reset1()">
		 <input class="layui-btn layui-btn-primary" value="关闭" type="button"
			style="float:left;" id="close1" onclick="javascript :history.back(-1);">
	</div>
	<div class="layui-row" style="padding: 0 35px;">
		<div class="layui-col-xs6">
			<p class="papeContent">新增权限</p>
		</div>
		<hr class="layui-bg-gray" style="margin:4 0;">
		<div id="tableDiv" style="margin-left: 20px;margin-top: 10px;margin-right: 30px;">
		    <table id="privilegeTable" lay-filter="tablePrivilege"></table>
	    </div>
	</div>
	
	<script>
	      var arrPrivilege = new Array;//权限
	      layui.use([ 'form', 'table', 'laypage'], function(){
	              form = layui.form;
			      table = layui.table;
			      laypage = layui.laypage;
			      int=0;
			      //监听操作
               form.on('checkbox(lockDemo)', function(obj){
                   //layer.tips(this.value + ' ' + this.name + '：'+ obj.elem.checked, obj.othis);
                    var id=obj.elem.id;
                    var index=id.substr(id.length-1,1);//1-管理员信息 2-老师管理 3-学生管理 4-权限管理 5-教育资讯 6-历年真题 7-评价管理 8-日志管理
                    var isenable= obj.elem.checked;
                    var privilege="";
                    if(isenable==true){
                         if(id.indexOf("read")!=-1){//判断是读
                            privilege="r";
                         }else if(id.indexOf("write")!=-1){//判断是写
                            privilege="w";
                         }
                         arrPrivilege.push([index,privilege]);
                    }else{
                         for ( var i = 0; i < arrPrivilege.length; i++) {
							if(arrPrivilege[i][0]==index){
							    if(id.indexOf("read")!=-1){
                                    if(arrPrivilege[i][1]=="r"){//判断是读
                                        arrPrivilege.splice(i,1);
                                    }
                                }else if(id.indexOf("write")!=-1){
                                     if(arrPrivilege[i][1]=="w"){//判断是写
                                        arrPrivilege.splice(i,1);
                                    }
                                }
							} 
						}
                    }
               });
                
			    selectPrivilege();
	        });
	        function selectPrivilege(){
				// 显示加载页面
				var loadIndex = layer.load(0, {
					shade : 0.3
				}); // 0代表加载的风格，支持0-2
				$.ajax({
					type : 'post',
					// 可选get
					url : "${ctx}/privilege/insertPrivilege.do",
					// 这里是接收数据的PHP程序
					data : {
						
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
						privilegeTable(data.data);
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
	        var int=0;
	        function privilegeTable(data){
			 // 执行渲染
			table.render({
						elem : '#privilegeTable',
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
									field : 'modulename',
									title : '模块名称',
									 width : 400,
								}, {
									fixed : 'right',
									title : '操作',
									width : 400,
									templet : function(d) {
									    int++;
									    return '<input type="checkbox" name="like[read]" id="read'+int+'" title="读" lay-filter="lockDemo">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'+
									    '<input type="checkbox" name="like[write]" id="write'+int+'" title="写" lay-filter="lockDemo">';
									}

								}
								 ] ] // 设置表头
						,
						limit : data.length
					});
			}
			//新增保存
			function saveUserType(){
			    var usertype=$("#usertype").val();
			    var remarks=$("#remarks").val();
			    if(usertype==null || usertype==""){
			          layer.msg("用户类型名称不能为空，请输入");
				      return false; 
			    }else {
					$.post("${ctx}/privilege/savePrivilege.do?arrPrivilege="+arrPrivilege,{
	                        usertype:usertype,
							remarks:remarks
	                  },function(data){
	                       if(data.state == 'ok'){
	                            layer.msg(data.msg,{icon:1,time:1000});
	                            setTimeout('window.history.back(-1)', 1000);
	                            selectPrivilege(); // 刷新查询
	                            $.post("${ctx}/user/insertLog.do",{operType:"新增权限信息"},function(){});
	                       }else{
	                           layer.msg(data.msg,{icon:2,time:1000});
	                       }
	                  });
			    }
			}
			function reset1(){
			     arrPrivilege.splice(0,arrPrivilege.length);
			     location = location;
			}
	</script>
</body>
</html>
