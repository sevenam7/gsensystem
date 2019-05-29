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
    
    <title>学生详情</title>
    
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
    <script type="text/javascript" src="${ctx}/common/js/jquery.form.js"></script>
   <style>
     .pId{
        line-height: 36px;
/*             margin-top: 2px; */
     }
      #tableDiv .layui-table-cell {
	        height: auto;
	        line-height: 35px;
       }
        .papeContent{
        width: 80px;
    height: 29px;
    line-height: 2;
    text-align: center;
    font-size: 15px;
    margin-top: 0px;
    border: 1px solid #d2cfcf;
    background: #d2cfcf;
    color: white;
    }
    </style>
  </head>
  
  <body>
       <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">   
         <legend>学生信息</legend> 
      </fieldset>
	  <input type="hidden" id="path" value="${ctx}">
	  <div id="operationDIV" ontouchstart style="position:absolute ;left:0px;right:0px;top:58px;margin-bottom:10px;">
		 <form class="layui-form" id="formUpdate" enctype="multipart/form-data">
			<div class="layui-row">
			     <div class="layui-col-xs3" >
					<div class="layui-form-item">
						<label class="layui-form-label">姓名：</label>
						<div class="layui-input-block">
							<p class="pId" id="studentName" name="name"></p>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">昵称：</label>
						<div class="layui-input-block">
							<p class="pId" id="nickName" name="nickname"></p>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">手机号码：</label>
						<div class="layui-input-block">
							<p class="pId" id="phoneNumber" name="phonenumber"></p>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">性别：</label>
						<div class="layui-input-block">
							<p class="pId" id="sex" name="sex"></p>
						</div>
					</div>
				</div>
			     <div  class="layui-col-xs3" >
					<div class="layui-form-item">
						<label class="layui-form-label">QQ：</label>
						<div class="layui-input-block">
							<p class="pId" id="QQ" name="qq"></p>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">微信：</label>
						<div class="layui-input-block">
							<p class="pId" id="wechat" name="wechat"></p>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">创建时间：</label>
						<div class="layui-input-block">
							<p class="pId" id="creationTime" name="creationtime"></p>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">状态：</label>
						<div class="layui-input-block">
							<p class="pId" id="enabledBit"></p>
						</div>
					</div>
				</div>
			     <div  class="layui-col-xs3" >
			          <div class="layui-form-item">
						<label class="layui-form-label">图片：</label>
						<div class="layui-input-block">
							<div id="show_img1" name="picture" >
													
							</div>
						</div>
					</div>
			     </div>
			     <div  class="layui-col-xs3" >
					<div class="layui-form-item" style="margin-top:153px;margin-bottom:0px">
						<div class="layui-col-md1 layui-col-md-offset2" id="Iexamine">

						</div>
						<div class="layui-col-md1" style="margin-left:50px;">
							<button type="reset" class="layui-btn layui-btn-normal" id="ref"
								onclick="location.reload()">刷新</button>
						</div>
						<div class="layui-col-md1" style="margin-left:50px;">
							<button type="button" class="layui-btn layui-btn-primary"
								onClick="javascript :history.back(-1);">关闭</button>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-row" style="padding:0 40;">
			     <div class="layui-col-xs6">
				       <p class="papeContent">积分流水</p>
				 </div>
			</div>
			<hr class="layui-bg-gray" style="margin:4 40;">
		    <div class="layui-row" style="margin-top:16px;">
				<div id="operationDIV"  style="left:0px;right:0px;top:58px;margin-bottom:10px;">
					<div class="layui-row">
						<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
							<label class="layui-form-label">学生名称 </label>
							<div class="layui-input-inline">
								<input type="text" id="name" style="font-size:10px;"
									autocomplete="off" placeholder="请输入学生名称" class="layui-input">
							</div>
						</div>
						<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
							<label class="layui-form-label">积分流向</label>
							<div class="layui-input-inline" style="width: 165px;">
								<select name="integraldirection" id="integraldirection">
									<option value="">---请选择---</option>
									<option value="流入">流入</option>
									<option value="流出">流出</option>
								</select>
							</div>
						</div>
						<div class="layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4">
							<label class="layui-form-label">操作日期</label>
							<div class="layui-input-inline" style="width:178px;">
								<input type="text" class="layui-input" id="SdateTimeRange"
									placeholder=" - ">
							</div>
						</div>
						<div class="layui-col-xs2 layui-col-sm2 layui-col-md2 layui-col-lg2">
							<input class="layui-btn" value="查询" type="button" onclick="selectIntegral()">
						</div>
					</div>
				</div>
				<div id="tableDiv" style="margin-left: 20px;margin-right: 30px;">
					<table id="studentIntegralTable" lay-filter="tableStudentIntegral"></table>
				</div>
			</div>
		</form>
	 </div>
	 <script>
	      layui.use([ 'form','upload','laypage','table','laydate'], function(){
	              form = layui.form;
                  upload = layui.upload;
                  laypage = layui.laypage;
                  table = layui.table;
                  laydate=layui.laydate;
                   //日期时间
		     laydate.render({
			    elem : '#SdateTimeRange',
			    range: true//范围
		     });
                   // 监听提交
		        form.on('submit(identityExamine)', function(data) {
				    identityExamine(data);//学生启用否
				    return false;
			    });
                   
                   $("#studentName").text("${studentList.name}");
                   $("#nickName").text("${studentList.nickname}");
                   $("#phoneNumber").text("${studentList.phonenumber}");
                   $("#sex").text("${studentList.sex}");
                   $("#QQ").text("${studentList.qq}");
                   $("#wechat").text("${studentList.wechat}");
                   $("#creationTime").text("${studentList.creationtimeStr}");
                   var enabledBit="${studentList.enabledbit}";
                   if(enabledBit==1){//1是已启用 2是未启用
	                  $("#enabledBit").append('<button type="button" class="layui-btn layui-btn-xs layui-btn-warm" style="margin-top: 8px;">已启用</button>');
	                  $("#Iexamine").append('<button type="button" class="layui-btn layui-btn-danger" lay-filter="identityExamine" lay-submit="">禁用</button>');
	               }else{
	                  $("#enabledBit").append('<button type="button" class="layui-btn layui-btn-xs layui-btn-danger" style="margin-top: 8px;">未启用</button>');
	                  $("#Iexamine").append('<button type="button" class="layui-btn layui-btn-warm" lay-filter="identityExamine" lay-submit="">启用</button>');
	               }
                   $("#show_img1").find("img").remove();
                   var picture="${studentList.picture}";
                   if(picture!=""){
                       changeImgSize(picture+"+++");
                   }
                   selectIntegral();
	      });//layui.use
	      //启用否
	      function identityExamine(data){
	           // 显示加载页面
			     var loadIndex = layer.load(0, {shade : 0.3 }); // 0代表加载的风格，支持0-2
                 $("#formUpdate").ajaxSubmit({
					type : 'POST',
					// 可选get
					url :"${ctx}/user/exStudent.do",
					// 这里是接收数据的PHP程序
					data : {
					   studentId:"${studentList.studentId}"
					},
					// 传给PHP的数据，多个参数用&连接
					dataType : 'json',
					// 服务器返回的数据类型 可选XML ,Json jsonp script html text等
					scriptCharset : 'UTF-8',
					success : function(data, textStatus) {
						layer.close(loadIndex);
						if (data.state == 'ok') {
							layer.msg(data.msg);
							setTimeout('location.reload()', 1000);
							$.post("${ctx}/user/insertLog.do",{operType:"修改学生的启用否"},function(){});
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
	         //自动适应图片
		function changeImgSize(splicing) {
		    var splicingStr=splicing.split("+++");
		    for ( var i = 0; i < splicingStr.length; i++) {
				if(splicingStr[i]==""){
				    splicingStr.splice(i,1);//循环删除空值
				    //i= i-1;
				}
			}
		    for ( var int = 1; int <= splicingStr.length; int++) {
				var getContainer = document.getElementById('show_img'+ int +'');
				$("#show_img"+int+"").append('<img src="${ctx}/user/getImg.do?file=' + splicingStr[int-1] + '" id="marTop'+int+'" style="width: 150px;height: 190px;" />');
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
		}
		//查询学生积分
		function selectIntegral(){
		    var studentId="${studentList.studentId}";
            var name = $("#name").val(); // 
			var integraldirection = $("#integraldirection").val(); // 
			var SdateTimeRange=$("#SdateTimeRange").val();
			var division;
			var startTime;
			var endTime;
			if(SdateTimeRange!=""){
			    division=SdateTimeRange.split(" - ");
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
				url :"${ctx}/user/selectStuIntegral.do",
				// 这里是接收数据的PHP程序
				data : {
					name : name,
					integraldirection : integraldirection,
					startTime:startTime,
					endTime:endTime,
					studentId:studentId
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
					studentIntegralTable(data.data);
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
		//学生积分渲染
		function studentIntegralTable(data){
			     // 执行渲染
			table.render({
						elem : '#studentIntegralTable',
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
									title : '学生姓名',
									 width : 90,

								}, {
									field : 'integralflow',
									title : '积分流水',

								}, {
									field : 'integraldirection',
									title : '积分流向',
									width:100

								},{
									field : 'integral',
									title : '积分',
									width:100
								}, {
									field : 'operationtimeStr',
									title : '操作时间',
									width:180
								}
								, {
									field : 'validitybit',
									title : '状态',
									width : 100,
                                    templet : function(d) {
                                        if(d.validitybit==2){//1是有效 2是无效
                                             return '<button type="button" class="layui-btn layui-btn-xs layui-btn-danger">已失效</button>';
                                        }else{
                                             return '<button type="button" class="layui-btn layui-btn-xs layui-btn-warm">有效</button>';
                                        }
									}
								}
								, {
									fixed : 'right',
									title : '操作',
									width : 120,
									templet : function(d) {
                                        if(d.validitybit==2){//1是有效 2是无效
                                             return '<button type="button" class="layui-btn layui-btn-xs layui-btn-danger" onclick="prohibit('+d.integralId+')">设置有效</button>';
                                        }else{
                                             return '<button type="button" class="layui-btn layui-btn-xs layui-btn-warm"onclick="prohibit('+d.integralId+')">设置无效</button>';
                                        }
									}
								} ] ] // 设置表头
						,
						limit : data.length
					});
			}
		//设置学生积分是否有效
		function prohibit(id){
		       $.post("${ctx}/user/updateIntegral.do",{id:id},function(data){
	           if (data.state == 'ok') {
					 layer.msg(data.msg,{icon:1,time:1000});
					selectIntegral();
					$.post("${ctx}/user/insertLog.do",{operType:"修改学生积分是否有效"},function(){});
				  } else {
					 layer.msg(data.msg,{icon:2,time:1000});
				  }
	         });
		}
	 </script>
  </body>
</html>
