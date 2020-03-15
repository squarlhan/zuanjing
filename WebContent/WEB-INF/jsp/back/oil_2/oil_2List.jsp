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
<meta charset="UTF-8">
    <title>*****</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
   <script type="text/javascript" src="artDialog/dist/dialog-plus.js"></script>
	<link href="artDialog/css/ui-dialog.css" rel="stylesheet"
    type="text/css" />
    <script type="text/javascript">
    	function oilAdd(){
    		var d = top.dialog({//加了top是在最顶层打开
    		    title:'添加数据',
    		    width:400,
    		    url:'back/oil_2Add',//页面跳转
    		    onclose:function(){
    		    	window.location.reload();//刷新页面
    		    }
    		});
    		d.showModal();
    	}
    	
		function none(){
    		var d = top.dialog({
    			title:'功能尚未完善',
    			width:100,
    			alert('功能未完善'),
    			onclose:function(){
    		    	window.location.reload();//刷新页面
    		    }
    		});
    		d.showModal
    	}
    	function oilMdi(time){
    		var d = top.dialog({//加了top是在最顶层打开
    		    title: '修改数据',
    		    width:400,
    		    url:'back/oil_2Mdi?time='+time,//页面跳转,类似超链接。但是怎么就能传过来id呢？
    		    onclose:function(){
    		    	window.location.reload();//刷新页面
    		    }
    		});
    		d.showModal();
    	}
    	function oilDel(time){
    		var d = top.dialog({//加了top是在最顶层打开
    		    title: '删除数据',
    		    width:400,
    		    url:'back/oil_2Del?time='+time,//页面跳转,类似超链接。但是怎么就能传过来id呢？
    		    onclose:function(){
    		    	window.location.reload();//刷新页面
    		    }
    		});
    		d.showModal();
    	}
    	
    	
    </script>
  </head>
  
  <body>
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
      <%--   <a>
          <cite>导航元素</cite></a> --%>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row">
 <!-- 搜索--------------------------------------------------------------------------- -->
        <form class="layui-form layui-col-md12 x-so" action="back/oil_2List" method="post">
          <!-- <input class="layui-input" placeholder="开始日" name="start" id="start">
          <input class="layui-input" placeholder="截止日" name="end" id="end"> -->
          <input type="text" name="time1"  placeholder="选择起始时间" autocomplete="off" class="layui-input" value="${oil_2.time }">
          <input type="text" name="time2"  placeholder="选择截止时间" autocomplete="off" class="layui-input" value="${oil_2.time }">
      	  <!-- 改成选择时间段、选择属性 -->
          <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
      </div>
      <xblock>
        <button class="layui-btn layui-btn-danger" onclick="none()"></i><%-- <i class="layui-icon">是图标不？批量删除--%>列表显示</button>
        <button class="layui-btn" onclick="none()"><%--"userAdd()"><i class="layui-icon"></i>添加 --%>折线显示</button>
       
       
        <span class="x-right" style="line-height:40px">共有数据：${count }条</span>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>
            	建议
              <%-- 这里面的是单选框<div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div> --%>
            </th>
            <td>状态</td>
            <td>时间</td>
            <td>立管压力</td>
            <td>出口流量</td>
            <td>大钩高度</td>
            <th>操作</th>
        </thead>
 <!-- ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo -->      
        <tbody>
        	<c:forEach items="${oil_2List }" var="oil_2">
		          <tr>
		            <td>
		              <!-- <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div> -->
		              	数据正常
		            </td>
		        
		            <td>${oil_2.time }</td>
            		<td>${oil_2.wellDep}</td>
            		<td>${oil_2.hangDownDeep}</td>
            		<td>${oil_2.kellyDown}</td>
		            <td class="td-manage">
		             <a title="查看全部属性"  onclick="seek(${oil_2.time})" href="javascript:;">
		                <i class="layui-icon">&#xe642;</i>
		                	查看全部属性
		              </a>
					  <%--  
		              <a title="删除" onclick="userDel(${user.user_id})" href="javascript:;">
		                <i class="layui-icon">&#xe640;</i>
		              </a> 
		              --%>    
		            </td>
		          </tr>									
          </c:forEach>
        </tbody>
<!-- ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo -->      
      </table>
 <!-- 引入page -->
      <jsp:include page="../main/pages.jsp"></jsp:include>

    </div>
    <script>
      layui.use('laydate', function(){
        var laydate = layui.laydate;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
      });

       /*用户-停用*/
      function member_stop(obj,id){
          layer.confirm('确认要停用吗？',function(index){

              if($(obj).attr('title')=='启用'){

                //发异步把用户状态进行更改
                $(obj).attr('title','停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!',{icon: 5,time:1000});

              }else{
                $(obj).attr('title','启用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!',{icon: 5,time:1000});
              }
              
          });
      }

      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              $(obj).parents("tr").remove();
              layer.msg('已删除!',{icon:1,time:1000});
          });
      }



      function delAll (argument) {

        var data = tableCheck.getData();
  
        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
      }
    </script>
    <script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();</script>
  </body>

</html>