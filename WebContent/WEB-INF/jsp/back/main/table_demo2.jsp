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
        <script type="text/javascript" src="js/echarts.common.min.js" ></script>
	    		
	    		<!-- Bootstrap CSS -->
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	    <style>
	                  .containerer{
	                    width:100%;
	                  height:100%;
	               }
	                
	                .left{
	                         text-align:center;
	                         margin-left:20px;          
	                      display:inline-block;
	                     width: 33%;            
	                 }
	                 
	                 .mid{
	                         text-align:center;               
	                      display:inline-block;
	                      margin-left:-5px;                
	                      width:33%;
	                 }
	                 .right{
	                    text-align:center;               
	                      display:inline-block;
	                      margin-left: 20px;
	                      
	                      width:33%;
	                 }
	
	                 .cu{ font-weight:bold}
	              </style>
		
		<title>Insert title here</title>
	
	
	
	
	
	
	
	
	
	</head>
	<!-- <body body scroll="no" style="overflow-x:hidden;overflow-y:hidden"> -->
	<body>
	
       <!-- <form class="layui-form layui-col-md12 x-so" action="back/oil_2Table" method="post"> -->
          <input type="text" name="oil_2_time"  placeholder="输入个时间" autocomplete="off" class="layui-input" id="time"><!-- value属性是为了将输入的值回显 value="${oil_2.time}" -->
          <button value="点我显示数据" class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
      <!--  </form> -->
   
    <div class="container-fiuled">
     	
     	
     	<!-- 顶层容器 -->
        <div class="clearfix" style="margin-top: 0px;margin-bottom: 5px;">
            <section class="row clearfix" >
               <div class="containerer"><!-- 顶层容器 -->
                  
                              <div class="left" id="main" style="width: 600px;height:250px;">
                                
                              </div>
                               
                              <div class="mid"  style="width: 300px;height:250px;">
                                <div style="margin-bottom: -10px;">
                                    <table class="table">
                                        <thead  >
                                            <tr>
                                                <th style="width: 150px;">
                                                    压力偏差
                                                </th>
                                                <th id="yalipiancha">
                                                    数值
                                                </th>
                                            </tr>
                                            
                                        </thead>
                                        <tbody >
                                            <tr>
                                              <td>
                                                  
                                              </td>
                                              
                                            </tr>
                                            
                                        </tbody>
                                    </table>
                                </div>
                                <div style="margin-bottom: -10px;">
                                    <table class="table">
                                       
                                        <thead>
                                          <tr>
                                              <th style="width: 150px;">
                                                  流量偏差
                                              </th>
                                              <th id="liuliangpiancha">
                                                    数值
                                            </th>
                                          </tr>
                                      </thead>
                                      <tbody>
                                          <tr>
                                            <td>
                                                
                                            </td>
                                          </tr>
                                      </tbody>
                                    </table>
                                </div>
                                <div style="margin-bottom: 0px;">
                                    <table class="table">
                                       
                                        <thead>
                                          <tr>
                                              <th style="width: 150px;">
                                                  工况
                                              </th>
                                              <th id="gongkuang">
                           <%-- ${pmml_state_1 eq 0?'停泵': pmml_state_1 eq 1?'钻进':pmml_state_1 eq 2?'循环':pmml_state_1 eq 3?'接单根':pmml_state_1 eq 4?'起钻':pmml_state_1 eq 5?'下钻':'暂无'} --%>
                                            </th>
                                          </tr>
                                      </thead>
                                      <tbody>
                                          <tr>
                                            <td>
                                                
                                            </td>
                                          </tr>
                                      </tbody>
                                    </table>
                                </div>
                            </div>
                            
                              <div class="right" id="main2" style="width: 600px;height:250px;" >
                              
                            </div>
               </div>  
           </section>
        </div>
        
        <!-- 框1 -->
        <div class="border border-primary "style="margin-left:5px;margin-bottom: 5px;margin-right:5px;">
         <div class="clearfix" style="margin-top: 10px;margin-bottom: 10px;">
           
            <section class="row clearfix" style="margin-bottom: 10px;">
                <center class="cu col-md-3">泵冲（rpm）</center>
	            <input class="col-md-2" id="1" type="number"  placeholder="请输入值">
                <center class="cu col-md-4">泥浆泵选取</center>
                <select class="col-md-2" id="2">
                    <option selected="selected" disabled="disabled"  style='display: none' value=''></option>
                    <option value ="volvo">Volvo</option>
                    <option value ="saab">Saab</option>
                    <option value="opel">Opel</option>
                    <option value="audi">Audi</option>
                </select>
             </section>
             <section class="row  clearfix" style="margin-bottom: 10px;">
         		<center class="cu col-md-3">入口流量（L/s）</center>
            	<input class="col-md-2" id="3" placeholder="计算并输入输入" type="number" onchange="jingkou(id,21,1,0)" oninput="jingkou(id,21,1,0)">
                
	            <center class="cu col-md-4">出口流量（L/s）</center>
	            <input class="col-md-2" type="text" placeholder="测量值"  id="4"><!-- value="${oil_2.outletFlow}" -->
	                
                <div class="col-md-1">
                    <button class="btn btn-success btn-sm" type="submit">拟合</button>
                </div>
             </section>
             <section class="row">
                <center class="cu col-md-3">入口密度（g/cm3）</center>
                <input class="col-md-2" id="11" type="number"   placeholder="请输入值？" ><!--  value="${oil_2.inletDensitylog}" -->
                <center class="cu col-md-4">出口密度（g/cm3）</center>
                <input class="col-md-2" type="text"   id="12"   placeholder="测量值"  ><!-- value="${oil_2.outletDensitylog}" -->
             </section>
         </div>
        </div>
        
        <!-- 框2 -->
        <div class="border border-primary "style="margin-left:5px;margin-bottom: 5px;margin-right:5px;">
            <div class="clearfix" style="margin-top: 10px;">
            <section class="row clearfix" style="margin-bottom: 0px;">
            
                <center class="cu col-md-2">立管压力（MPa）</center>
                <input class="col-md-2" type="text"  placeholder="测量值" id="5"><!--  value="${oil_2.standpipePressurelog}" -->
                <center class="cu col-md-2">节流后压（MPa）</center>
                <input class="col-md-2" type="text"  placeholder="不知道对应哪个字段"   id="6">
                 <center class="cu col-md-2">环空摩阻（MPa）</center>
<!--                 <input class="col-md-2" id="7" type="number"  placeholder="请输入值" >
 -->                <input  id="7" type="number" step="0.1" style ="width:200px"  placeholder="请输入值" >
                
                
                
             </section>
             <section class="row clearfix" style="margin-bottom: 5px;">
                
            </section>
            <section class="row clearfix" style="margin-bottom: 5px;">
                 <center class="cu col-md-2">安全压力余量（MPa）</center>
                <input class="col-md-2" id="8" type="number"   placeholder="请输入值" >
                <center class="cu col-md-2" >回压设置（MPa）</center>
                <input class="col-md-2" id="9" type="number"   placeholder="请输入值"  onchange="jingkou(id,20,1,1)" oninput="jingkou(id,20,1,1)">
                <center class="cu col-md-2" >回压测量（MPa）</center>
                <%-- <input class="col-md-2" type="text" id="10"   placeholder="测量值"  value="${oil_2.wellMouthAdjustment}">
           --%><input  type="text" id="10" style ="width:200px"  placeholder="测量值">
            </section>
        </div>
        </div>

       	<!-- 调节 -->
        <div style="margin-top: 20px;margin-bottom: 20px;">
            <section class="row">
                <center class="cu col-md-2">节流阀A开度（%）</center>
                <input class="col-md-2" id="13" type="number" placeholder="0~100" oninput="if(value > 100 || value < 0 ){value = ''}">
                <center class="cu col-md-2">节流阀B开度（%）</center>
                <input class="col-md-2" type="number"   id="14" placeholder="0~100" oninput="if(value > 100 || value < 0 ){value = ''}">
                <center class="cu col-md-2">节流阀C开度（%）</center>
                <input  type="number"   id="15" placeholder="0~100" oninput="if(value > 100 || value < 0 ){value = ''}" style ="width:200px">
            </section>
        </div>
        
        <!-- 滑动 -->
        <div style="margin-top: 20px;margin-bottom: 20px;">
            <section class="row">
                <p class="col-md-2">       </p>
                <input class="col-md-2" type="range" id="scape-1" min="1" max="100" onchange="change(id,13)" oninput="change(id,13)">
                <p class="col-md-2">       </p>
                <input class="col-md-2" type="range" id="scape-2" min="1" max="100" onchange="change(id,14)" oninput="change(id,14)">
                <p class="col-md-2">       </p>
                <input style ="width:200px" type="range" id="scape-3" min="1" max="100" onchange="change(id,15)" oninput="change(id,15)">
            </section>
        </div>
       
		<!-- 按钮 -->       
        <div style="margin-left:70px;margin-bottom: 5px;margin-right:50px;">
            <section class="row">
            <button class="col-md-2 btn-success btn-lg " id="button-1"  onclick="pumpAdd()" >基础设置</button>
            <button class="col-md-2 btn-success btn-lg " id="button-2">警报设置</button>
            <h1 style ="width:465px" align="center" id="gongkuang2"><%-- ${invoke_state_2 eq 2 ?'程序异常':invoke_state_2 eq 0?'正常工况':invoke_state_2 eq 1?'溢流':'警报状态'} --%></h1>
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
   
    <script  type='text/javascript'>
			    //假设每隔5秒发送一次请求
			     window.onload = function () {
			        getApi();
			    } 
			    var myData=[];//设定值
			    var myData2=[];//实际值
			    var data=[];//入口流量
			    var data2=[];//出口流量
			    
			    var inletFlow;//入口流量更新值
			    var outletFlow;//出口流量更新值
			    
			    var dateTime1;//日期
			    
			    
			    function getApi() {
			        //设置时间 5-秒  1000-毫秒  这里设置你自己想要的时间 
			        setTimeout(getApi,1*1000);
			        var optionJson=[];
				    $.ajax({
				        type:"POST",
				        url:"back/ajax_Demo_0",
				        data:{},
				        async: false,
				        success:function (data) {
				            optionJson=data;			      
				            optionJson.oil_2time
				            var state1 = optionJson.pmml_state_1;
				            var state_1 = "";
				            var state2 = optionJson.invoke_state_2;
				            var state_2 = "";
				            if(state1==0){
				            	state_1="停泵";
				            }else if(state1==1){
				            	state_1="钻进";
				            }else if(state1==2){
				            	state_1="循环";
				            }else if(state1==3){
				            	state_1="接单根";
				            }else if(state1==4){
				            	state_1="起钻";
				            }else if(state1==5){
				            	state_1="下钻";
				            }else{
				            	state_1="暂无";
				            }
				           
				            document.getElementById("time").value = optionJson.oil_2time;
				            //工况1
				            document.getElementById("gongkuang").innerHTML = state_1;//optionJson.pmml_state_1.eq(0)?'停泵': optionJson.pmml_state_1.eq(1)?'钻进':optionJson.pmml_state_1.eq(2)?'循环':optionJson.pmml_state_1.eq(3)?'接单根':optionJson.pmml_state_1.eq(4)?'起钻':optionJson.pmml_state_1.eq(5)?'下钻':'暂无';
				            //入口流量
				            inletFlow = optionJson.oil_2inletFlow;
				            //出口流量
							document.getElementById("4").value = optionJson.oil_2outletFlow;
							outletFlow=optionJson.oil_2outletFlow;
				            //入口密度
							document.getElementById("11").value = optionJson.oil_2inletDensitylog;
							//出口密度
							document.getElementById("12").value = optionJson.oil_2outletDensitylog;
							//立管压力
							document.getElementById("5").value = optionJson.oil_2standpipePressurelog;
							//回压测量
							document.getElementById("10").value = optionJson.oil_2wellMouthAdjustment;
							//工况2
				            document.getElementById("gongkuang2").innerHTML = "程序异常";//optionJson.invoke_state_2.eq(2) ?'程序异常':optionJson.invoke_state_2.eq(0)?'正常工况':optionJson.invoke_state_2.eq(1)?'溢流':'警报状态';
				        	//图1日期
							dateTime1 = optionJson.oil_2Date;
				        	//流量偏差,出-入
				        	document.getElementById("liuliangpiancha").innerHTML = outletFlow - inletFlow;
				        }
				    });
			    }
			    
			    
			    //-----------------------------------------------------------------------------------图2---------------------------------------------
		           var myChart = echarts.init(document.getElementById('main2'));
		    	  
			    
                   function randomData(x,rukouliuliang) { //入口流量生成函数，参数是实时日期和入口流量，将其转化为二元组
                            var riqi=x.substring(0,10);//获取实时日期
		    	            return {  
		    	                name: riqi,
		    	                
		    	                value: [  
		    	                    riqi,
		    	                     rukouliuliang //将下面生成的随机数value四舍五入
		    	                ]  //返回一个数组
		    	                 
		    	            }  
		    	    }
			       
			        
		    	 /*   function randonData2(x){
		    	      var riqi=x.substring(0,10);
		    	        return{
		    	            name:now2.toString(),
		    	
		    	            value:[
		    	            [now2.getFullYear(), now2.getMonth() + 1, now2.getDate()].join('/'),  //join方法用于把数组中的所有元素放入一个字符串。元素是通过指定的分隔符进行分隔的。
		    	                    Math.round(value2)  //将下面生成的随机数value四舍五入
		    	            ]
		    	        }
		    	    }*/
		
		    	        var now = +new Date(2015, 9, 3);  //起始时间
		    	        var now2 =+new Date(2015,9,3);
		    	        
		    			var oneDay = 24 * 3600 * 1000;  //一天一共有这些毫秒数
		    	        
		    	
		    			var value = Math.random() * 1000; //生成0~1000随机数 ，作为起始值
		    	        var value2=Math.random() * 1000;
		    	       
						for (var i = 0; i < 1000; i++) {  //生成一千个数
		    	            data.push(0);  //randomData是前面定义的函数，目的是算出每一天的数字
		    	        }  
		    	          
		    	
		    	        for(var i=0;i<1000;i++){
		    	            data2.push(0);
		    	        }
		    	       
		    			
		    			option = {  //echarts的图表选项
		    			            title: {  //标题，每个图表最多仅有一个标题控件
		    			                text: '流量'  
		    			            },  
		    			            tooltip: {  //提示框，鼠标悬浮时的交互提醒
		    			                trigger: 'axis',  //坐标轴触发，主要在柱状图，折线图等会使用类目轴的图表中使用。(不用改)
		    			            /*    formatter: function (params) {  //提示框浮层内容格式器，这里是通过回调函数格式实现////参数 params 是 formatter 需要的数据集
		    			                    //参数params不用改
		    			                     params = params[0]; //获取日期 
		    			                    var date = new Date(params.name);  //转化为Date格式
		    			                    return date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear() + ' : ' + params.value[1];  //悬浮的字符串 先日再月再年 
		    			                },  */
		    			                axisPointer: {  //坐标轴指示器配置项。是指示坐标轴当前刻度的工具 鼠标悬浮到图上，可以出现标线和刻度文本。
		    			                         type: 'cross'//我改成了十字交叉的样式，更酷炫
		    			                       // animation: false  
		    			                }  
		    			            },  
		    	
		    			            xAxis: {  //直角坐标系中横轴数组，数组中每一项代表一条横轴坐标轴，标准（1.0）中规定最多同时存在2条横轴
		    			                type: 'time', // 时间轴，适用于连续的时序数据，与数值轴相比时间轴带有时间的格式化 
		    			                splitLine: {  
		    			                    show: false //是否显示分割线
		    			                }  
		    			            },  
		    			            yAxis: {  //纵轴
		    			                type: 'value',  //数值轴，适用于连续数据。
		    			                boundaryGap: [0, '100%'], // boundaryGap是一个两个值的数组，分别表示数据最小值和最大值的延伸范围，可以直接设置数值或者相对的百分比，在设置 min 和 max 后无效。
		    			                splitLine: {  
		    			                    show: false  
		    			                }  
		    			            },  
		    			            dataZoom: [{//缩放
		    			                start:0//开始的百分比，也可以设置结束的百分比或者开始结束的绝对数值，但是不能没有东西
		    			                 }, {
		    			            type: 'slider'//鼠标拖拽
		    			        }],
		    			        
		    			        toolbox: {//工具箱
		    			            left: '400px',
		    			            feature: {
		    			               /* dataZoom: {
		    			                    yAxisIndex: 'none'
		    			                },*/
		    			               // restore: {},//还原功能
		    			               myfirst:{//自定义按钮 danielinbiti,这里增加，selfbuttons可以随便取名字  
		    			                   show:true,//是否显示  
		    			                   title:'还原', //鼠标移动上去显示的文字  
		    			                   icon:'path://M258.56 681.36l-12.704 44.288a16 16 0 0 1-7.616 9.584l-24.752 13.712a14.464 14.464 0 0 1-20.928-16.64l38.128-132.96a11.136 11.136 0 0 1 13.76-7.632l132.976 38.128a14.464 14.464 0 0 1 3.04 26.56l-24.768 13.712a16 16 0 0 1-12.16 1.392l-42.016-12.048a264.112 264.112 0 0 0 468.112-41.76 14.288 14.288 0 0 1 3.296-4.912 263.424 263.424 0 0 0 16.768-92.784c0-90.496-45.536-170.368-114.96-217.92a264.112 264.112 0 0 0-393.808 118.8 14.336 14.336 0 0 1-17.968 8.16l-20.256-7.024a12.352 12.352 0 0 1-7.456-16.192A312.112 312.112 0 0 1 525.696 208c66.112 0 128.256 20.752 179.44 56.736a313.12 313.12 0 0 1 108.656 135.312 311.04 311.04 0 0 1 23.904 119.952c0 172.32-139.68 312-312 312v-0.208h-0.832c-110.96 0-210.768-59.296-266.304-150.432z', //图标  
		    			                 //  option:{},  
		    			                   onclick:function() {//点击事件,这里的option1是chart的option信息  
		    			                        var cloneoption1=myChart.getOption();
		    			                        cloneoption1.dataZoom[0].end =100;
		    			                        myChart.setOption(cloneoption1,true);
		    			                      //  var temp=myChartmyChart.getOption();
		    			                     //  option1.dataZoom[0].end=100;
		    			                        // alert('1');//这里可以加入自己的处理代码，切换不同的图形  
		    			                         },  
		    			                    },
		    			                saveAsImage: {},//图片存储
		    			                mysecond:{
		    			                        show:true,
		    			                        title:'设置',
		    			                        icon:'path://M800 520C800 365.36 674.64 240 520 240S240 365.36 240 520 365.36 800 520 800 800 674.64 800 520z m48 0C848 701.152 701.152 848 520 848S192 701.152 192 520 338.848 192 520 192 848 338.848 848 520z m-440-16h240a16 16 0 0 1 16 16v16a16 16 0 0 1-16 16h-240a16 16 0 0 1-16-16v-16a16 16 0 0 1 16-16z',
		    			                        onclick:function the1(){
		    			                            var name1=prompt("请输入一个大于零小于100的整数","");
		    			                           if( name1 == "" || name1 == null){
		    	
		    			                           }
		    			                            else if(name1<=100&&name1>0){
		    			          var opppp= myChart.getOption();
		    			            opppp.dataZoom[0].end =name1;
		    			            //option1.animation = false;
		    			            //console.log(op.dataZoom[0].end);
		    			            myChart.setOption(opppp,true);
		    			                            }else{
		    			                                alert("重新输入");
		    			                                the1();
		    			                            }
		    			                        }
		    			                       
		    	
		    			                    }
		    			            }
		    			        },
		    			            series: [{  //驱动图表生成的数据内容  //系列列表。每个系列通过 type 决定自己的图表类型 //应该一定要有
		    			              //  name: '模拟数据',  //暂时不知道啥意思。。。。注释掉没发现异常
		    			                type: 'line',  //代表折线图
		    			                //name='A',
		    			                showSymbol: false,  //不显示标志。。。
		    			                hoverAnimation: false,  //是否开启 hover 在拐点标志上的提示动画效果。
		    			                data: data  //右边这个data指的是前面的data数组。通常来说，数据用一个二维数组表示。咱们的数据要放到这里面
		    			//当某维度对应于时间轴（type 为 'time'）的时候，值应该表示时间
		    			            },{
		    			            type:'line',
		    			          // name='B',
		    			            showSymbol:false,
		    			            hoverAnimation:false,
		    			            data:data2
		    			}]  
		    			        };  
		    			var len={
		    			    data:['入口流量','出口流量'],
		    			};
		    			option.legend=len;
		    			option.series[0].name=len.data[0];
		    			option.series[1].name=len.data[1];
		    	//		    option.legend =abc;
		    			 //myChart.setOption(option);//如果测试阶段不想让他动，，可以吧这个拿出来，再把下面的注释掉
		    	
		    	
		    	
		    	//每隔一定时间执行里面的匿名函数，时间间隔是第二个参数，单位是毫秒
		    	      setInterval(function () {  
		    	          
		    	           // for (var i = 0; i < 5; i++) {  //每次生成五个数据
		    	                data.shift();  //把第一个数据扔了
		    	                data.push(randomData(dateTime1,inletFlow));  //在生成一个数据
		    	                data2.shift();
		    	                data2.push(randomData(dateTime1,outletFlow));
		    	         //   }  
		    	           myChart.setOption(option);//更新一次图表
		    	//因此mychart.setOption这个函数是很重要的函数，负责更新图表，咱们也应该使用上面的for循环，注意调节更新速度
		    	        }, 100);  
			</script>
   
     <script type="text/javascript"> 
      var myChartmyChart = echarts.init(document.getElementById('main'));
      var myNow = +new Date(1997, 9, 3);  //起始时间
      var myNow2 =+new Date(1997,9,3);//又一个起始时间
        var oneDayDay = 24 * 3600 * 1000;  //一天一共有这些毫秒数
        function newRandom(){
                myNow=new Date(+myNow +oneDayDay);
                myValue=myValue+Math.random() * 21 - 10;

                return  {
                    name:myNow.toString(),
                    value:[
                [myNow.getFullYear(), myNow.getMonth() + 1, myNow.getDate()].join('/'),  //join方法用于把数组中的所有元素放入一个字符串。元素是通过指定的分隔符进行分隔的。
                    Math.round(myValue) //将下面生成的随机数value四舍五入
                ]}
}

		function newRandom2(){
		    myNow2=new Date(+myNow2 +oneDayDay);
		    myValue2=myValue2+Math.random() * 21 - 10;
		    return  {
		                    name:myNow2.toString(),
		                    value:[
		               [myNow2.getFullYear(), myNow2.getMonth() + 1, myNow2.getDate()].join('/'),  //join方法用于把数组中的所有元素放入一个字符串。元素是通过指定的分隔符进行分隔的。
		                    Math.round(myValue2) //将下面生成的随机数value四舍五入
		                ]}
		}
		
		
        var myValue=Math.random()*1000;
        var myValue2=Math.random()*2000;
        //咱们应该不需要这些，应该将各个以字符串存储的日期转化为Date对象。
        //var myData = [];  //数据存储在这里面
        //var myData2=[];
    //    var now = +new Date(1997, 9, 3);  //起始时间
      //  var oneDay = 24 * 3600 * 1000;  //一天一共有这些毫秒数
       // var value = Math.random() * 1000; //生成0~1000随机数 ，作为起始值
//var value2=Math.random() * 1000;
        for (var i = 0; i < 1000; i++) {  //生成一千个数
            myData.push(newRandom());  //randomData是前面定义的函数，目的是算出每一天的数字
        }  
        for (var i=0;i<1000;i++){
            myData2.push(newRandom2());
        } 
       

               option1 = {  //echarts的图表选项
            title: {  //标题，每个图表最多仅有一个标题控件
                text: '井口压力'  
            },  
            tooltip: {  //提示框，鼠标悬浮时的交互提醒
                trigger: 'axis',  //坐标轴触发，主要在柱状图，折线图等会使用类目轴的图表中使用。(不用改)
               /* formatter: function (params) {  //提示框浮层内容格式器，这里是通过回调函数格式实现////参数 params 是 formatter 需要的数据集
                    //参数params不用改
                     params = params[0]; //获取日期 
                    var date = new Date(params.name);  //转化为Date格式
                    return date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear() + ' : ' +'<br/>'+'A'+ params.value[1]+'B'+params.value[2];  //悬浮的字符串 先日再月再年 
                },*/  
                axisPointer: {  //坐标轴指示器配置项。是指示坐标轴当前刻度的工具 鼠标悬浮到图上，可以出现标线和刻度文本。
                         type: 'cross'//我改成了十字交叉的样式，更酷炫
                       // animation: false  
                }  
            },  
           /* legend: {
                data: ['系列一', '系列二'],
            },*/
            xAxis: {  //直角坐标系中横轴数组，数组中每一项代表一条横轴坐标轴，标准（1.0）中规定最多同时存在2条横轴
                type: 'time', // 时间轴，适用于连续的时序数据，与数值轴相比时间轴带有时间的格式化 
                splitLine: {  
                    show: false //是否显示分割线
                }  
            },  
            yAxis: {  //纵轴
                type: 'value',  //数值轴，适用于连续数据。
                boundaryGap: [0, '100%'], // boundaryGap是一个两个值的数组，分别表示数据最小值和最大值的延伸范围，可以直接设置数值或者相对的百分比，在设置 min 和 max 后无效。
                splitLine: {  
                    show: false  
                }  
            },  
            dataZoom: [{//缩放
                start:0,
                //开始的百分比，也可以设置结束的百分比或者开始结束的绝对数值，但是不能没有东西
                 }, {
            type: 'slider',//鼠标拖拽
            realtime:false
            
           // shadowOffsetX = 10
        }],
        
        toolbox: {//工具箱
        show:true,
            left: '400px',
            feature: {
               
               /* dataZoom: {
                    yAxisIndex: 'none'
                },*/
              // restore: {},//还原功能
                
                myselfButtons:{//自定义按钮 danielinbiti,这里增加，selfbuttons可以随便取名字  
                   show:true,//是否显示  
                   title:'自定义', //鼠标移动上去显示的文字  
                   icon:'path://M258.56 681.36l-12.704 44.288a16 16 0 0 1-7.616 9.584l-24.752 13.712a14.464 14.464 0 0 1-20.928-16.64l38.128-132.96a11.136 11.136 0 0 1 13.76-7.632l132.976 38.128a14.464 14.464 0 0 1 3.04 26.56l-24.768 13.712a16 16 0 0 1-12.16 1.392l-42.016-12.048a264.112 264.112 0 0 0 468.112-41.76 14.288 14.288 0 0 1 3.296-4.912 263.424 263.424 0 0 0 16.768-92.784c0-90.496-45.536-170.368-114.96-217.92a264.112 264.112 0 0 0-393.808 118.8 14.336 14.336 0 0 1-17.968 8.16l-20.256-7.024a12.352 12.352 0 0 1-7.456-16.192A312.112 312.112 0 0 1 525.696 208c66.112 0 128.256 20.752 179.44 56.736a313.12 313.12 0 0 1 108.656 135.312 311.04 311.04 0 0 1 23.904 119.952c0 172.32-139.68 312-312 312v-0.208h-0.832c-110.96 0-210.768-59.296-266.304-150.432z', //图标  
                 //  option:{},  
                   onclick:function() {//点击事件,这里的option1是chart的option信息  
                        var cloneoption=myChartmyChart.getOption();
                        cloneoption.dataZoom[0].end =100;
                        myChartmyChart.setOption(cloneoption,true);
                      //  var temp=myChartmyChart.getOption();
                     //  option1.dataZoom[0].end=100;
                        // alert('1');//这里可以加入自己的处理代码，切换不同的图形  
                         },  
                    },
                    saveAsImage: {},//图片存储
                    myotherButton:{
                        show:true,
                        title:'设置',
                        icon:'path://M800 520C800 365.36 674.64 240 520 240S240 365.36 240 520 365.36 800 520 800 800 674.64 800 520z m48 0C848 701.152 701.152 848 520 848S192 701.152 192 520 338.848 192 520 192 848 338.848 848 520z m-440-16h240a16 16 0 0 1 16 16v16a16 16 0 0 1-16 16h-240a16 16 0 0 1-16-16v-16a16 16 0 0 1 16-16z',
                        onclick:function the(){
                            var name=prompt("请输入一个大于零小于100的整数","");
                           if( name == "" || name == null){

                           }
                            else if(name<=100&&name>0){
          var oppp= myChartmyChart.getOption();
            oppp.dataZoom[0].end =name;
            //option1.animation = false;
            //console.log(op.dataZoom[0].end);
            myChartmyChart.setOption(oppp,true);
                            }else{
                                alert("重新输入");
                                the();
                            }
                        }
                       

                    }

            }
        },
            series: [{  //驱动图表生成的数据内容  //系列列表。每个系列通过 type 决定自己的图表类型 //应该一定要有
              //  name: '模拟数据',  //暂时不知道啥意思。。。。注释掉没发现异常
                type: 'line',  //代表折线图
               // name='系列一',
                showSymbol: false,  //不显示标志。。。
                hoverAnimation: false,  //是否开启 hover 在拐点标志上的提示动画效果。
                data: myData  //右边这个data指的是前面的data数组。通常来说，数据用一个二维数组表示。咱们的数据要放到这里面
//当某维度对应于时间轴（type 为 'time'）的时候，值应该表示时间
            },{
            type:'line',
          //  name:'系列二',
            showSymbol:false,
            hoverAnimation:false,
            data:myData2
}]  
        }; // var temp=option1.dataZoom[0].end;

			var len1={
			    data:['设定值','测量值'],
			};
			option1.legend=len1;
			option1.series[0].name=len1.data[0];
			option1.series[1].name=len1.data[1];
 //myChart.setOption(option);//如果测试阶段不想让他动，，可以吧这个拿出来，再把下面的注释掉
 //myChart.setOption(option);//如果测试阶段不想让他动，，可以吧这个拿出来，再把下面的注释掉
       //每隔一定时间执行里面的匿名函数，时间间隔是第二个参数，单位是毫秒
      setInterval(function () {  
          
            for (var i = 0; i < 5; i++) {  //每次生成五个数据
                myData.shift();  //把第一个数据扔了
                myData.push(newRandom());  //在生成一个数据
                myData2.shift();
                myData2.push(newRandom2());
            }  
           myChartmyChart.setOption(option1);//更新一次图表
//因此mychart.setOption这个函数是很重要的函数，负责更新图表，咱们也应该使用上面的for循环，注意调节更新速度
        }, 100);  
     </script>
     
	
	
         
     <script type="text/javascript">
	    	function pumpAdd() {
	    		var d = top.dialog({
	    		    title: '泵参数',
	    		    width:1500,
	    		    url: 'back/pumpAdd',
	    		    onclose:function(){
	    		    	window.location.reload();
	    		    }
	    		});
	    		d.showModal();
			}
	     </script>
     
     
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>