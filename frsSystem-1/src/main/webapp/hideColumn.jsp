<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Loss-Reporter后台管理系统</title>
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css" media="all">
		<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
		
</head>
<body class="childrenBody">
<div style="text-align: center;">选择需要隐藏的列</div>
	<form class="layui-form form" action="#">
				
			<div class="layui-form-item">
    <div class="layui-input-block">
       <input type="checkbox" name="like[write]" title="Upp_did" lay-filter="filter" value="Upp_did">
      <input type="checkbox" name="like[read]" title="Parts_Code"  lay-filter="filter" value="Parts_Code">
      <input type="checkbox" name="like[dai]" title="料架" lay-filter="filter" value="料架">
      <input type="checkbox" name="like[dai]" title="线别" lay-filter="filter" value="线别">
      <input type="checkbox" name="like[dai]" title="did" lay-filter="filter" value="did">
      <input type="checkbox" name="like[dai]" title="基板" lay-filter="filter"value="基板" >
      <input type="checkbox" name="like[dai]" title="余数" lay-filter="filter" value="余数"> 
    	<!-- <input type="checkbox" checked lay-skin="switch" lay-filter="encrypt" title="是否加密"> -->
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="sub">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
  <!-- 更多表单结构排版请移步文档左侧【页面元素-表单】一项阅览 -->
</form>
	<script type="text/javascript">
	layui.use(['form','jquery','layer'], function(){
		var $ = layui.jquery
		,form = layui.form
		,layer = layui.layer;
		  
		
		form.on('submit(sub)', function(data){
			obj.join('_');
			$("#c", window.parent.document).val(obj);
			  var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
			 parent.layer.close(index);  
			// addSuccess(11);
			  parent.warn(11);
			//location.href="${pageContext.request.contextPath}/to_frsHideColumn?arr="+encodeURI(encodeURI(obj))+"";
			return false;	
		});      
			  
		
		function renderForm(){
			   form.render();
			 }
		
		  var obj=new Array();
		form.on('checkbox(filter)', function(data){
			if(data.elem.checked){
				obj.push(data.value);
			}
			else{
				for(var i=0;i<obj.length;i++){
					if(obj[i]==data.value){
						var index = obj.indexOf(data.value);
						if (index > -1) {
							obj.splice(index, 1);
						}
					}
				}
			}
			});   
		  
		  function addSuccess(data){
			  layer.msg(data, {icon:6, time:3000}, function(index){
		            layer.close(index);
		            window.parent.location.reload();
		            var index = parent.layer.getFrameIndex(window.name);
		            parent.layer.close(index);
		            parent.pp();
		        }); 
		  }
		  
		  function fail(data){
			  layer.msg(data, {icon:5, time:3000}, function(index){
		            layer.close(index);
		            window.parent.location.reload();
		            var index = parent.layer.getFrameIndex(window.name);
		            parent.layer.close(index);
		        });
		  }
		  
		  function addFailed(){
			  layer.msg('服务器内部错误', {icon:5, time:3000}, function(index){
		            layer.close(index);
		            window.parent.location.reload();
		            var index = parent.layer.getFrameIndex(window.name);
		            parent.layer.close(index);
		        });
		  }

		});
	</script>
</body>
</html>