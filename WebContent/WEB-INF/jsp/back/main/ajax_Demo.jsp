<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE HTML>
<html>
	<head>
		<base href="${basePath}">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	
	
		<script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>  
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
		<title>这是一个测试</title>

			<script>
				var testB;
				function holetest(){
					testB = testA;
					alert(testB);
				}
			    //假设每隔5秒发送一次请求
			    window.onload = function () {
			        getApi();
			    }
			    var tastA;
			    
			    function getApi() {
			        //设置时间 5-秒  1000-毫秒  这里设置你自己想要的时间 
			        setTimeout(getApi,1*1000);
			        var optionJson=[];
			        //var testA;
				    $.ajax({
				        type:"POST",
				        url:"back/ajax_Demo_0",
				        data:{},
				        async: false,
				        success:function (data) {
				            optionJson=data;
				
				            var str="";
				
				            str+="<tr>"+
			                "<td>"+optionJson.oil_2time+"</td>"+
			                "<td>"+optionJson.oil_2inletFlow+"</td>"+
			                "<td>"+optionJson.oil_2outletFlow+"</td>"+
			                "<td>"+optionJson.oil_2wellMouthAdjustment+"</td>"+
			                "<td>测试</td>"+
			                "</tr>";
				
				            document.getElementById("tbodydata").innerHTML=str;
							testA="全局测试";
							document.getElementById("1").value="测试";
				        }
				    });
			    }
			</script>	
			<script type="text/javascript">
				function refurbishIndex(){
				
				    var optionJson=[];
				    $.ajax({
				        type:"POST",
				        url:"back/ajax_Demo_0",
				        data:{},
				        async: false,
				        success:function (data) {
				            optionJson=data;
				
				            var str="";
				
				            str+="<tr>"+
				                "<td>"+optionJson.oil_2time+"</td>"+
				                "<td>"+optionJson.oil_2inletFlow+"</td>"+
				                "<td>"+optionJson.oil_2outletFlow+"</td>"+
				                "<td>"+optionJson.oil_2wellMouthAdjustment+"</td>"+
				                "<td>测试</td>"+
				                "</tr>";
				
				            document.getElementById("tbodydata").innerHTML=str;
				
				
				        }
				    });
				}
			</script>
			
	
	</head>
	<body>
		
 		 <table class="table table-bordered table-hover table-striped" id="tableuserlist">
	                                    <thead>
	                                        <tr>
	                                            <th>Time</th>
	                                            <th>入口流量</th>
	                                            <th>出口流量</th>
	                                            <th>井口压力测定值</th>
	                                            <th>Job</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody id="tbodydata">


	                                                                    
	                                    </tbody>
	                                </table>

   <button onclick="holetest()">点我 </button>
     <input class="col-md-2" id="1"   placeholder="请输入值">
	
	</body>
</html>