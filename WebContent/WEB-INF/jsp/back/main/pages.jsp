
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
      	function jumpPage(pages) {
			$("#pages").val(pages);//id选择器
			$("#pageForm").submit();
		}
      </script>
  
  
      <form id="pageForm" action="${url }" method="post"><!-- 防止查询后仍然可以翻页，这个url从controller里传过来的 -->
     	 <input type="hidden" name="user_name"  value="${user.user_name }">
         <input type="hidden" name="user_account" value="${user.user_account }">
      	 <input type="hidden" name="role_name"  value="${role.role_name }">
      	 <input type="hidden" name="time"       value="${oil.time} ">
      	
      	<div class="page">
      	当前第<font color="red">${pages }</font>页，共<font color="green">${sumPage }</font>页
      	</div>
      	 
      	 
      	 <input type="hidden" name="pages" id="pages">
<!-- ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo -->
	      <div class="page">
	        <div>
	          <a class="num" href="javascript:jumpPage(1);">首页</a>
	          <a class="num" href="javascript:jumpPage(${(pages-1>0)?(pages-1):1 });">上一页</a>
	          <a class="num" href="javascript:jumpPage(${(pages+1>sumPage)?sumPage:(pages+1) });">下一页</a>
	          <a class="num" href="javascript:jumpPage(${sumPage });">尾页</a>
	        </div>
<!-- ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo -->
	      </div>
      </form>