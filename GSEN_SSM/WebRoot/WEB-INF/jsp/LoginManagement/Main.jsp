<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="keywords" content="scclui框架">
<meta name="description" content="scclui为轻量级的网站后台管理系统模版。">
<title>首页</title>

<link rel="shortcut icon" href="${ctx}/img/login.png">
<link rel="stylesheet" href="${ctx}/common/css/sccl.css" type="text/css"></link>
<link rel="stylesheet" href="${ctx}/common/skin/molv/skin.css"
	id="layout-skin" type="text/css"></link>
<link rel="stylesheet" href="${ctx}/common/layuis/css/layui.css"
	type="text/css"></link>
	
	<style>
	
	</style>
</head>

<body>
	<div class="layout-admin">
		<input type="hidden" autocomplete="off" class="layui-input" id="userID" value="${userdata.userId}">
		<input type="hidden" autocomplete="off" class="layui-input" id="phoneNumber" value="${userdata.phoneNumber}">
		<div class="layout-header" style="">
			<span class="header-logo">金状元后台管理中心</span> <a class="header-menu-btn"
				href="javascript:;"><i class="icon-font">&#xe600;</i> </a>
			<ul class="header-bar">
				<li class="header-bar-role"><a href="javascript:;">${usertype.usertype}</a></li>
				<li class="header-bar-nav"><a href="javascript:;"
					items="${userdata}" var="userdata">${userdata.name}<i
						class="icon-font" style="margin-left:5px;">&#xe60c;</i> </a>
					<ul class="header-dropdown-menu">
						<li><a href="javascript:;" id="updateP">修改密码</a></li>
						<li><a onclick="ontuichu()" style="cursor:pointer">退出</a></li>
					</ul>
				</li>
				<li class="header-bar-nav"><a href="javascript:;" title="换肤"><i
						class="icon-font">&#xe608;</i> </a>
					<ul class="header-dropdown-menu right dropdown-skin">
						<li><a href="javascript:;" data-val="qingxin" title="清新">清新</a>
						</li>
						<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a>
						</li>
						<li><a href="javascript:;" data-val="molv" title="墨绿">墨绿</a>
						</li>

					</ul>
				</li>
			</ul>
		</div>
		<aside class="layout-side">
			<ul class="side-menu">

			</ul>
		</aside>

		<div class="layout-side-arrow">
			<div class="layout-side-arrow-icon">
				<i class="icon-font">&#xe60d;</i>
			</div>
		</div>

		<section class="layout-main">
			<div class="layout-main-tab">
				<button class="tab-btn btn-left">
					<i class="layui-icon layui-icon-prev" style="color: #2B2E37"></i>
				</button>
				<nav class="tab-nav" style="margin-top: 5px">
					<div class="tab-nav-content">
						<a href="javascript:;" class="content-tab active"
							data-id="home.html">首页</a>
					</div>
				</nav>
				<button class="tab-btn btn-right">
					<i class="layui-icon layui-icon-next" style="color: #2B2E37"></i>
				</button>
			</div>
			<div class="layout-main-body">
				<iframe class="body-iframe" name="iframe0" width="100%" height="99%"
					src="Home.do" frameborder="0" data-id="home.html" seamless>
<!-- homes.do -->
				</iframe>
			</div>
		</section>
		<div class="layout-footer">@2019 0.1 www.mycodes.java</div>
	</div>
	<script type="text/javascript" src="${ctx}/common/js/jquery-2.0.3.min.js"></script>
	<script type="text/javascript" src="${ctx}/common/layuis/layui.js"></script>
	<script type="text/javascript" src="${ctx}/common/js/sccl.js"></script>
	<script type="text/javascript" src="${ctx}/common/js/sccl-util.js"></script>
	<script type="text/javascript" src="${ctx}/common/js/verification.js"></script>
	<script>
 		items = "${userdata}";
 		var userID;
	//	console.log(items);
		//判断是否有值
		if (items != "") {
			  userID=$("#userID").val();
		}else {
			//window.location.href = "${ctx}/GoldenbusinesshospitalSSM";
		}
     
       var receiveVer="";//接收到的验证码
		layui.use('layer', function() {
			var layer = layui.layer;
		});

		$('#updateP').on('click', function() {
			var layer = layui.layer;
			layer.open({
				type : 1,
				anim : 1,
				area : [ '520px', '320px' ],
				shadeClose : true, //点击遮罩关闭
				closeBtn : 2,
				content : '<div style="padding:30px 0px 0px 47px">'
				             +'<div class="layui-form-item layui-form-pane">'
				                +'<div class="layui-inline "style="margin-bottom: 5px;"> '
				                   +'<label class="layui-form-label">原手机号</label>'
				                   +'<div class="layui-input-inline ">'
				                        +'<input type="text" id="oldPhone"autocomplete="off" class="layui-input" style="width: 209px;" value="${userdata.phoneNumber}"onchange="verifyPhone(this)">'
				                   +'</div>'
				                   +'<div class="layui-input-inline" style="margin-top:-38px;margin-left: 317px;width: 0px;">'
				                        +'<button type="button" class="layui-btn layui-btn-primary" onclick="infoPwVerify()" id="infoPwVerify">获取验证码</button>'
				                   +'</div>'
				               +'</div>'
				           +'</div>'
				           +'<div class="layui-form-item layui-form-pane">'
					            +'<div class="layui-inline" >'
				                   +'<label class="layui-form-label">验证码</label>'
				                   +'<div class="layui-input-inline " >'
				                     +' <input type="text"id="verificationCode"autocomplete="off" class="layui-input" style="width: 315px;">'
				                   +'</div>'
				               +'</div> '
				            +'</div>'
				            +'<div class="layui-form-item layui-form-pane">'
					             +'<div class="layui-inline "style="margin-bottom: 10px;">'
				                    +'<label class="layui-form-label">新密码</label>'
				                    +'<div class="layui-input-inline " style="margin-bottom: 10px;"> '
				                        +'<input type="password"id="newPassword"autocomplete="off" class="layui-input" style="width: 315px;" onchange="strength()" >'
				                    +'</div>'
				                 +'</div>'
				            +'</div>'
				           +'<div class="layui-form-item"style="margin-top: -10px;">'
					            +'<div class="layui-col-md1"style="margin-left: 120px;">'
						              +'<button class="layui-btn" onclick="updateSave()" >确认修改</button>'
					            +'</div>'
					            +'<div class="layui-col-md1"style="margin-left:80px;">'
						              +'<button type="reset" class="layui-btn layui-btn-primary" onclick="reset()">重置</button>'
					             +'</div>'
				            +'</div>'
				+'</div>'
			});
			layer.title("修改密码");
		});
		//重置
  	function reset() {
  		$("#oldPhone").val($("#phoneNumber").val());
  		$("#verificationCode").val("");
  		$("#newPassword").val("");
  	}
  	//获取验证码
  	function infoPwVerify(){
  	      var phone = $("#oldPhone").val();
  	      if(phone.length !=0){
  	         if (!verifyPhone(phone)){
  	            $("#infoPwVerify").text("60s 后重试");
    			var timer=null;
    			var t=60, s=0;
    			s=Math.floor(t);
    			function countDown(){
					s--;
					if (s == 0) {
						clearInterval(timer);
						$("#infoPwVerify").text("获取验证码");
						$("#infoPwVerify").attr("disabled", false);
						return false;
					}
					$("#infoPwVerify").text(s + "s 后重试");
				}
				timer=setInterval(countDown,1000);
				$("#infoPwVerify").attr("disabled", true);
				$.post("${ctx}/user/huyiInfo.do",{phone:phone},function(data){
				   data=eval('[' + data + ']');//转换成js对象 
				   data=data[0];
				   //console.log(data);
				    if (data.msg == "") {
    					layer.msg("发送验证码失败,请检查手机号码是否正确",{icon:2,time:1000});
    				} else if (data.msg != "") {
    				    receiveVer=data.msg;
    					layer.msg("发送验证码成功",{icon:1,time:1000});
    				}
				});
  	         }else{
  	           layer.msg("手机号码错误",{icon:2,time:1000});
  	           return;
  	         }
  	      }else{
  	          layer.msg("手机号码错误",{icon:2,time:1000});
  	           return;
  	      }
  	}
  	 //输入密码-验证密码强度
  	 function strength(){
  	     var inputPw = $("#newPassword").val();// onkeyup="value=value.replace(/[\u4E00-\u9FA5]/g,'')"
    	if (inputPw != "" && inputPw.indexOf(" ") <0) {
	    	var intensity = verifyPwIntensity(inputPw);
	    	if (intensity == 0) console.log("强");
	    	else if (intensity == 1) {
	    		layer.msg("请输入6位及以上的密码",{icon:5,time:1000});
	    		$("#newPassword").val("");
	    	}
	    	else if (intensity == 2) console.log("弱");
	    	else if (intensity == 3) console.log("中");
	    	else if (intensity == 4) console.log("中");
    	}else{
    	    layer.msg("不能含有空格",{icon:5,time:1000});
	    	$("#newPassword").val("");
    	}
  	 }
  	//确定修改
    function updateSave(){
        var verificationCode= $("#verificationCode").val();
        var newPassword=$("#newPassword").val();
        if(verificationCode==""||verificationCode==null){
             layer.msg("验证码不能为空",{icon:2,time:1000});
             return ;
        }else if(newPassword==""||newPassword==null){
             layer.msg("密码不能为空",{icon:2,time:1000});
             return ;
        }else if(verificationCode!=receiveVer){
             layer.msg("输入的验证码错误",{icon:2,time:1000});
             return ;
        }else if(verificationCode==receiveVer){
              $.post("${ctx}/user/updatePassword.do",{userID:userID,newPassword:newPassword},function(data){
                     if (data.state == 'ok') {
							layer.msg(data.msg,{icon:1,time:1000});
							$.post("${ctx}/user/insertLog.do",{operType:"修改用户密码"},function(){});
						} else {
							layer.msg(data.msg,{icon:2,time:1000});
						}
              });
        }
    }
		function ontuichu() {
			layer.confirm('您确定要退出当前用户?', {
				icon : 3,
				title : '提示',
				shade : 0.3,
				//遮罩
				fixed : true,
				//固定
				shadeClose : false,
				//是否点击遮罩关闭
				btn : [ '确定', '取消' ]
			}, function(index) { //确定回调方法
				layer.close(index);
				window.location.href = "${ctx}/user/logins.do";
			})
		}
	</script>
</body>
</html>
