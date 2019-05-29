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
    
    <title>My JSP 'AdministratorInfor.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="${ctx}/common/layuis/css/layui.css"type="text/css"></link>
    <style type="text/css">
    #table .layui-table-cell {
	   height: auto;
	   line-height: 28px;
    }

    #rolediv .layui-form-select dl {
	   max-height: 150px;
    }

     #rolediv .layui-anim-upbit {
	     top: -150px;
     } 
     
     #style1{
         margin-bottom: 14px;
         margin-right: 0px;
     }
     #style2{
        width:280px;
     }
     .pId{
        width:100%;line-height: 40px;
     }
     #style2{
        width:281px;
     }
     .detailMargin{
         margin-left:50px;
     }
     
     .img_table {
	width: 210px;
	float: right;	
	margin-right: 3%;
	height: 260px;
/* 	border: 1px solid #ccc; */
	overflow: hidden;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

.tab_page {
	line-height: 25px;
	text-align: center;
	width: 100%;
    height: 27px;
     background-image: linear-gradient(to bottom,#ffffff,#e6e6e6); /* 21e8db  009688*/ 
/*     border-bottom: 3px solid #70A9F1; */
}

.uploadBtn {
	position: relative;
	top: 90px;
	/* right: -100px; */
	 background-color: #009688;
    border: 4px solid #009688;
    color: white;
    border-radius: 6%;
    cursor:pointer;
    margin: 0 auto;
}

.delBtn {
	position: relative;
	top: 90px;
	/* right: -100px; */
	 background-color: #009688;
    border: 4px solid #009688;
    color: white;
    border-radius: 6%;
    cursor:pointer;
}
 .c-red{
           color:red;
        }
</style>
  </head>
  
  <body style="max-height: 100%">
<!--     <div style="margin: 10px 20px;font-size: 18px;">管理员信息</div> -->
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">   
         <legend>管理员信息</legend> 
    </fieldset>
	<input type="hidden" id="path" value="${ctx}">
	<div id="operationDIV" ontouchstart style="position:absolute ;left:0px;right:0px;top:58px;margin-bottom:10px;">
		<form class="layui-form">
			<div class="layui-row">
				<div class="layui-col-xs4 layui-col-sm6 layui-col-md3 layui-col-lg3" >
					<label class="layui-form-label">用户账号 </label>
					<div class="layui-input-inline" >
						<input type="text" name="account" style="font-size:10px;"
							autocomplete="off" placeholder="请输入用户账号" id="Saccount"
							class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs4 layui-col-sm6 layui-col-md3 layui-col-lg3">
					<label class="layui-form-label">用户名称</label>
					<div class="layui-input-inline">
						<input type="text" name="name" style="font-size:10px;"
							autocomplete="off" placeholder="请输入用户名称" id="Sname"
							class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs4 layui-col-sm6 layui-col-md3 layui-col-lg3">
					<label class="layui-form-label">用户地址</label>
					<div class="layui-input-inline">
						<input type="text" name="address" style="font-size:10px;"
							autocomplete="off" placeholder="请输入用户地址" id="Saddress"
							class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs4 layui-col-sm6 layui-col-md3 layui-col-lg3">
					<input class="layui-btn" value="查询" type="button"
						style="float:left;margin-left: 20px;" onclick="selectAdmin()">
					<input class="layui-btn layui-btn-normal" value="新增" type="button"
						style="float:left;margin-left: 20px;" onclick="InsertUser()">
				</div>
			</div>
		</form>
	</div>
	<div id="table" style="margin-left: 20px;margin-top: 60px;margin-right: 30px;">
		<table id="UserTable" lay-filter="TableUser"></table>
	</div>
    

    <!--详情-->
	<div id="divUserDetail" style="display:none;">
		<div style="width: 100%;max-width: 100%;overflow: auto;position: absolute;top: 10px;bottom: 0px;left: 0px;right: 0px;">
			<div class="layui-form" style="padding: 30px">
				<div class="layui-row">
					<div class="layui-col-md4">
						<div class="img_table">
							<div class="info_table_container" id="containerDiv3">
								<div id="show_img3" name="productImg" class="img_div" style="width: 200px;height: 230px;">
<!-- 								     <input type="text" style="display:none;"  name="userFile" id="userFile">  -->
								</div>
							</div>
						</div>
					</div>
					<div class="layui-col-md8">
						<div class="layui-form-item">
							<input type="hidden" name="userId" id="userIdD">
							<div class="layui-inline detailMargin" id="style1">
								<label class="layui-form-label">用户账号：</label>
								<div class="layui-input-inline " id="style3">
                                       <p id="accountD" name="account" class="pId"></p>
								</div>
							</div>
							<div class="layui-inline"  id="style1" >
								<label class="layui-form-label">用户类型：</label>
								<div class="layui-input-inline"  id="style3">
									<p class="pId" id="usertypeD" name="usertype"></p>
								</div>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-inline detailMargin"  id="style1">
								<label class="layui-form-label">用户昵称：</label>
								<div class="layui-input-inline"  id="style3">
									<p class="pId" id="nicknameD" name="nickname"></p>
								</div>
							</div>
							<div class="layui-inline"  id="style1">
								<label class="layui-form-label">用户姓名：</label>
								<div class="layui-input-inline"  id="style3">
									<p class="pId" id="nameD" name="name"></p>
								</div>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-inline detailMargin"  id="style1">
								<label class="layui-form-label">性别：</label>
								<div class="layui-input-inline"  id="style3">
									<p class="pId" id="sexD" name="sex"></p>
								</div>
							</div>
							<div class="layui-inline"  id="style1">
								<label class="layui-form-label">手机号码：</label>
								<div class="layui-input-inline"  id="style3">
									<p class="pId" id="phoneNumberD" name="phoneNumber"></p>
								</div>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-inline detailMargin" id="style1">
								<label class="layui-form-label">微信：</label>
								<div class="layui-input-inline" id="style3">
									<p class="pId" id="wechatD" name="wechat"></p>
								</div>
							</div>
							<div class="layui-inline" id="style1">
								<label class="layui-form-label">是否启用：</label>
								<div class="layui-input-inline" id="style3">
									<p class="pId" id="enabledBitD" name="enabledBit"></p>
								</div>
							</div>

						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
				    <div class="layui-inline" id="style1" style="margin-left:175px;">
						<label class="layui-form-label">登录次数：</label>
						<div class="layui-input-inline" id="style3">
							<p class="pId" id="loginNumberD" name="loginNumber"></p>
						</div>
					</div>
					<div class="layui-inline" id="style1"style="margin-left: -70px;">
						<label class="layui-form-label">创建时间：</label>
						<div class="layui-input-inline" id="style3">
							<p class="pId" id="creationTimeD" name="creationTime"></p>
						</div>
					</div>
					<div class="layui-inline" id="style1">
						<label class="layui-form-label">邮箱地址：</label>
						<div class="layui-input-inline" id="style3">
							<p class="pId" id="mailboxaddressD" name="mailboxaddress"></p>
						</div>
					</div>
				</div>
				<div class="layui-form-item">
				    <div class="layui-inline" id="style1" style="margin-left:175px;">
						<label class="layui-form-label">家庭地址：</label>
						<div class="layui-input-inline" id="style3">
							<p class="pId" id="addressD" name="address"></p>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
    
    <!--新增-->
	<div id="divIUser" style="display:none;" >
	   <form class="layui-form" id="formreset" enctype="multipart/form-data">
	        <div style="width: 100%;max-width: 100%;overflow: auto;position: absolute;top: 10px;bottom: 0px;left: 0px;right: 0px;" >
			<div class="layui-form" style="padding: 2px" >
				<div class="layui-row"style="margin-top:25px;" >
					<div class="layui-col-md2"style="margin-left:70px;">
						<div class="img_table">
<!-- 							<div class="tab_page"> -->
<!-- 								<span class="product_img">个人图片</span> -->
<!-- 							</div> -->
							<div class="info_table_container" id="containerDiv">
								<input type="file" id="upload" name="upfile" style="display:none;"> 
									<input type="button" class="nav_btn table_nav_btn delBtn" id="delBtn"
									 value="删除图片" style="display: none;">
								<div id="show_img" name="productImg" class="img_div"></div>
							</div>
							<input type="button" class="nav_btn table_nav_btn uploadBtn" id="addBtn" value="上传图片" />
						</div>
						
					</div>
					<div class="layui-col-md9" style="margin-left: 15px">
					    <div class="layui-form-item ">
							<div class="layui-inline " id="style1">
								<label class="layui-form-label"><span class="c-red">*</span>用户账号</label>
								<div class="layui-input-inline " id="style2">
                                      <input type="text" name="account" id="Iaccount"autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-inline"  id="style1">
								<label class="layui-form-label"><span class="c-red">*</span>用户类型</label>
								<div class="layui-input-block" id="style2">
									<select name=userType_id id="IusertypeId">
									
									</select>
								</div>
							</div>
						</div>
						<div class="layui-form-item ">
						    <div class="layui-inline"  id="style1">
								<label class="layui-form-label"><span class="c-red">*</span>用户姓名</label>
								<div class="layui-input-inline"  id="style2">
										<input type="text" autocomplete="off" class="layui-input"
										name="name" id="Iname">
								</div>
							</div>
							<div class="layui-inline"  id="style1">
								<label class="layui-form-label">用户昵称</label>
								<div class="layui-input-inline"  id="style2">
										<input type="text" autocomplete="off" class="layui-input"
										name="nickname" id="Inickname">
								</div>
							</div>
						</div>
						<div class="layui-form-item ">
							<div class="layui-inline"  id="style1">
								<label class="layui-form-label"><span class="c-red">*</span>密码</label>
								<div class="layui-input-inline"  id="style2">
										<input type="password" autocomplete="off" class="layui-input"
										name="password" id="Ipassword">	
								</div>
							</div>
							<div class="layui-inline"  id="style1">
								<label class="layui-form-label"><span class="c-red">*</span>确认密码</label>
								<div class="layui-input-inline"  id="style2">
										<input type="password" autocomplete="off" class="layui-input"
										name="password1" id="Ipassword1">
								</div>
							</div>
						</div>
						<div class="layui-form-item ">
							<div class="layui-inline"  id="style1">
								<label class="layui-form-label">微信</label>
								<div class="layui-input-inline"  id="style2">
											<input type="text" autocomplete="off" class="layui-input"
										name="wechat" id="Iwechat" onchange="verifyWeChat(this)">	
								</div>
							</div>
							<div class="layui-inline"  id="style1">
								<label class="layui-form-label"><span class="c-red">*</span>手机号码</label>
								<div class="layui-input-inline"  id="style2">
										<input type="text" autocomplete="off" class="layui-input"
										name="phoneNumber" id="IphoneNumber" onchange="verifyPhone(this)">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="layui-row ">
				     <div class="layui-inline" >
						<label class="layui-form-label">性别</label>
						<div class="layui-input-block" >
							<input type="radio" name="sex" value="男" title="男" checked="">
							<input type="radio" name="sex" value="女" title="女">
						</div>
					</div>
					<div class="layui-inline " style="margin-left:33px;">
						<label class="layui-form-label">邮箱地址</label>
						<div class="layui-input-inline" id="style2">
							<input type="text" autocomplete="off" class="layui-input"
										name="mailboxaddress" id="Imailboxaddress" onchange="verifyPostbox(this)">
						</div>
					</div>
					<div class="layui-inline"  style="margin-left:10px;">
						<label class="layui-form-label">地址</label>
						<div class="layui-input-inline" id="style2">
							<input type="text" autocomplete="off" class="layui-input"
										name="address" id="Iaddress">
						</div>
					</div>
				</div>
				<div class="layui-row" style="margin-top:25px;">
					<div class="layui-col-md1 layui-col-md-offset5">
						 <button class="layui-btn" lay-filter="insertSave"lay-submit="" >确认保存</button>
					</div>
					<div class="layui-col-md1"style="margin-left:20px;">
						<button type="reset" class="layui-btn layui-btn-primary" onclick="Ireset()">重置</button>
					</div>
				</div>
			</div>
		</div>
	   </form>
	</div>
	
	 <!--修改-->
	<div id="divEUser" style="display:none;">
	   <form class="layui-form" id="formUpdate" enctype="multipart/form-data">
	        <div style="width: 100%;max-width: 100%;overflow: auto;position: absolute;top: 10px;bottom: 0px;left: 0px;right: 0px;" >
			<div class="layui-form" style="padding: 2px" >
				<div class="layui-row"style="margin-top:25px;" >
					<div class="layui-col-md2"style="margin-left:70px;">
						<div class="img_table">
							<div class="info_table_container" id="containerDiv2">
								<input type="file" id="upload2" name="upfile" style="display:none;"> 
									<input type="button" class="nav_btn table_nav_btn delBtn" id="delBtn2"
									 value="删除图片" style="display: none;">
								<div id="show_img2" name="productImg" class="img_div" >
								     <input type="text" style="display:none;"  name="userFile" id="userFile"> 
								</div>
							</div>
							<input type="button" class="nav_btn table_nav_btn uploadBtn" id="addBtn2" value="上传图片" />
						</div>
					</div>
					<div class="layui-col-md9" style="margin-left: 15px">
					    <div class="layui-form-item ">
					        <input type="hidden" name="userId" id="userIdU">
							<div class="layui-inline " id="style1">
								<label class="layui-form-label">用户账号</label>
								<div class="layui-input-inline " id="style2">
                                      <input type="text" name="account" id="Uaccount"autocomplete="off" class="layui-input" readonly="readonly">
								</div>
							</div>
							<div class="layui-inline"  id="style1">
								<label class="layui-form-label"><span class="c-red">*</span>用户类型</label>
								<div class="layui-input-block" id="style2">
									<select name=userType_id id="UusertypeId">

									</select>
								</div>
							</div>
						</div>
						<div class="layui-form-item">
						    <div class="layui-inline"  id="style1">
								<label class="layui-form-label"><span class="c-red">*</span>用户姓名</label>
								<div class="layui-input-inline"  id="style2">
										<input type="text" autocomplete="off" class="layui-input"
										name="name" id="Uname">
								</div>
							</div>
							<div class="layui-inline"  id="style1">
								<label class="layui-form-label">用户昵称</label>
								<div class="layui-input-inline"  id="style2">
										<input type="text" autocomplete="off" class="layui-input"
										name="nickname" id="Unickname">
								</div>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-inline"  id="style1">
								<label class="layui-form-label">微信</label>
								<div class="layui-input-inline"  id="style2">
											<input type="text" autocomplete="off" class="layui-input"
										name="wechat" id="Uwechat" onchange="verifyWeChat(this)">	
								</div>
							</div>
							<div class="layui-inline"  id="style1">
								<label class="layui-form-label"><span class="c-red">*</span>手机号码</label>
								<div class="layui-input-inline"  id="style2">
										<input type="text" autocomplete="off" class="layui-input"
										name="phoneNumber" id="UphoneNumber" onchange="verifyPhone(this)">
								</div>
							</div>
						</div>
						<div class="layui-form-item"  action="">
							 <div class="layui-inline "  id="style1">
								<label class="layui-form-label">邮箱地址</label>
								<div class="layui-input-inline"  id="style2">
								   <input type="text" autocomplete="off" class="layui-input"
										name="mailboxaddress" id="Umailboxaddress" onchange="verifyPostbox(this)">	
								</div>
							 </div>
							 <div class="layui-inline" id="style1">
									<label class="layui-form-label">性别</label>
									<div class="layui-input-block " id="style2" >
										<input type="radio" id="Uradio1" name="sex" value="男" title="男" >
										<input type="radio" id="Uradio2" name="sex" value="女" title="女">
									</div>
							 </div>
						</div>
					 </div>
					</div>
				</div>
				<div class="layui-row ">
					<div class="layui-form-item" style="margin-left: 58px;">
						<label class="layui-form-label">地址</label>
						<div class="layui-input-block">
							<input type="text"  autocomplete="off" class="layui-input" 
							name="address" id="Uaddress" style="width: 92%">
						</div>
					</div>
					<div class="layui-row" style="margin-top:25px;">
						<div class="layui-col-md1 layui-col-md-offset5">
							<button class="layui-btn" lay-filter="updateSave" lay-submit="">确认保存</button>
						</div>
						<div class="layui-col-md1" style="margin-left:20px;">
							<button type="reset" class="layui-btn layui-btn-primary"
								onclick="Ureset()">重置</button>
						</div>
					</div>
			    </div>
		</div>
	   </form>
	</div>
    
    <script type="text/javascript" src="${ctx}/common/layuis/layui.js"></script>
	 <script type="text/javascript" src="${ctx}/common/js/jquery-2.0.3.min.js"></script>
	<script type="text/javascript" src="${ctx}/common/js/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx}/common/js/verification.js"></script>
	
	<script type="text/html" id="barUserDemo">
       <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="detail">详情</a>    
       <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
       <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除</a>      
	</script>
	<script>
		var ctx = $("#path").val();
		var from, table, laypage,upload;
		var opType = '0'; // 1=新增，2=修改
		var deletePicNo='0';
		layui.use([ 'form', 'table', 'laypage', 'upload' ], function() {
			form = layui.form;
			table = layui.table;
			laypage = layui.laypage;
            upload = layui.upload;
            
            // 监听提交
		    form.on('submit(insertSave)', function(data) {
				insertSave(data);//新增保存
				return false;
			});
			form.on('submit(updateSave)', function(data) {
				updateSave(data);//修改保存
				return false;
			});

			// 监听行工具事件
			table.on('tool(TableUser)', function(obj) {
				var data = obj.data;
				//console.log(data);
				if (obj.event === 'detail') { // 详情
					userDetail(data);
				}else if(obj.event === 'delete'){//删除
				 //   console.log(data.account);
		            if (data.account != "") {
						// 询问框
						layer.confirm('是否删除这条管理员信息?', {
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
								url : ctx + '/user/delectAdmin.do',
								// 这里是接收数据的PHP程序
								data : {
									account : data.account
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
										selectAdmin(); // 刷新查询
										$.post("${ctx}/user/insertLog.do",{operType:"删除管理员信息"},function(){});
									} else {
										layer.msg(data.msg);
									}
								}
							});
						});
					} else {
						myMsg("未检测到选中的数据！");
					}
				}else if(obj.event === 'edit'){//修改
				    userEditView(data);
				}

			});
			selectAdmin();

		})//layui.use

		// 查询管理员
		function selectAdmin() {
			var Saccount = $("#Saccount").val(); // 用户账号
			var Sname = $("#Sname").val(); // 用户名称
			var Saddress = $("#Saddress").val(); // 用户地址
			// 显示加载页面
			var loadIndex = layer.load(0, {
				shade : 0.3
			}); // 0代表加载的风格，支持0-2
			$.ajax({
				type : 'post',
				// 可选get
				url : ctx + "/user/selectAdminALL.do",
				// 这里是接收数据的PHP程序
				data : {
					account : Saccount,
					name : Sname,
					address : Saddress
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
					UserTable(data.data);

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

		// 用户渲染
		function UserTable(data) {
			// 执行渲染
			table
					.render({
						elem : '#UserTable',
						// 指定原始表格元素选择器（推荐id选择器）
						data : data,
						page : { // 支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
							layout : [ 'count', 'prev', 'page', 'next',
									'limit', 'refresh', 'skip' ],
							// 自定义分页布局
							limit : 10,
							limits : [ 1, 2, 3, 5, 10, 15, 20, 30, 40, 50, 100,
									150, 200 ],
							groups : 5
						// 只显示 1 个连续页码
						},
						cols : [ [

								{
									field : 'picture',
									title : '用户头像',
									height : 80,
									align : 'center',
									templet : function(d) {
										return '<div><img src="${ctx}/user/getImg.do?file='
												+ d.picture
												+ '"   width="45px" height="50px"onclick="OpenPhysicalPhotoContract_Contract(\''
												+ d.picture + '\')" ></div>';
// 												alt="'
// 												+ d.picture //没有图片时显示图片的路径
// 												+ '"
									}

								}, {
									field : 'account',
									title : '用户账号',

								}, {
									field : 'name',
									title : '用户名称',

								}, {
									field : 'usertype',
									title : '用户类型',

								}, {
									field : 'sex',
									title : '性别',

								}, {
									field : 'loginNumber',
									title : '登录次数',

								}, {
									field : 'mailboxaddress',
									title : '邮箱地址',

								}, {
									field : 'address',
									title : '地址',

								}, {
									fixed : 'right',
									title : '操作',
									width : 160,
									toolbar : '#barUserDemo'

								} ] ] // 设置表头
						,
						limit : data.length
					});
		}
		// 预览图片
		function OpenPhysicalPhotoContract_Contract(src) {
			layer.open({
				title : '头像预览',
				type : 1,
				area : [ '38%', '80%' ],
				content : '<img src="${ctx}/user/getImg.do?file=' + src
						+ '" style="width:100%;height:100%"/>'
			})
		}

		// 详情弹窗管理员
		var userDetailView;
		function userDetail(data) {
			$("#userIdD").val(data.userId);
			$("#accountD").text(data.account);
			$("#usertypeD").text(data.usertype);
			$("#nicknameD").text(data.nickname);
			$("#nameD").text(data.name);
			$("#sexD").text(data.sex);
			$("#phoneNumberD").text(data.phoneNumber);
			$("#wechatD").text(data.wechat);
			$("#mailboxaddressD").text(data.mailboxaddress);
			$("#addressD").text(data.address);
			if(data.enabledBit==1){
			    $("#enabledBitD").text("已启用");
			}else{
			    $("#enabledBitD").text("未启用");
			}
			$("#loginNumberD").text(data.loginNumber);
			$("#creationTimeD").text(data.creationTimeStr);
			$('#show_img3').find("img").remove();
			if(data.picture==null || data.picture==""){
			     $('#show_img3').val('<label class="layui-form-label">登录次数：</label>');
			}else{
			  $('#show_img3').append('<img src="${ctx}/user/getImg.do?file=' + data.picture + '" style="width: 200px;height: 230px;"/>');
			}
			
			userDetailView = layer.open({
				type : 1,
				// area : [ '500px', '300px' ],
				content : $('#divUserDetail'),
				title : "管理员详情信息"
			});
			layer.full(userDetailView); // 最大化
		}

		//重置
		function Ireset() {
			$("#formreset")[0].reset();
			$("#addBtn").css("display", "block");
			$("#show_img").find("img").attr("src", "");//重置图片
			layui.form.render();
		}

		// 新增弹窗用户
		var inserAdminView = -1;
		function InsertUser() {
			Ireset();
			inserAdminView = layer.open({
				type : 1,
				content : $('#divIUser'),
				title : "新增管理员信息"
			});
			layer.full(inserAdminView); // 最大化
			$.ajax({
				type : 'post',//可选get
				url : '${ctx}/user/selectuserTypedo.do',//这里是接收数据的PHP程序
				dataType : 'text',//服务器返回的数据类型 可选XML ,Json jsonp script html text等
				scriptCharset : 'UTF-8',
				success : function(data, textStatus) {
					data = eval('[' + data + ']');
					data = data[0];
					//console.log(data);
					var html_two = '<option value=""></option>';//下拉框加入‘请选择’
					$('#IusertypeId').html(html_two);
					//用户类型下拉框绑定
					$.each(data.usertypeList, function(index, item) {
						$('#IusertypeId').append(
								new Option(item.usertype, item.usertypeId));//往下拉菜单里添加元素
					});
					form.render('select');
					opType = 1;
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(errorThrown);
					// 					console.log(textStatus);
					// 					console.log(XMLHttpRequest);
					// 					console.log(errorThrown);
				}
			});
		}

		//新增保存
		function insertSave(data) {
			if (data.field.account == "" || data.field.account == null) {
				layer.msg("用户账号不能为空，请输入");
				return false;
			} else if (data.field.usertypeId == ""
					|| data.field.usertypeId == 0) {
				layer.msg("用户类型不能为空，请选择")
				return false;
			} else if (data.field.name == "" || data.field.name == null) {
				layer.msg("用户姓名不能为空，请输入")
				return false;
			} else if (data.field.password == "" || data.field.password == null) {
				layer.msg("密码不能为空，请输入")
				return false;
			} else if (data.field.password1 == ""
					|| data.field.password1 == null) {
				layer.msg("确定密码不能为空，请输入")
				return false;
			} else if (data.field.password != data.field.password1) {
				layer.msg("密码和确定密码不一致，请重新输入")
				return false;
			} else if(data.field.phoneNumber ==""|| data.field.phoneNumber==null){
			    layer.msg("手机号码不能为空，请输入")
				return false;
			}else {
				var loadIndex = layer.load(0, {
					shade : 0.3
				});// 0代表加载的风格，支持0-2
				$("#formreset").ajaxSubmit({
					type : 'POST',
					// 可选get
					url : ctx + "/user/IorUAdmin.do",
					// 这里是接收数据的PHP程序
					data : {
						opType : opType
					},
					// 传给PHP的数据，多个参数用&连接
					dataType : 'json',
					// 服务器返回的数据类型 可选XML ,Json jsonp script html text等
					scriptCharset : 'UTF-8',
					success : function(data, textStatus) {
						layer.close(loadIndex);
						if (data.state == 'ok') {
							layer.msg(data.msg);
							layer.close(inserAdminView);
							selectAdmin(); // 刷新查询
							$.post("${ctx}/user/insertLog.do",{operType:"新增管理员信息"},function(){});
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
		
		//打开修改页面回填信息
		var UpdateUserView;
		function userEditView(data) {
		   var Data=data;
		    UpdateUserView = layer.open({
				type : 1,
				// area: ['500px', '300px'],
				content : $('#divEUser'),
				title : "修改管理员信息"
			});
			layer.full(UpdateUserView); // 最大化
			//回填图片
		    $("#show_img2").find("img").remove();
		    $("#userFile").val(Data.picture);
			var  userFile=$("#userFile").val();
			if (userFile=="") {
			    $("#addBtn2").css("display","block");
			 }else {
			   changeImgSize(Data);
			   $("#marTop").css("margin-top","0px");
			 	//$('#show_img2').append('<img src="${ctx}/user/getImg.do?file=' + Data.picture + '" style="width: 200px;height: 230px;"/>');
			 	 //显示删除图片按钮
				showDelBtn2();
			 }
			$("#userIdU").val(Data.userId);
			$("#Uaccount").val(Data.account);
			$("#Uname").val(Data.name);
			$("#Unickname").val(Data.nickname);
			$("#Uwechat").val(Data.wechat);
			$("#UphoneNumber").val(Data.phoneNumber);
			$("#Umailboxaddress").val(Data.mailboxaddress);
			$("#Uaddress").val(data.address);
			if (Data.sex == "男") {
				//$("#Uradio1").attr("checked",true);//只能修改一次，取消后不能再选中
				var e = document.getElementById('Uradio1');
				e.checked = true;
			}
			if (Data.sex == "女") {
				// $("#Uradio2").attr("checked",true);
				var e = document.getElementById('Uradio2');//女
				e.checked = true;
			}
			$.ajax({
				type : 'post',//可选get
				url : '${ctx}/user/selectuserTypedo.do',//这里是接收数据的PHP程序
				dataType : 'text',//服务器返回的数据类型 可选XML ,Json jsonp script html text等
				scriptCharset : 'UTF-8',
				success : function(data, textStatus) {
					data = eval('[' + data + ']');
					data = data[0];
					//console.log(data);	
					var html_two = '<option value=""></option>';//下拉框加入‘请选择’
					$('#UusertypeId').html(html_two);
					//用户类型下拉框绑定
					$.each(data.usertypeList, function(index, item) {
						$('#UusertypeId').append(
								new Option(item.usertype, item.usertypeId));//往下拉菜单里添加元素
					});
					$("#UusertypeId option[value='" + Data.userType_id + "']")
							.attr("selected", "true");//回填下拉框
					//form.render();
					form.render('select');// 刷新select选择框渲染
					form.render('radio');
					opType = 2;
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(errorThrown);
					//console.log(textStatus);
					//console.log(XMLHttpRequest);
					//console.log(errorThrown);
				}
			});

		}
        //自动适应图片
		function changeImgSize(Data) {
			var getContainer = document.getElementById('show_img2');
			$("#show_img2").append('<img src="${ctx}/user/getImg.do?file=' + Data.picture + '" id="marTop" />');
					//style="width: 200px;height: 230px;"
			var getIMG = getContainer.getElementsByTagName('img')[0];
			var fw = getContainer.offsetWidth - (2 * getContainer.clientLeft);
			var fh = getContainer.offsetHeight - (2 * getContainer.clientTop);
			var iw = getIMG.width;
			var ih = getIMG.height;
			var m = iw / fw;
			var n = ih / fh;
			if (m >= 1 && n <= 1) {
				iw = Math.ceil(iw / m);
				ih = Math.ceil(ih / m);
				getIMG.width = iw;
				getIMG.height = ih;
			} else if (m <= 1 && n >= 1) {
				iw = Math.ceil(iw / n);
				ih = Math.ceil(ih / n);
				getIMG.width = iw;
				getIMG.height = ih;
			} else if (m >= 1 && n >= 1) {
				getMAX = Math.max(m, n);
				iw = Math.ceil(iw / getMAX);
				ih = Math.ceil(ih / getMAX);
				getIMG.width = iw;
				getIMG.height = ih;
			}
			if (getIMG.height < fh) {
				var getDistance = Math.floor((fh - getIMG.height) / 2);
				getIMG.style.marginTop = getDistance.toString() + "px";
			}
		}
		//修改保存
		function updateSave(data){
		    if (data.field.userType_id == "" || data.field.userType_id == 0) {
				layer.msg("用户类型不能为空，请选择")
				return false;
			} else if (data.field.name == "" || data.field.name == null) {
				layer.msg("用户姓名不能为空，请输入")
				return false;
			} else if (data.field.phoneNumber == "" || data.field.phoneNumber == null) {
				layer.msg("手机号码不能为空，请输入")
				return false;
			} else {
				var loadIndex = layer.load(0, {
					shade : 0.3
				});// 0代表加载的风格，支持0-2
				$("#formUpdate").ajaxSubmit({
					type : 'POST',
					// 可选get
					url : ctx + "/user/IorUAdmin.do",
					// 这里是接收数据的PHP程序
					data : {
						opType : opType,
						deletePicNo:deletePicNo
					},
					// 传给PHP的数据，多个参数用&连接
					dataType : 'json',
					// 服务器返回的数据类型 可选XML ,Json jsonp script html text等
					scriptCharset : 'UTF-8',
					success : function(data, textStatus) {
						layer.close(loadIndex);
						if (data.state == 'ok') {
							layer.msg(data.msg);
							layer.close(UpdateUserView);
							selectAdmin(); // 刷新查询
							deletePicNo="0";
							$.post("${ctx}/user/insertLog.do",{operType:"修改管理员信息"},function(){});
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
   <!-- 新增图片 -->
	<script type="text/javascript">
   $(document).on("change","#upload",function(e) {
			var imgBox = e.target;//
			var file = imgBox.files[0];
			if (!/image\/\w+/.test(file.type)) {
				layer.alert("请选择图片文件");
				return false;
			} else if (file.size >= 4 * 1024 * 1024) {
				layer.alert("图片文件不能大于4MB");
				$("#upload").remove();
				$("#delBtn").before(
								'<input type="file" id="upload" name="upfile" style="display: none;">');
				return false;
			} else {
				uploadImg($('#show_img'), imgBox);
			}
	});
	// 上传图片按钮
	$("#addBtn").on('click', function() {
		$("#upload").click();
	});
	// 删除图片按钮
	$("#delBtn").click(function() {
		//var fileName = $("#fileName").val();
		$("#show_img").find("img").remove();
		$("#fileName").val("");
		$("#upload").val("");
		showDelBtn();
	})
	//上传图片
	function uploadImg(element, tag) {
        //获取上传文件信息
		var file = tag.files[0];
        //调用压缩图片方法
        compressImg(file,function(imgBase64){
            imgBase64 = imgBase64;//存储转换的base64编码
            var imgs = document.createElement("img");
			$(imgs).attr("src", imgBase64); //显示预览图片
			element.append(imgs);
			showDelBtn();
        },240);//图片像素
	}
    //显示上传/删除按钮
	function showDelBtn(){
		var lenth = $("#show_img").children("img").length;//是否存在图片
		var va = $("#show_img").children("img").attr("src");//图片信息
		if ((va == "" || typeof (va) == "undefined") && lenth <= 0) {
			$("#addBtn").show();//显示上传按钮
		} else {
            $("#addBtn").hide();//隐藏上传按钮
            //鼠标移动事件
			$("#containerDiv").on("mouseenter", function() {
				$("#delBtn").show();
			}).on("mouseleave", function() {
				$("#delBtn").hide();
			});
		}
	}
    /**
    *图片压缩方法
    *fileObj：图片信息
    *callback：返回函数function(e){}
    *maxLen:压缩图片像素
    **/
    function compressImg(fileObj, callback, maxLen) {
        // 用FileReader读取文件
        var reader = new FileReader();
        // 将图片读取为base64
        reader.readAsDataURL(fileObj);
        reader.onload = function(evt){
            var base64 = evt.target.result;
            // 创建图片对象
            var img = new Image();
            // 用图片对象加载读入的base64
            img.src = base64;
            img.onload = function () {
                //生成比例
                var width = img.width, height = img.height;
                //计算缩放比例
                var rate = 1;
                if (width >= height) {
                    if (width > maxLen) {
                        rate = maxLen / width;
                    }
                } else {
                    if (height > maxLen) {
                        rate = maxLen / height;
                    }
                };
                img.width = width * rate;
                img.height = height * rate;
                //生成canvas创建画布
                var canvas = document.createElement("canvas");
                var ctx = canvas.getContext("2d");//2d绘画
                canvas.width = img.width;
                canvas.height = img.height;
                ctx.drawImage(img, 0, 0, img.width, img.height);
                var base64 = canvas.toDataURL('image/jpeg');
                callback(base64);
            }
        }
    }
		
	</script>
     <!--修改图片 -->
	<script type="text/javascript">
	$(document).on("change","#upload2",function(e) {
			var imgBox = e.target;//
			var file = imgBox.files[0];
			if (!/image\/\w+/.test(file.type)) {
				layer.alert("请选择图片文件");
				return false;
			} else if (file.size >= 4 * 1024 * 1024) {
				layer.alert("图片文件不能大于4MB");
				$("#upload2").remove();
				
				return false;
			} else {
				uploadImg2($('#show_img2'), imgBox);
			}
		});
		// 上传图片按钮
		$("#addBtn2").on('click', function() {
			$("#upload2").click();
		});
		// 删除图片按钮
		$("#delBtn2").click(function() {
			$("#show_img2").find("img").remove();
			$("#userFile").val("");
			$("#upload2").val("");
			showDelBtn2();
			deletePicNo="1";
		})
		//上传图片
		function uploadImg2(element, tag) {
			  //获取上传文件信息
	    	var file = tag.files[0];
			//调用压缩图片方法
			compressImg(file, function(imgBase64) {
				imgBase64 = imgBase64;//存储转换的base64编码
				var imgs = document.createElement("img");
				$(imgs).attr("src", imgBase64); //显示预览图片
				element.append(imgs);
				showDelBtn2();
			}, 240);//图片像素
		}
		//显示或隐藏 “删除”或“上传”按钮
		function showDelBtn2() {
			var lenth = $("#show_img2").children("img").length;
			var va = $("#show_img2").children("img").attr("src");
			if ((va == "" || typeof (va) == "undefined") && lenth <= 0) {
				$("#addBtn2").show();
			} else {
				$("#containerDiv2").on("mouseenter", function() {
					$("#delBtn2").show();
				}).on("mouseleave", function() {
					$("#delBtn2").hide();
				});
				$("#addBtn2").hide();
			}
		}
	</script>
  
  </body>
</html>
