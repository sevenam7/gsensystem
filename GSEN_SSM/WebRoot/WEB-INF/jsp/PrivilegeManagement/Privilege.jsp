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
    
    <title>权限管理</title>
    
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
         <legend>权限管理信息</legend> 
      </fieldset>
      <input type="hidden" id="path" value="${ctx}">
	  <div id="operationDIV" ontouchstart style="position:absolute ;left:0px;right:0px;top:58px;margin-bottom:10px;">
		 <form class="layui-form">
			<div class="layui-row">
				<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
					<label class="layui-form-label">用户类型 </label>
					<div class="layui-input-block" >
						<select name="userType_id" id="userType_id">
							
						</select>
					</div>
				</div>
				<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
					<label class="layui-form-label">创建时间</label>
					<div class="layui-input-inline" style="width: 172px;">
						<input type="text" class="layui-input" id="creationTime"
							placeholder=" - " style="font-size: 10px;">
					</div>
				</div>
				<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
					<input class="layui-btn" value="查询" type="button"
						style="float:left;margin-left: 40px;" onclick="selectPrivilege()">
					<input class="layui-btn layui-btn-normal" value="新增" type="button"
						style="float:left;" onclick="insertUserType()">
				</div>
			</div>
		</form>
	 </div>
	 <div id="tableDiv" style="margin-left: 20px;margin-top: 60px;margin-right: 30px;">
		 <table id="privilegeTable" lay-filter="tablePrivilege"></table>
	 </div>

	 <script>
	        layui.use([ 'form', 'table', 'laypage','laydate'], function(){
	              form = layui.form;
			      table = layui.table;
			      laypage = layui.laypage;
			      laydate = layui.laydate;
                    //日期时间
		     laydate.render({
			    elem : '#creationTime',
			    range: true//范围
		     });
                   // 监听行工具事件
			     table.on('tool(tablePrivilege)', function(obj){
			        var data = obj.data;
			        if (obj.event == 'delete') { // 删除
					   deleteUserType(data);
				    }else if(obj.event == 'enable'){//启用否
				       enableUserType(data);
				    }else if(obj.event == 'edit'){//修改
				       editView(data);
				    }
			     });
                  
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
			    selectPrivilege();
	        });
	         //查询用户类型
	        function selectPrivilege(){
	            var userType_id = $("#userType_id").val();
	            var dateTimeRange = $("#creationTime").val();
				var division;
				var startTime;
				var endTime;
				if (dateTimeRange != "") {
					division = dateTimeRange.split(" - ");
					startTime = division[0];
					endTime = division[1];
				}
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
					url : "${ctx}/privilege/selectPrivilege.do",
					// 这里是接收数据的PHP程序
					data : {
						userType_id : userType_id,
						startTime : startTime,
						endTime : endTime
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
									field : 'usertype',
									title : '用户类型',

								},{
									field : 'remarks',
									title : '备注',

								} ,{
									field : 'enabledbit',
									title : '状态',
									width : 80,
                                    templet : function(d) {
                                        if(d.enabledbit==1){
                                             return '<button type="button" class="layui-btn layui-btn-xs layui-btn-warm">已启用</button>';
                                        }else{
                                             return '<button type="button" class="layui-btn layui-btn-xs layui-btn-danger">未启用</button>';
                                        }
									}
								}, 
								, {
									field : 'creationtimeStr',
									title : '创建时间',
									width : 172,
								}, {
									fixed : 'right',
									title : '操作',
									width : 180,
									templet : function(d) {
                                        if(d.enabledbit==1){//1是已启用 2是未启用
                                             return '<button type="button" class="layui-btn layui-btn-sm " lay-event="edit">修改</button>'+
                                             '<button type="button" class="layui-btn layui-btn-sm layui-btn-warm" lay-event="enable">禁用</button>';
                                        }else{
                                             return '<button type="button" class="layui-btn layui-btn-sm" lay-event="edit">修改</button>'+
                                             '<button type="button" class="layui-btn layui-btn-sm layui-btn-normal" lay-event="enable">启用</button>'+
                                             '<button type="button" class="layui-btn layui-btn-sm layui-btn-danger" lay-event="delete">删除</button>';
                                        }
									}

								}
								 ] ] // 设置表头
						,
						limit : data.length
					});
			}
			//to新增用户类型页面
			function insertUserType(){
			     window.location.href = "${ctx}/privilege/insertUserTypeView.do";
			}
			//删除
			function deleteUserType(data){
			    layer.confirm('是否删除这条用户类型?', {
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
							$.post("${ctx}/privilege/deleteUserType.do",{
	                               usertypeId:data.usertypeId
	                            },function(data){
	                            if(data.state == 'ok'){
	                                layer.msg(data.msg,{icon:1,time:1000});
	                                selectPrivilege(); // 刷新查询
	                                $.post("${ctx}/user/insertLog.do",{operType:"删除用户类型信息"},function(){});
	                            }else{
	                                layer.msg(data.msg,{icon:2,time:1000});
	                            }
	                        });
						});
			}
			//启用否
			function enableUserType(data){
			    $.post("${ctx}/privilege/enableUserType.do",{ usertypeId:data.usertypeId },function(data){
	                     if(data.state == 'ok'){
	                            layer.msg(data.msg,{icon:1,time:1000});
	                            selectPrivilege(); // 刷新查询
	                            $.post("${ctx}/user/insertLog.do",{operType:"修改用户类型的启用否"},function(){});
	                      }else{
	                            layer.msg(data.msg,{icon:2,time:1000});
	                      }
	             });
			}
			//to修改用户类型页面
			function editView(data){
			    if(data.enabledbit==1){
			          layer.msg("已启用的用户类型不能进行修改",{icon:2,time:1000});
			          return false;
			    }else{
			        window.location.href = "${ctx}/privilege/editUserTypeView.do?usertypeId="+data.usertypeId;
			    }
			}
	 </script>
  </body>
</html>
