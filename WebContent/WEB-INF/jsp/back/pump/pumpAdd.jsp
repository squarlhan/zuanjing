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
<title>泵参数设</title>

	<link rel='stylesheet' href='css/jquery-ui.css'>
	<link rel='stylesheet prefetch' href='http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css'>
	<link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
</head>
<body>

			  <div class="container">
			  <form action="back/pumpAddDo" method="post" enctype="multipart/form-data" class="layui-form"> 
			  <h1 class="text-center">泵参数</h1>
			
			  <div id="table" class="table-editable">
<!-- 			    <span class="table-add glyphicon glyphicon-plus"></span>
 -->			    <table  id="tab" class="table">
			      <thead>
			      <tr>
			        <th class="text-center"></th>
			        <th class="text-center">泵缸套数</th>
			        <th class="text-center">冲程(mm)</th>
			        <th class="text-center">缸套直径(mm)</th>
			  <!--  <th></th>
			        <th></th> -->
			      </tr>
			      </thead>
			      <tr>
			        <td  name="editor">
			          1号泵
			        </td>
			        <td c  name="editor">
			          <input   type="number" onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''">
			        </td>
			        <td   name="editor">
			          <input  type="number" onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''">
			        </td>
			        <td   name="editor">
			          <input  type="number" onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''">
			        </td>
			        <!-- <td>
			          <span class="table-remove glyphicon glyphicon-remove"></span>
			        </td>
			        <td>
			          <span class="table-up glyphicon glyphicon-arrow-up"></span>
			          <span class="table-down glyphicon glyphicon-arrow-down"></span>
			        </td> -->
			      </tr>
			      <tr>
			        <td  name="editor">
			        	2号泵
			        </td>
			        <td   name="editor">
			          <input   type="number" onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''">
			        </td>
			        <td   name="editor">
			          <input  type="number" onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''">
			        </td>
			        <td   name="editor">
			          <input  type="number" onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''">
			        </td>
			 
			        <!-- <td>
			          <span class="table-remove glyphicon glyphicon-remove"></span>
			        </td>
			        <td>
			          <span class="table-up glyphicon glyphicon-arrow-up"></span>
			          <span class="table-down glyphicon glyphicon-arrow-down"></span>
			        </td> -->
			      </tr>
			      <tr>
			        <td  name="editor">
			          3号泵
			        </td>
			        <td   name="editor">
			          <input   type="number" onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''">
			        </td>
			        <td   name="editor">
			          <input  type="number" onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''">
			        </td>
			        <td   name="editor">
			          <input  type="number" onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''">
			        </td>
			        <!-- <td>
			          <span class="table-remove glyphicon glyphicon-remove"></span>
			        </td>
			        <td>
			          <span class="table-up glyphicon glyphicon-arrow-up"></span>
			          <span class="table-down glyphicon glyphicon-arrow-down"></span>
			        </td> -->
			      </tr>
			      <!-- This is our clonable table line -->
			      <tr class="hide">
			        <td name="editor">
			          <input   type="number" onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''">
			        </td>
			        <td   name="editor">
			          <input   type="number" onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''">
			        </td>
			        <td   name="editor">
			          <input  type="number" onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''">
			        </td>
			        <td   name="editor">
			          <input  type="number" onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''">
			        </td>
			        <!-- <td>
			          <span class="table-remove glyphicon glyphicon-remove"></span>
			        </td>
			        <td>
			          <span class="table-up glyphicon glyphicon-arrow-up"></span>
			          <span class="table-down glyphicon glyphicon-arrow-down"></span>
			        </td> -->
			      </tr>
			    </table>
			    
			    <section class="row">
			      <p class="col-md-4"></p>
			    <button class="col-md-4 btn-primary btn-lg" id="button-first"  onclick="close()"> 确定</button> 
			 	
			 	 <!--  <button  class="layui-btn" lay-filter="add" lay-submit=""> 
             		     确定
              	  </button> -->
			      
			      
			    </section>
			    
			  </form> 
			  </div>
		
			<script >
					function close() {
				        var dialog = top.dialog.get(window);//获取当前模态窗口
				        dialog.close();//关闭窗口
				        dialog.remove();//删掉窗口
				        return false;
				    }
			</script>
			  
			 <script>
			        layui.use(['form','layer'], function(){
			            $ = layui.jquery;
			          var form = layui.form
			       	     ,layer = layui.layer;		
			          //监听提交
			          form.on('submit(add)', function(data){
			            console.log(data);
			            form.submit();
			            return false;
			          });
			          
			          
			        });
  			 </script>
			 
			  
			  
			  
			  <script>
			    document.getElementsByName('editor').oninput = function () {
			      this.innerHTML = this.innerHTML.replace(/[\D]/g, '')
			      keepLastIndex(this)
			    }
			    function keepLastIndex(obj) {
			      if (window.getSelection) {
			        obj.focus();
			        var range = window.getSelection();
			        range.selectAllChildren(obj);
			        range.collapseToEnd();
			      }
			      else if (document.selection) {
			        var range = document.selection.createRange();
			        range.moveToElementText(obj);
			        range.collapse(false);
			        range.select();
			      }
			    }
			  </script>
			  <script src='js/jquery-3.4.1.min.js'></script>
			  <script src='http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js'></script><script src='http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.6.0/underscore.js'></script>
			
			  <script src="js/index.js"></script>


</body>
</html>