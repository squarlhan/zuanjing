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

        <script src="js/jquery-3.4.1.min.js"></script>  
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
                                       
                      display:inline-block;
                     width: 50%;            
                 }
                 
                 .right{
                         text-align:center;               
                      display:inline-block;
                      margin-left:-5px;                
                      width:50%;
                 }
              </style>
		<title>控压钻井远程测控系统</title>
	</head>
	<body>	
	
	   <h2>时间</h2>
     
          <form class="layui-form layui-col-md12 x-so" action="back/oil_2Table" method="post">
          <input type="text" name="oil_2_time"  placeholder="输入个时间" autocomplete="off" class="layui-input" value="${oil_2.time}"><!-- value属性是为了将输入的值回显 -->
          <button value="点我显示数据" class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
       	  </form>
       	  
       	  
		<div class="container">
        	<!-- 动图 -->
        <div class="clearfix" style="margin-top: 20px;margin-bottom: 5px;">
            <section class="row clearfix" >
               <div class="containerer">
                               <div class="left" id="main" style="width: 570px;height:300px;"><!-- 左侧动图 -->
                                
                              </div>
                               <div class="right" id="main2" style="width: 570px;height:300px;" ><!-- 右侧动图 -->
                              
                               </div>
                           </div>   

           	</section>
        </div>
       
		<div class="clearfix" style="margin-bottom: 5px;">
        <section class="row">
         <p  class="col-md-3"  align="center">压力偏差：</p>
         <p id="yalipiancha" class="col-md-2"  align="center">  </p>
         <p  class="col-md-4"  align="center">流量偏差：</p>
         <p  id ="liuliangpiancha"class="col-md-2"  align="center">  </p>
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
             
             
                <center class="col-md-3">环空摩阻（MPa）</center>
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
     
			       /*
			       function randonData2(){
			        now2=new Date(+now +oneDay);
			        value2=value2 +Math.random()*21-9;
			        return{
			            name:now2.toString(),
			
			            value:[
			            [now2.getFullYear(), now2.getMonth() + 1, now2.getDate()].join('/'),  //join方法用于把数组中的所有元素放入一个字符串。元素是通过指定的分隔符进行分隔的。
			                    Math.round(value2)  //将下面生成的随机数value四舍五入
				          	  ]
				       	 }
				   	 }
			        //咱们应该不需要这些，应该将各个以字符串存储的日期转化为Date对象。
			        var data = [];  //数据存储在这里面
			        var now = +new Date(1997, 9, 3);  //起始时间
			        var oneDay = 24 * 3600 * 1000;  //一天一共有这些毫秒数
			        var value = Math.random() * 1000; //生成0~1000随机数 ，作为起始值
					var value2=Math.random() * 1000;
			       */
        </script>
     	
     	<script type="text/javascript"> 
     	//******************************************************左侧的动图*************************************
		     	  var myChartmyChart = echarts.init(document.getElementById('main'));
			      
     	
     			  var myNow = +new Date(1997, 9, 3);  //起始时间
			      var myNow2 =+new Date(1997,9,3);//又一个起始时间
		       	  var oneDayDay = 24 * 3600 * 1000;  //一天一共有这些毫秒数
		
		
		      	  //获取数据
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
		        
		
				var myData = [];  //数据存储在这里面
		        var myData2= [];  
		    
		
				//让myData实时更新，往myData里实时读数。用ajax
		        for (var i = 0; i < 1000; i++) {  //生成一千个数
		            myData.push(newRandom());  //randomData是前面定义的函数，目的是算出每一天的数字
		        }  
		        for (var i=0;i<1000;i++){
		            myData2.push(newRandom2());//第一张折线图里的第二条线
		        }
		        // var data2=[];
		
		       
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
		         	/*legend: {
		                data: ['A', 'B']
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
		                start:0//开始的百分比，也可以设置结束的百分比或者开始结束的绝对数值，但是不能没有东西
		                 }, {
		            type: 'slider'//鼠标拖拽
		        }],
		        
		        
		        toolbox: {//工具箱
		            left: 'center',
		            feature: {
		               /* dataZoom: {
		                    yAxisIndex: 'none'
		                },*/
		               restore: {},//还原功能
		                saveAsImage: {}//图片存储
		            }
		        },
		            
		
				series: [{  //驱动图表生成的数据内容  //系列列表。每个系列通过 type 决定自己的图表类型 //应该一定要有
		              //  name: '模拟数据',  //暂时不知道啥意思。。。。注释掉没发现异常
		                type: 'line',  //代表折线图
		               // name='A',
		                showSymbol: false,  //不显示标志。。。
		                hoverAnimation: false,  //是否开启 hover 在拐点标志上的提示动画效果。
		                data: myData  //右边这个data指的是前面的data数组。通常来说，数据用一个二维数组表示。咱们的数据要放到这里面
		//当某维度对应于时间轴（type 为 'time'）的时候，值应该表示时间
		           		 },{
			            type:'line',
			          //  name:'B',
			            showSymbol:false,
			            hoverAnimation:false,
			            data:myData2
						}]  
		        };  
		 	   //myChart.setOption(option);//如果测试阶段不想让他动，，可以吧这个拿出来，再把下面的注释掉
		     
		 //每隔一定时间执行里面的匿名函数，时间间隔是第二个参数，单位是毫秒
		
			   //这里现在跑的是固定了的数据，如何在这里实现异步刷新呢？
		      setInterval(function () {  
		          
		            for (var i = 0; i < 5; i++) {  //每次生成五个数据
		                myData.shift();  //把第一个数据扔了
		                myData.push(newRandom());  //在生成一个数据
		                
						myData2.shift();//第一张图里的第二个折现
		                myData2.push(newRandom2());
		            }  
		           myChartmyChart.setOption(option1);//更新一次图表
		//因此mychart.setOption这个函数是很重要的函数，负责更新图表，咱们也应该使用上面的for循环，注意调节更新速度
		        }, 100);  
    	</script>

 	 	<script type="text/javascript"> 

			   var myChart = echarts.init(document.getElementById('main2'));
			          
			   function randomData() {  //生成我们需要的数据，返回一个X轴为日期，Y轴是数字的二维数组（随机）
			            now = new Date(+now + oneDay);//+号是对后面的对象求valueOf的意思，返回毫秒  
			//加oneDay的意思就是往后算一天
			//如果是咱们做图，应该不需要这个函数
			            value = value + Math.random() * 21 - 10;  //[-10,11]，表示Y轴数据的波动，因为都是用value去加，因此呈现总体递增趋势
			            return {  
			                name: now.toString(),  //将日期转换为字符串形式，便于输出
			                
			                value: [  //返回年份，返回月份（需要+1，因为月份范围是0~11），返回日期。生成一个用/隔开的字符串
			                    [now.getFullYear(), now.getMonth() + 1, now.getDate()].join('/'),  //join方法用于把数组中的所有元素放入一个字符串。元素是通过指定的分隔符进行分隔的。
			                    Math.round(value)  //将下面生成的随机数value四舍五入
			                ]  //返回一个数组
			                 
			            }  
			        }  
			    
			
				function randonData2(){
			        now2=new Date(+now2 +oneDay);
			        value2=value2 +Math.random()*21-9;
			        return{
			            name:now2.toString(),
			
			            value:[
			            [now2.getFullYear(), now2.getMonth() + 1, now2.getDate()].join('/'),  //join方法用于把数组中的所有元素放入一个字符串。元素是通过指定的分隔符进行分隔的。
			                    Math.round(value2)  //将下面生成的随机数value四舍五入
			            ]
			        }
			    }
			        //咱们应该不需要这些，应该将各个以字符串存储的日期转化为Date对象。

			        
					var now = +new Date(1997, 9, 3);  //起始时间
			        var now2 =+new Date(1997,9,3);
			        
					var oneDay = 24 * 3600 * 1000;  //一天一共有这些毫秒数
			       
					var value = Math.random() * 1000; //生成0~1000随机数 ，作为起始值
					var value2= Math.random() * 1000;
			       
			        var data = [];  //数据存储在这里面		
	      			var data2=[];
					
					for (var i = 0; i < 1000; i++) {  //生成一千个数
			            data.push(randomData());  //randomData是前面定义的函数，目的是算出每一天的数字
			        }  
			         
			        for(var i=0;i<1000;i++){
			            data2.push(randonData2());
			        }
			       
				
			option = {  //echarts的图表选项
			            title: {  //标题，每个图表最多仅有一个标题控件
			                text: '出入口流量'  
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
			          	    left: 'center',
			            	feature: {
			               /* dataZoom: {
			                    yAxisIndex: 'none'
			                },*/
			                restore: {},//还原功能
			                saveAsImage: {}//图片存储
			           		 }
			      		},
			      		
			      		
			            series: [{  //驱动图表生成的数据内容  //系列列表。每个系列通过 type 决定自己的图表类型 //应该一定要有
			              	//  name: '模拟数据',  //暂时不知道啥意思。。。。注释掉没发现异常
			                type: 'line',  //代表折线图
			              	/// name='A',
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
			
			
			 	  //myChart.setOption(option);//如果测试阶段不想让他动，，可以吧这个拿出来，再把下面的注释掉
			      //每隔一定时间执行里面的匿名函数，时间间隔是第二个参数，单位是毫秒
			      setInterval(function () {  
			          
			            for (var i = 0; i < 5; i++) {  //每次生成五个数据
			                data.shift();  //把第一个数据扔了
			                data.push(randomData());  //在生成一个数据
			                data2.shift();
			                data2.push(randonData2());
			            }  
			           myChart.setOption(option);//更新一次图表
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
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 
	
	
	
	</body>
</html>