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
    
    <title>老师详情</title>
    
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
     .pId{
        line-height: 32px;
            margin-top: 2px;
     }
      #tableDiv .layui-table-cell {
	        height: auto;
	        line-height: 35px;
       }
    </style>
  </head>
  
  <body>
	<div class="layui-tab" lay-filter="test">
		<ul class="layui-tab-title">
			<li class="layui-this" lay-id="11">审核身份</li>
			<li lay-id="22">课件包管理</li>
			<li lay-id="33">审核积分</li>
		</ul>
		<div class="layui-tab-content">
			<div class="layui-tab-item layui-show">
				<form class="layui-form" id="formreset" enctype="multipart/form-data">
					<div style="width: 100%;max-width: 100%;">
						<div class="layui-form" style="padding: 2px 5px;">
							<div class="layui-row">
								<div class="layui-col-xs6">
									<div class="layui-form-item">
										<label class="layui-form-label">个人头像：</label>
										<div class="layui-input-block">
											<div class="img_table">
												<div class="info_table_container" id="containerDiv3">
													<div id="show_img1" name="productImg" class="img_div">
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="layui-form-item">
										<label class="layui-form-label"style="width: 85px;">学历证证件：</label>
										<div class="layui-input-block">
											<div class="img_table">
												<div class="info_table_container" id="containerDiv2">
													<div id="show_img2" name="productImg" class="img_div" >
														
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="layui-col-xs6">
									<div class="layui-form-item">
										<div class="layui-col-xs6">
											<label class="layui-form-label">姓名：</label>
											<div class="layui-input-block">
												<p class="pId" id="Iteachername" name=""></p>
											</div>
										</div>
										<div class="layui-col-xs6">
										    <label class="layui-form-label">性别：</label>
											<div class="layui-input-block">
												<p class="pId" id="Isex" name=""></p>
											</div>
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-col-xs6">
											<label class="layui-form-label">学历：</label>
											<div class="layui-input-block">
												<p class="pId" id="Ieducation" name=""></p>
											</div>
										</div>
										<div class="layui-col-xs6">
										    <label class="layui-form-label">教龄：</label>
											<div class="layui-input-block">
												<p class="pId" id="Iteachage" name=""></p>
											</div>
										</div>
									</div>
									<div class="layui-form-item">
									    <div class="layui-col-xs6">
											<label class="layui-form-label">手机号码：</label>
											<div class="layui-input-block">
												<p class="pId" id="IphoneNumber" name=""></p>
											</div>
										</div>
										<div class="layui-col-xs6">
										    <label class="layui-form-label">学科：</label>
											<div class="layui-input-block">
												<p class="pId" id="Isubject" name=""></p>
											</div>
										</div>
									</div>
									<div class="layui-form-item">
										 <div class="layui-col-xs6">
											<label class="layui-form-label"
												style="width: 84px;margin-left:-5px;">身份证号码：</label>
											<div class="layui-input-block">
												<p class="pId" id="IidCard" name=""></p>
											</div>
										</div>
										<div class="layui-col-xs6">
										    <label class="layui-form-label">出生日期：</label>
											<div class="layui-input-block">
												<p class="pId" id="IcreationTimeStr" name=""></p>
											</div>
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-col-xs6">
											<label class="layui-form-label"
												style="width: 114px;margin-left: -33px;">教师资格证编号：</label>
											<div class="layui-input-block">
												<p class="pId" id="IteaQuaNumber" name=""></p>
											</div>
										</div>
										<div class="layui-col-xs6">
										    <label class="layui-form-label">毕业院校：</label>
											<div class="layui-input-block">
												<p class="pId" id="Igraduationcollege" name=""></p>
											</div>
										</div>
									</div>
									<div class="layui-form-item">
										<label class="layui-form-label">个人简历：</label>
										<div class="layui-input-block">
											 <p class="pId" id="IpersonalProfile" name=""></p>
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-col-md1 layui-col-md-offset2" id="Iexamine">
											
										</div>
										<div class="layui-col-md1" style="margin-left:60px;">
											<button type="reset" class="layui-btn layui-btn-normal"
												id="ref" onclick="location.reload()" >刷新</button>
										</div>
										<div class="layui-col-md1" style="margin-left:32px;">
										     <button type="button" class="layui-btn layui-btn-primary" onclick="close1()">关闭</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="layui-tab-item">
                 <div id="operationDIV"  style="position:absolute ;left:0px;right:0px;top:70px;margin-bottom:10px;">
					<form class="layui-form">
						<div class="layui-row">
							<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
								<label class="layui-form-label">课件名称 </label>
								<div class="layui-input-inline">
									<input type="text" id="Scoursename"
										style="font-size:10px;" autocomplete="off" placeholder="请输入课件名称"
										class="layui-input">
								</div>
							</div>
							<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
								<label class="layui-form-label">教学版本</label>
								<div class="layui-input-inline" style="width: 165px;">
									<select name="teachversionId" id="SteachversionId">
										<option value="0">---请选择---</option>
										<c:forEach items="${teachversionList}" var="teachversionList">
											<option value="${teachversionList.teachversionId}">${teachversionList.teachversion}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
								<label class="layui-form-label">年级</label>
								<div class="layui-input-inline" style="width: 165px;">
									<select name="gradeId" id="SgradeId">
										<option value="0">---请选择---</option>
										<c:forEach items="${gradeList}" var="gradeList">
											<option value="${gradeList.gradeId}">${gradeList.gradename}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
								<input class="layui-btn" value="查询" type="button"
									style="float:left;margin-left: 40px;" onclick="selectCourse()">
								<input class="layui-btn layui-btn-normal" value="新增" type="button"
									style="float:left;margin-left: 20px;" onclick="insertCourse()">
								<input class="layui-btn layui-btn-primary" value="关闭" type="button"
									style="float:left;margin-left: 18px;" onclick="close1()">
							</div>
						</div>
					</form>
				</div>
				<div id="tableDiv" style="margin-top: 55px;margin-left:10px;margin-right:10px;">
					<table id="courseTable" lay-filter="tableCourse"></table>
				</div>
            </div>
			<div class="layui-tab-item">
                 <div   style="position:absolute ;left:0px;right:0px;top:70px;margin-bottom:10px;">
					<form class="layui-form">
						<div class="layui-row">
							<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
								<label class="layui-form-label">老师名称 </label>
								<div class="layui-input-inline">
									<input type="text" id="teachername"
										style="font-size:10px;" autocomplete="off" placeholder="请输入老师名称"
										class="layui-input">
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
							<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
								<label class="layui-form-label">操作日期</label>
								<div class="layui-input-inline" style="width:178px;">
									<input type="text" class="layui-input" id="SdateTimeRange" placeholder=" - ">
								</div>
							</div>
							<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg3">
								<input class="layui-btn" value="查询" type="button"
									style="float:left;margin-left: 40px;" onclick="selectIntegral()">
								<input class="layui-btn layui-btn-primary" value="关闭" type="button"
									style="float:left;margin-left: 20px;" onclick="close1()">
							</div>
						</div>
					</form>
				</div>
				<div id="tableDiv" style="margin-top: 55px;margin-left:10px;margin-right:10px;">
					<table id="integralTable" lay-filter="tableIntegral"></table>
				</div>
            </div>
		</div>
	</div>

	<script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
       <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除</a> 
	 </script>
	<script type="text/javascript">
	     layui.use([ 'form','upload','element','laypage','table' ,'laydate'], function(){
	           var $ = layui.jquery ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
	              form = layui.form;
                  upload = layui.upload;
                  laypage = layui.laypage;
                   table = layui.table;
                    laydate = layui.laydate;
                    //日期时间
		     laydate.render({
			    elem : '#SdateTimeRange',
			    range: true//范围
		     });
                   
                   //Hash地址的定位
                 var layid = location.hash.replace(/^#test=/, '');
                 element.tabChange('test', layid);
                 element.on('tab(test)', function(elem){
                      location.hash = 'test='+ $(this).attr('lay-id');
                 });
	            // 监听提交
		        form.on('submit(identityExamine)', function() {
				    identityExamine();//身份审核
				    return false;
			    });
			    table.on('tool(tableCourse)', function(obj){
			        var data = obj.data;
			        if (obj.event === 'edit') { // to修改课件
					    updateCourseView(data);
				    }else if(obj.event === 'delete'){//删除
				         deleteCourse(data);
				    }
			    });
	           
	         $("#Iteachername").text("${teacher.teachername}");
	         $("#Ieducation").text("${teacher.education}");
	         $("#IphoneNumber").text("${teacher.phonenumber}");
	         $("#IidCard").text("${teacher.idCard}");
	         $("#IteaQuaNumber").text("${teacher.teaQuaNumber}");
	         $("#IpersonalProfile").text("${teacher.personalprofile}");
	         $("#Isex").text("${teacher.sex}");
	         $("#Iteachage").text("${teacher.teachage}");
	         $("#Isubject").text("${subject.subject}");
	         $("#IcreationTimeStr").text("${teacher.creationTimeStr}");
	         $("#Igraduationcollege").text("${teacher.graduationcollege}");
	         $("#show_img1").find("img").remove();
	         $("#show_img2").find("img").remove();
	         var picture="${teacher.picture}";
	         var edCertificates="${teacher.edCertificates}";
	         var splicing=picture+"+++"+edCertificates;
	         if(picture!="" ||edCertificates!=""){
	               changeImgSize(splicing);
	               $("#marTop2").css("width","420px");
	               $("#marTop2").css("height","290px");
	         }
	         var examineBit="${teacher.examineBit}";
	         if(examineBit==2){//2是未审核
	              $("#Iexamine").append('<button type="button" class="layui-btn" lay-filter="identityExamine" lay-submit="">通过审核</button>');
	         }else{
	               $("#Iexamine").append('<button type="button" class="layui-btn layui-btn-warm" lay-filter="identityExamine" lay-submit="">取消审核</button>');
	         }
	         
	       
	       selectCourse();//查询课件
	       selectIntegral();//查询老师积分
	     });//layui.use
       
        function close1(){
            window.location.href = "${ctx}/user/tea_identity.do";
        }
	   
	     //身份审核否
	     function identityExamine(){
	         var id="${teacher.teacherId}";
	         $.post("${ctx}/user/updateExamine.do",{id:id},function(data){
	           if (data.state == 'ok') {
					 layer.msg(data.msg,{icon:1,time:1000});
					$("#ref").click();
					$.post("${ctx}/user/insertLog.do",{operType:"修改老师身份的审核否"},function(){});
				  } else {
					 layer.msg(data.msg,{icon:2,time:1000});
				  }
	         });
	     }
	      //自动适应图片
		function changeImgSize(splicing) {
		    var splicingStr=splicing.split("+++");
		    for ( var int = 1; int <= splicingStr.length; int++) {
				var getContainer = document.getElementById('show_img'+ int +'');
				$("#show_img"+int+"").append('<img src="${ctx}/user/getImg.do?file=' + splicingStr[int-1] + '" id="marTop'+int+'" style="width: 190px;height: 230px;" />');
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
		//课件渲染
		function courseTable(data){
		     // 执行渲染
			table.render({
						elem : '#courseTable',
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
									field : 'coursename',
									title : '课件名称',
									//width : 280,
								}, {
									field : 'knowledge',
									title : '知识点',
									//width : 120,
								}, {
									field : 'teachername',
									title : '上传者',
									width : 76,
								}, {
									field : 'subject',
									title : '学科',
									width : 65,
								}, {
									field : 'teachversion',
									title : '教学版本',
									width : 90,
								},{
									field : 'gradename',
									title : '年级',
									width : 65,
								}, {
									field : 'courseprice',
									title : '课件价格',
									width : 90,
								},{
									field : 'creationTime',
									title : '上传时间',
									//width : 120,
								}, {
									field : 'examinebit',
									title : '状态',
									width : 76,
                                    templet : function(d) {
                                        if(d.examinebit==0){
                                             return '<button type="button" class="layui-btn layui-btn-xs layui-btn-danger" onclick="examine('+d.courseId+')" title="点击审核">未审核</button>';
                                        }else{
                                             return '<button type="button" class="layui-btn layui-btn-xs layui-btn-warm"  onclick="examine('+d.courseId+')" title="点击取消审核">已审核</button>';
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
		//查询课件信息
		function selectCourse(){
		    var coursename=$("#Scoursename").val();
		    var teachversionId=$("#SteachversionId").val();
		    var gradeId=$("#SgradeId").val();
		      // 显示加载页面
			var loadIndex = layer.load(0, {
				shade : 0.3
			}); // 0代表加载的风格，支持0-2
			$.ajax({
			    type : 'post',
				// 可选get
				url :  "${ctx}/user/selectCourseALL.do",
				// 这里是接收数据的PHP程序
				data : {
				    teacherId: "${teacher.teacherId}",
					coursename : coursename,
					teachversionId : teachversionId,
					gradeId : gradeId
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
					courseTable(data.data);
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
		//to新增课件包页面
		function insertCourse(){
		      window.location.href = "${ctx}/user/insertCourseView.do?teacherId="+"${teacher.teacherId}";
		}
		//to修改课件包页面
		function updateCourseView(data){
		    if(data.examinebit==1){
		       layer.msg("已审核的课件包不能进行修改");
		       return false;
		    }else{
		         window.location.href = "${ctx}/user/updateCourseView.do?courseId="+data.courseId;
		    }
		}
		//删除课件包
		function deleteCourse(data){
		    if(data.examinebit==1){
		       layer.msg("已审核的课件包不能进行删除");
		       return false;
		    }else{
		         // 询问框
						layer.confirm('是否删除这条课件包信息?对应的课件评价信息也将会被删除', {
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
								url : '${ctx}/user/delectCourse.do',
								// 这里是接收数据的PHP程序
								data : {
									courseId : data.courseId
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
										selectCourse(); // 刷新查询
										$.post("${ctx}/user/insertLog.do",{operType:"删除课件包信息"},function(){});
									} else {
										layer.msg(data.msg);
									}
								}
							});
						});
		    }
		}
		//是否审核课件包
		function examine(courseId){
		    var examineBit="${teacher.examineBit}";
		    if(examineBit==2){
		           layer.msg("请先审核当前老师");
		           return false;
		    }else{
		      window.location.href = "${ctx}/user/exCourseView.do?courseId="+courseId;
		    }
		}
		//查询老师积分信息
         function selectIntegral(){
            var teacherid="${teacher.teacherId}";
            var teachername = $("#teachername").val(); // 
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
				url :"${ctx}/user/selectTeaIntegral.do",
				// 这里是接收数据的PHP程序
				data : {
					teachername : teachername,
					integraldirection : integraldirection,
					startTime:startTime,
					endTime:endTime,
					teacherid:teacherid
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
					integralTable(data.data);
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
          // 老师积分渲染
		function integralTable(data) {
			// 执行渲染
			table.render({
						elem : '#integralTable',
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
									field : 'teachername',
									title : '老师姓名',
                                    width:100
								}, {
									field : 'integralflow',
									title : '积分流水',

								},{
									field : 'integraldirection',
									title : '积分流向',
									width:100
								}, {
									field : 'integral',
									title : '积分',
									width:100
								},{
									field : 'operationtimeStr',
									title : '操作时间',
									width:180

								}, {
									field : 'validitybit',
									title : '状态',
									width : 100,
                                    templet : function(d) {
                                        if(d.validitybit==2){
                                             return '<button type="button" class="layui-btn layui-btn-xs layui-btn-danger">已失效</button>';
                                        }else{
                                             return '<button type="button" class="layui-btn layui-btn-xs layui-btn-warm">有效</button>';
                                        }
									}
								}, {
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
		//设置老师积分是否有效
		function prohibit(id){
		       $.post("${ctx}/user/updateIntegral.do",{id:id},function(data){
	           if (data.state == 'ok') {
					 layer.msg(data.msg,{icon:1,time:1000});
					selectIntegral();
					$.post("${ctx}/user/insertLog.do",{operType:"修改老师积分是否有效"},function(){});
				  } else {
					 layer.msg(data.msg,{icon:2,time:1000});
				  }
	         });
		}
	</script>
</body>
</html>
