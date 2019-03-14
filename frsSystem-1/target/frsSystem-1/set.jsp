<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Loss-Reporter后台管理系统</title>
	 <%@include file="/common/header.jsp" %> 
</head>
<body class="childrenBody">
<input type="hidden" id="h1" value="<%=request.getParameter("lines")%>" />
<input type="hidden" id="h" value="<%=java.net.URLDecoder.decode(request.getParameter("v"), "utf-8")%>" />
	<form class="layui-form form" id="mainForm"   method="post" action="#">
		<div class="layui-form form" >
			<label class="layui-form-label">基板数</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input"  name="basicNum" id="basicNum"   placeholder="请输入基板数" />
			</div>
		</div>
		
		<div class="layui-form form" >
			<label class="layui-form-label">料带长度</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input"  name="limit_length" id="limit_length"   placeholder="请输入料带长度" />
			</div>
		</div>
		<div class="layui-form form" >
			<label class="layui-form-label">可用时间</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input"  name="limit_time" id="limit_time"   placeholder="请输入可用时间" />
			</div>
		</div>
		
		<div style="text-align: center;"><h2>选择需要隐藏的列</h2></div>
		<div class="layui-row" style="text-align: center;">
		
			<div class="layui-inline">
				<div class="layui-input-inline">
			    	<input type="checkbox" name="b" title="图标" lay-filter="filter" value="图标" />
			    </div>
			</div>
			<div class="layui-inline">
				<div class="layui-input-inline">
			    	<input type="checkbox" name="b" title="Upp_did" lay-filter="filter" value="Upp_did" />
			    </div>
			</div>
			<div class="layui-inline">
				<div class="layui-input-inline">
			    	<input type="checkbox" name="b" title="Parts_Code"  lay-filter="filter" value="Parts_Code" />
			    </div>
			</div>
			<div class="layui-inline">
				<div class="layui-input-inline">
			    	<input type="checkbox" name="b" title="料架" lay-filter="filter" value="料架" />
			    </div>
			</div>
		</div>
		<div class="layui-row" style="text-align: center;">
			<div class="layui-inline">
				<div class="layui-input-inline">
			    	<input type="checkbox" name="b" title="线别" lay-filter="filter" value="线别" />
			    </div>
			</div>
			<div class="layui-inline">
				<div class="layui-input-inline">
			    	<input type="checkbox" name="b" title="did" lay-filter="filter" value="did" />
			    </div>
			</div>
			<div class="layui-inline">
				<div class="layui-input-inline">
			    	<input type="checkbox" name="b" title="基板" lay-filter="filter" value="基板"  />
			    </div>
			</div>
			<div class="layui-inline">
				<div class="layui-input-inline">
			    	<input type="checkbox" name="b" title="余数" lay-filter="filter" value="余数" />
			    </div>
			</div>
			<div class="layui-inline">
				<div class="layui-input-inline">
			    	<input type="checkbox" name="b" title="料带长度" lay-filter="filter" value="料带长度" />
			    </div>
			</div>
			<div class="layui-inline">
				<div class="layui-input-inline">
			    	<input type="checkbox" name="b" title="设备名" lay-filter="filter" value="设备名" />
			    </div>
			</div>
			<div class="layui-inline">
				<div class="layui-input-inline">
			    	<input type="checkbox" name="b" title="TBLNO" lay-filter="filter" value="TBLNO" />
			    </div>
			</div>
		</div>
		<div style="text-align: center;"><h2>输入料架区域</h2></div>
  		<div class="layui-form form" >
			<label class="layui-form-label">料架区域</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input"  name="rackId"    placeholder="请输入料架区域，并以分号分割和结尾" />
			</div>
		</div>
  <div class="layui-form-item" style="text-align: center;">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="*">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
  <!-- 更多表单结构排版请移步文档左侧【页面元素-表单】一项阅览 -->
</form>
	 <%@include file="/common/version.jsp" %>  
	<script type="text/javascript">
	layui.use(['form','layer'], function(){
		var $ = layui.jquery
		,form = layui.form
		,layer = layui.layer;
		  
		init();
		getSets();
		
		
		function getSets(){
			$.ajax({
				url:'${pageContext.request.contextPath}/getSets',
				type:"post",
				success:function(data){
						$("#basicNum").val(data.da.basicNum);
						$("#limit_length").val(data.da.limit_length);
						$("#limit_time").val(data.da.limit_time);
				},
				error:function(data){
					//addFailed();
				}
				
			}); 
		}
		
		
		function init(){
			
			//这样获取的是一个数组
			var ci = document.getElementsByName("b");
			var v=$("#h").val().split(",");
			//遍历复选框数组  如果被选中ci[i].checked的值就是true
			for(var i = 0;i < ci.length;i++){
				for(var j=0;j<v.length;j++){
					if(ci[i].value==v[j]){
						 $("input[name='b'][value='"+ci[i].value+"']").attr("checked", true);
						 form.render();
				}
				}
			}

		}
		  
		  form.on('submit(*)',function(data){
			   var form = new FormData(document.getElementById("mainForm"));
			   $.ajax({
					url:"${pageContext.request.contextPath}/getDatas1?line_name="+$("#h1").val()+"",
					data:$("#mainForm").serialize(),
					type:"post",
					success:function(data){
						if(data.status=="12"){
							
							var ci = document.getElementsByName("b");
							//遍历复选框数组  如果被选中ci[i].checked的值就是true
							for(var i = 0;i < ci.length;i++){
									if(ci[i].checked==true){
									obj.push(ci[i].value);	
								}
									else{
										var index = obj.indexOf(ci[i].value);
										if (index > -1) {
											obj.splice(index, 1);
										}
									}
									
							}
							parent.modify(data,obj.join(),1);
							addSuccess("设置成功");
						}
						else{
							fail("设置失败");
						}
						 
					},
					error:function(data){
						//addFailed();
					}
					
				}); 
			  return false;
		  });
		  
		  
		  
		  //复选框的选择
		  var obj=new Array();
		/* form.on('checkbox(filter)', function(data){
			//alert(data.value);
			if(data.elem.checked){
				obj.push(data.value);
			}
			else{
				for(var i=0;i<obj.length;i++){
					obj.splice(i,1);
				}
			}
			}); */
		  
		  function addSuccess(data){
			  layer.msg(data, {icon:6, time:3000}, function(index){
		            layer.close(index);
		            var index = parent.layer.getFrameIndex(window.name);
		            parent.layer.close(index);
		        }); 
		  }
		  
		  function fail(data){
			  layer.msg(data, {icon:5, time:3000}, function(index){
		            layer.close(index);
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