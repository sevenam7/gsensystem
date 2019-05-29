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
    
    <title>My JSP 'Home.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="stylesheet" href="${ctx}/common/layuis/css/layui.css" type="text/css"></link>
    
     <style type="text/css">
      .breadcrumb{
             height: 30px;
             line-height: 44px;
             font-size: 16px;
       }
       .breadcrumb span {
         padding: 0 5px;
         font-family: -webkit-body;
      }
     </style>
  </head>
  
  <body>
      <nav class="breadcrumb">
    	<span id="time_weather"></span>
    	<span id="one_weather"></span>
    	<span id="two_weather"></span>
    	<span id="three_weather"></span>
    	<span id="four_weather"></span>
    	<a class="layui-btn layui-btn-sm" style="float: right;margin-right: 20px; margin-top: 5px;"  href="javascript:location.replace(location.href);" title="刷新">
    	    <i class="layui-icon">&#xe669;</i>  
    	</a>
      </nav>
      <hr class="layui-bg-gray">
<!--           width: 600px; -->
<!--     margin-top: 180px; -->
<!--     margin-left: 275px; -->
        <div id="container" align="center" style="min-width:700px;height:400px"><img src="${ctx}/img/金状元.png" style="width: 600px;margin-top: 165px;"></img></div>
  </body>
  <script type="text/javascript" src="${ctx}/common/layuis/layui.js"></script>
   <script type="text/javascript" src="${ctx}/common/js/ping.js"></script>
     <script type="text/javascript" src="${ctx}/common/js/jquery-2.0.3.min.js"></script>
     <script type="text/javascript" src="${ctx}/common/js/verification.js"></script>
  <script>
  var layer;
  var from, table, laypage,upload;
  $(function(){
      layui.use(['form', 'table', 'laypage', 'upload' ,'layer'], function(){
           form = layui.form;
			table = layui.table;
			laypage = layui.laypage;
            upload = layui.upload;
    	    layer = layui.layer;
      });
  });
   
    $(function () {
  		if (navigator.onLine) {
  			var p = new Ping();
       		p.ping("http://api.map.baidu.com", function(err, data) {
       			if (err) {
       				$("#one_weather").html("暂无网络服务，无法显示当前天气信息");
       			} else {
					$.getScript('http://pv.sohu.com/cityjson', function (_result) {//搜狐接口
			            if (returnCitySN.cip != '') {
			                var cityName = returnCitySN.cip;
			                QueryWeather(cityName);
			            } else {
			                layer.msg("网络出错，无法定位到当前城市", {icon:5,time:1000});
			            }
			        });
       			}
	        });
		} else {
		    //时间-定时器
	       	window.setInterval(CurrentTime, 1000);
	       	$("#one_weather").html("暂无网络服务，无法显示当前天气信息");
			layer.msg("暂无网络服务", {icon:5,time:1000});
		}
		//时间-定时器
		window.setInterval(CurrentTime, 1000);
  	});
  
    ////NowAPI--提供的接口，查询实时天气
    function QueryWeather(cityName) {
        var paramUrl = "http://api.k780.com/?app=weather.today&weaid=" + cityName + "&appkey=41520&sign=fa046ad35a39536d2a350ed6a3c09399&format=json";
        $.ajax({
            url: paramUrl,
            type: "get",
            dataType: "jsonp",
            jsonp: 'jsoncallback',
            async: false,
            data: "",
            // success: eval(funback)   封装成方法时，这里是回调参数名称
            success: function (data) {
                if (data.success == '1') {
	                var is = data.result.weather_icon;//http://api.k780.com/upload/weather/d/0.gif
	                var substr = is.split(/weather\/d/);
	                var jpg = "";
	                if (substr.length == 2) {
	                	jpg = "<img style='width:28px;height:20px; margin-top: -2px;' src='${ctx}/common/weather/d" + substr[1] + "' />";
	                } else {
	                	jpg = "<img style='width:28px;height:20px; margin-top: -2px;' src='" + is + "' />";
	                }
	                CurrentTime();
	                $("#one_weather").html(data.result.week + "&nbsp;&nbsp;&nbsp;&nbsp;" + jpg + "&nbsp;&nbsp;&nbsp;&nbsp;" + data.result.citynm + "&nbsp;&nbsp;" + data.result.temperature_curr);
	                if (data.result.weather == data.result.weather_curr || data.result.weather.indexOf("转") != -1) {
	                	$("#two_weather").html(data.result.weather );//+ "&nbsp;&nbsp;" + data.result.temperature
	                } else {
	                    $("#two_weather").html(data.result.weather + "转" + data.result.weather_curr );//+ "&nbsp;&nbsp;" + data.result.temperature
	                }
	                 $("#three_weather").html("空气质量："+data.result.aqi);
	                $("#four_weather").html("湿度：" + data.result.humidity + "&nbsp;&nbsp;" + data.result.wind + "&nbsp;&nbsp;" + data.result.winp);
	               
                } else {
                    layer.msg("获取当前天气失败,请检查接口状态是否正常", {icon:5,time:1000});
                    $("#one_weather").html("获取当前天气失败,请检查接口状态是否正常");
                }
            },
            error: function () {
                layer.msg("获取天气失败", {icon:5,time:1000});
            }
        });
    }
    
      //时间
    function CurrentTime() {
    	var timestamp = (new Date()).valueOf();
	    $("#time_weather").html(timestampToTime(timestamp));
    }
  </script>
</html>
