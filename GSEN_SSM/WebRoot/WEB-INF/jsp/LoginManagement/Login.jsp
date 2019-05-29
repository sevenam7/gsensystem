<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>登录</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="${ctx}/common/layuis/css/layui.css"type="text/css"></link>
<link rel="stylesheet" href="${ctx}/common/css/verify.css"type="text/css"></link>
<script type="text/javascript" src="${ctx}/common/layuis/layui.js"></script>
<script type="text/javascript"src="${ctx}/common/lib/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="${ctx}/common/loginjs/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/common/loginjs/verify.js"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
.news-signup-footer {
	background: 0;
	color: #fff;
	opacity: .8;
	z-index: 8;
}

.section-pos-bottom {
	position: fixed;
	display: block;
	width: 100%;
	height: 50px;
	line-height: 50px;
	font-size: 12px;
	text-align: center;
	background: #000;
	bottom: 0;
}

.news-home-overlay {
	background-color: rgba(54, 59, 70, .9);
	background-repeat: repeat;
	opacity: .9;
	filter: alpha(opacity = 90);
	height: 100%;
	left: 0;
	position: absolute;
	top: 0;
	width: 100%;
	z-index: -1;
}

.signinpanel {
	max-width: 750px;
	height: 540px;
	margin: 3% auto;
	z-index: 1;
}

.btnhover:HOVER {
	color: #fff;
	background-color: #41b2a6;
}
</style>
</head>

<body
	style="margin:0px;background-image:url('img/beijing1.jpg');background-attachment:fixed; background-repeat:no-repeat; background-size:100% 100%;">
	<input type="hidden" id="path" value="${ctx}">

	<div class="news-home-overlay"></div>

	<div class="signinpanel">
		<div class="layui-row">
			<div class="layui-col-md12"
				style="height: 110px;width: 100%;z-index: 2">
				<div
					style="background-image:url('img/beijing4.png');background-repeat:no-repeat;
               background-size:100% 100%;width: 400px;height: 85px;margin: 0 auto">
				</div>
			</div>
			<div class="layui-col-md12"
				style="height: 435px;width: 100%;background-color: #fff">
				<div class="layui-row">
					<div class="layui-col-md5"
						style="background-image:url('img/beijing2.png');
               background-size:100% 100%;width: 312px;height: 100%;z-index: 2;">
						<div
							style="background-color: #3ea398;opacity:0.9;height: 100%;width: 100%;z-index: 5;">
							<h4
								style="color: #fff;padding-top: 80%;padding-top: 120%;padding-left: 25%">金状元考试网后台管理中心</h4>
						</div>
					</div>
					<div class="layui-col-md7"
						style="z-index: 3;height: 100%;padding: 40px">
					 
						<div style="margin-bottom: 20px">
							<h2 style="color: #333">欢迎使用金状元管家</h2>
						</div>
						<div style="margin-bottom: 20px">
							<input type="text" class="layui-input" placeholder="请输入账号"
								style="border-top: 0px;border-left: 0px;border-right: 0px"
								name="account" id="account">
						</div>
						<div style="margin-bottom: 20px">
							<input type="password" class="layui-input" placeholder="请输入密码"
								style="border-top: 0px;border-left: 0px;border-right: 0px"
								name="password" id="password">
						</div>
						<div class="layui-row">
							<div class="layui-col-md8" style="margin-bottom: 20px">
								<input type="text" class="layui-input" placeholder="请输入验证码"
									style="border-top: 0px;border-left: 0px;border-right: 0px"
									name="identityKey" id="identityKey">
							</div>
							<div class="layui-col-md4" style="margin-bottom: 20px">
								<img id="imgIdentity" src="${ctx}/user/loginServlet.do" onclick="resetIdentity()">
							</div>
						</div>
						<div style="margin-bottom: 20px">
							<button
								class="layui-btn layui-btn-radius layui-btn-primary layui-btn-lg btnhover"
								style="width: 140px;border: solid 2px #41b2a6;font-weight: bold;"
								onclick="onlogin()">登 录</button>
						</div>
						<!-- <div class="button" style="" id="HuaDongYanZhen">
							<div id="mpanel1"></div>
						</div> -->

						<div style="float: right;margin-top: 19%">
							<h5 style="color: #888">服务电话 0668-8888888</h5>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 滑动图片验证 -->
	<div id="divyanzheng" style="display:none;z-index: 10">
		<div id="mpanel4" style=""></div>
	</div>
	<section class="news-signup-footer section-pos-bottom">©
	2019-2020 DXY All Rights Reserved.</section>
	<footer class="news-signup-footer"></footer>

	<script type="text/javascript">
		layui.use([ 'form' ], function() {
			var form = layui.form;
		});
		var account;
		function onlogin() {
	     account=$("#account").val();
		var password=$("#password").val();
		var identityKey=$("#identityKey").val();
		if(account=="" || account==null){
		     layer.msg("请填写用户名！");
		     return null;
		}else if(password=="" || password==null){
		     layer.msg("请填写密码！");
		     return null;
		}else if(identityKey=="" || identityKey==null){
		     layer.msg("请填写验证码！");
		     return null;
		}else{
		layer.load(3, {time: 1500});
		     $.ajax({
                type: 'post',
              // 可选get
                url: '${ctx}/user/userlogindo.do',
            //   这里是接收数据的PHP程序
                data: {
                    account: account,
                    password:password,
                    identityKey:identityKey
                },
               //传给PHP的数据，多个参数用&连接
                dataType: 'Json',
            //   服务器返回的数据类型 可选XML ,Json jsonp script html text等
                scriptCharset: 'UTF-8',
                async: false,
                //禁止异步
                success: function(data, textStatus) {
                    if (data.state == 'ok') {
						layer.msg(data.msg);
						setTimeout(function () {
						    layer.open({
				                    type : 1,
				                    content : $('#divyanzheng'),
				                    title : '请完成滑动验证',//标题
				                    closeBtn : 1,//右上角关闭按钮图标
				                    anim :0,//弹出动画，从上掉落
				                    area : ['402px'],//宽度,高度：获取当前网页可见高度
				                    shade : 0.6,//阴影深度
			                });
						},1500)////等待1.5秒再执行
					} else {
						layer.msg(data.msg);
					}
                }
            });
		
		   
		}
	}
		//验证码
		function resetIdentity(){
			$("#imgIdentity").attr("src", "${ctx}/user/loginServlet.do?time=" + new Date().getTime());
		}
	</script>
	<script type="text/javascript">
		$('#mpanel4').slideVerify({
			type : 2, //类型
			vOffset : 5, //误差量，根据需求自行调整
			vSpace : 5, //间隔
			imgName : [ '1.jpg', '2.jpg' ],
			imgSize : {
				width : '400px',
				height : '200px',
			},
			blockSize : {
				width : '40px',
				height : '40px',
			},
			barSize : {
				width : '400px',
				height : '40px',
			},
			ready : function() {
			},
			success : function() {
			     layer.msg("验证成功！", { icon: 6, skin: "layui-layer-molv",time:1000},function(index){
                             layer.load(3, {time: 1500}); //又换了种风格，并且设定最长等待1.5秒 
                 });
                 setTimeout(function () {
                        window.location.href = "${ctx}/user/main.do?account="+account;
                    }, 2500);//等待2.5秒再执行
                 $.post("${ctx}/user/insertLog.do",{operType:"登录"},function(){});
			},
			error : function() {
				 layer.msg("已验证为手残党！", { icon: 5, skin: "layui-layer-molv",time:1000});
			}

		});
	</script>
</body>
</html>
