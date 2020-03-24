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
    		<!-- Bootstrap CSS -->
    	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


 <!-- 	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>  -->
    
    <script type="text/javascript">
    	function pumpAdd() {
    		var d = top.dialog({
    		    title: '添加泵',
    		    width:1500,
    		    url: 'back/pumpAdd',
    		    onclose:function(){
    		    	window.location.reload();
    		    }
    		});
    		d.showModal();
		}
     </script>
    

<title>控压钻井远程测控系统</title>
</head>
<body>


     <h2>时间</h2>
     
          <form class="layui-form layui-col-md12 x-so" action="back/oil_2Table" method="post">
          <input type="text" name="oil_2_time"  placeholder="输入个时间" autocomplete="off" class="layui-input" value="${oil_2.time}"><!-- value属性是为了将输入的值回显 -->
          <button value="点我显示数据" class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
       	  </form>
       	  <a href="http://localhost:8888/ssm01/back/table">
    			<button>全屏</button>
		  </a>
		  <a href="back/oil_2Table">
    			<button>全屏</button>
		  </a>
                          
                         
  
     <div class="container">
        <div class="clearfix" style="margin-top: 20px;margin-bottom: 20px;">
            <section class="row clearfix" style="margin-bottom: 20px;">
                <button class="col-md-1 btn-primary btn-lg" id="button-first">连接系统</button>
                <table class="col-md-3  table" id="20">
                   <thead>
                      <tr>
                         <th class="text-center">井口压力</th>
                         <th class="text-center">数值</th>
                      </tr>
                   </thead>
                   <tbody>
                      <tr>
                         <td class="text-center">设定值</td>
                         <td class="text-center">Bangalore</td>
                      </tr>
                      <tr>
                         <td class="text-center">测量值</td>
                         <td class="text-center">Mumbai</td>
                      </tr>
                   </tbody>
                </table>
                <table class="col-md-2  table">
                    <thead>
                       <tr>
                          <th class="text-center">压力偏差</th>
                       </tr>
                    </thead>
                    <tbody>
                       <tr>
                          <td class="text-center">设定值</td>
                       </tr>
                    </tbody>
                 </table>
                 <table class="col-md-4  table" id="21">
                    <thead>
                       <tr>
                          <th class="text-center">入口流量</th>
                          <th class="text-center">出口流量</th>
                          <th class="text-center">流量偏差</th>
                       </tr>
                    </thead>
                    <tbody>
                       <tr>
                          <td class="text-center">${oil_2.inletFlowlog}</td>
                          <td class="text-center">${oil_2.outletFlow}</td>
                       </tr>
                    </tbody>
                 </table>
                 <table class="col-md-2  table">
                    <thead>
                       <tr>
                          <th class="text-center">当前状态</th>
                       </tr>
                    </thead>
                    <tbody>
                       <tr>
                         <%--  <td class="text-center">${oil_2.state_1 eq 0?'停泵': oil_2.state_1 eq 1?'钻进':oil_2.state_1 eq 2?'循环':oil_2.state_1 eq 3?'接单根':oil_2.state_1 eq 4?'起钻':oil_2.state_1 eq 5?'下钻':'暂无'}</td> --%>
                       		<td class="text-center">${pmml_state_1 eq 0?'停泵': pmml_state_1 eq 1?'钻进':pmml_state_1 eq 2?'循环':pmml_state_1 eq 3?'接单根':pmml_state_1 eq 4?'起钻':pmml_state_1 eq 5?'下钻':'暂无'}</td> 
                       </tr>
                    </tbody>
                 </table>
                
           </section>
        </div>
        
        <div class="border border-primary "style="margin-bottom: 20px;">
         <div class="clearfix" style="margin-top: 20px;margin-bottom: 20px;">
           
           
           
            <section class="row clearfix" style="margin-bottom: 20px;">
                <center class="col-md-3">泵冲（rpm）</center>
                <input class="col-md-2" id="1" type="number"  placeholder="请输入值">
                <center class="col-md-4">泥浆泵选取</center>
                <select class="col-md-2" id="2">
                    <option selected="selected" disabled="disabled"  style='display: none' value=''></option>
                    <option value ="volvo">Volvo</option>
                    <option value ="saab">Saab</option>
                    <option value="opel">Opel</option>
                    <option value="audi">Audi</option>
                </select>
             </section>
             

             <section class="row">
                <center class="col-md-3">入口流量（L/s）</center>
                <input class="col-md-2" id="3" placeholder="计算并输入输入" type="number" onchange="jingkou(id,21,1,0)" oninput="jingkou(id,21,1,0)">
                
                <center class="col-md-4">出口流量（L/s）</center>
                <input class="col-md-2" type="text" placeholder="测量值" value="${oil_2.outletFlow}" id="4">
                
                <div class="col-md-1">
                    <button class="btn btn-success btn-sm" type="submit">拟合</button>
                </div>
             </section>
         </div>
        </div>
        <div class="border border-primary "style="margin-bottom: 20px;">
            <div class="clearfix" style="margin-top: 20px;margin-bottom: 20px;">
            <section class="row clearfix" style="margin-bottom: 20px;">
            
                <center class="col-md-3">立管压力（MPa）</center>
                <input class="col-md-2" type="text"  placeholder="测量值"  value="${oil_2.standpipePressurelog}"id="5">
                <center class="col-md-4">节流后压力（MPa）</center>
                <input class="col-md-2" type="text"  placeholder="不知道对应哪个字段"   id="6">
             </section>
             <section class="row clearfix" style="margin-bottom: 20px;">
             
             
                <center class="col-md-3">环空摩阻力（MPa）</center>
                <input class="col-md-2" id="7" type="number"  placeholder="请输入值" >
                <center class="col-md-4">安全压力余量（MPa）</center>
                <input class="col-md-2" id="8" type="number"   placeholder="请输入值" >
            </section>
            <section class="row clearfix" style="margin-bottom: 20px;">
                <center class="col-md-3" >井口回压设置值（MPa）</center>
                <input class="col-md-2" id="9" type="number"   placeholder="请输入值"  onchange="jingkou(id,20,1,1)" oninput="jingkou(id,20,1,1)">
                
                
                <center class="col-md-4">井口回压测量值（MPa）</center>
                <input class="col-md-2" type="text" id="10"   placeholder="测量值"  value="${oil_2.wellMouthAdjustment}">
                
                
            </section>
        </div>
        </div>

        <div class="border border-primary ">
            <div class="clearfix" style="margin-top: 20px;margin-bottom: 20px;">
            <section class="row">
                <center class="col-md-3">入口密度（g/cm3）</center>
                <input class="col-md-2" id="11" type="number"   placeholder="请输入值？"  value="${oil_2.inletDensitylog}">
                <center class="col-md-4">出口密度（g/cm3）</center>
                <input class="col-md-2" type="text"   id="12"   placeholder="测量值"  value="${oil_2.outletDensitylog}">
            </section>
            </div>
        </div>
        <div style="margin-top: 20px;margin-bottom: 20px;">
            <section class="row">
                <center class="col-md-2">节流阀A开度（%）</center>
                <input class="col-md-2" id="13" type="number" >
                <center class="col-md-2">节流阀B开度（%）</center>
                <input class="col-md-2" type="number"   id="14">
                <center class="col-md-2">节流阀C开度（%)</center>
                <input class="col-md-2" type="number"   id="15">
            </section>
        </div>
        <div style="margin-top: 20px;margin-bottom: 20px;">
            <section class="row">
                <p class="col-md-2">       </p>
                <input class="col-md-2" type="range" id="scape-1" min="1" max="100" onchange="change(id,13)" oninput="change(id,13)">
                <p class="col-md-2">       </p>
                <input class="col-md-2" type="range" id="scape-2" min="1" max="100" onchange="change(id,14)" oninput="change(id,14)">
                <p class="col-md-2">       </p>
                <input class="col-md-2" type="range" id="scape-3" min="1" max="100" onchange="change(id,15)" oninput="change(id,15)">
            </section>
        </div>
        <div style="margin-top: 20px;margin-bottom: 20px;">
            <section class="row">
<!--        <button class="col-md-2 btn-success btn-lg " id="button-1">基础设置</button>
  			<button class="layui-btn" onclick="userAdd()"><i class="layui-icon"></i>添加</button> -->
          	<button class="col-md-2 btn-success btn-lg " onclick="pumpAdd()" id="button-1">基础设置</button>
            
            <button class="col-md-2 btn-success btn-lg " id="button-2">警报设置</button>
<%--             <h1 class="col-md-4" align="center">${oil_2.state_2 eq 0?'无工况': oil_2.state_2 eq 1?'溢流':oil_2.state_2 eq 2?'漏失':oil_2.state_2 eq 3?'溢流漏失':oil_2.state_2 eq 4?'数据异常':'暂无'}</h1>
 --%>            <h1 class="col-md-4" align="center">${invoke_state_2 eq 2 ?'程序异常':invoke_state_2 eq 0?'正常工况':invoke_state_2 eq 1?'溢流':'暂无数据'}</h1>
            <button class="col-md-2 btn-success btn-lg " id="button-3">自动控制</button>
            <button class="col-md-2 btn-success btn-lg " id="button-4">手动控制</button>
            </section>
        </div>	
    </div>
    
     <script type='text/javascript'>
     function change(x,y) {
       var value = document.getElementById(x).value ;
       document.getElementById(y).value = value;
     }
     </script>
     <script type="text/javascript">
     function jingkou(x,y,m,n){
        var price = document.getElementById(x).value;
      var tb = document.getElementById(y);//获取表格的dom节点
      var td = tb.rows[m].cells[n];//获取0行0列的td单元格
       td.innerText = price;
     }
     
       
        </script>
     

      
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>