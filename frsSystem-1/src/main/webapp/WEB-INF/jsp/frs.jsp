<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="/common/header.jsp" %>
</head>
<body>
<input type="hidden" name="col" value="${col}" id="c">
<div class="top">
<div class="layui-container">  
<div style="text-align: center;"><h1>FRS物料显示</h1></div>
    	  <div class="layui-row" >
<table class="layui-table" id="tab">
  <thead>
    <tr>
      <th colspan="11">
      	
      	<div class="layui-container">  
    	  <div class="layui-row layui-col-space3" style="padding: 10px;">
    	  <div style="margin: auto;" >
    	  <form class="layui-form" action="">
    	  		
    	  		
				<div class="layui-col-md4" style="width: 50px;padding-top: 10px;">
	    		线别：
	  		</div>
  		<div class="layui-col-md4" style="width: 120px;">
    			<select  id="line_list" lay-filter="line"></select>
  		</div>
	  	<!-- <div class="layui-col-md4" style="width: 70px;padding-top: 10px;margin-left: 10px">
	    		基板数：
	  	</div>
	  		<div class="layui-col-md4" style="width: 120px;">
    			<select  id="bn" lay-filter="basic_num"></select>
  			</div> -->
			
			</form>
  		<div class="layui-col-md4" style="width: 80px;margin-left: 10px">
    			<button class="layui-btn layui-btn-danger"  id="sub" >提交</button>
  		</div>
  		<div class="layui-col-md4" style="width: 80px;">
    			<a href="#" class="layui-btn layui-btn-danger" id="ck">出库</a>
  		</div>
  		<div class="layui-col-md4" style="width: 80px;">
    			<a href="#" class="layui-btn layui-btn-danger" id="stopRefresh">停止刷新</a>
  		</div>
<!--   		<div class="layui-col-md4" style="width: 80px;padding-left: 20px">
    			<button class='layui-btn layui-btn-warm' id="hide">隐藏列</button>
  		</div> -->
  		<div class="layui-col-md4" style="width: 80px;padding-left: 20px">
    			<button class='layui-btn layui-btn-warm' id="set">设置</button>
  		</div>
  		<div class="layui-col-md4" style="width: 130px;padding-left: 20px;" >
    			<input type="text" name="did" required  lay-verify="required" placeholder="请输入did" autocomplete="off" class="layui-input" style="display: none;" id="dids">
  		</div>
  		<div class="layui-col-md4" style="width: 130px;padding-left: 20px;" >
    			<input type="text" name="employee" required  lay-verify="required" placeholder="请输入员工号" autocomplete="off" class="layui-input" style="display: none;" id="employee">
  		</div>
  		<div class="layui-col-md4" style="width: 260px;padding-left: 20px;" id="info">
  		</div>
    	  </div>
		  		
    	  </div>
    	  
	</div></th>
    </tr> 
    <tr>
    	<th >图标<span class="layui-icon layui-icon-rate" id="tb1"></span>   </th>
    	<th >Upp_did</th>
    	<th >设备名</th>
    	<th >TBLNO</th>
    	<th >Parts_Code</th>
    	<th >料架</th>
    	<th >线别</th>
    	<th>did</th>
    	<th >余数</th>
    	<th >基板</th>
    	<th >料带长度</th>
    </tr>
  </thead>
  <tbody id="tb">
  </tbody>
</table>
	</div>
	</div>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static2/jquery/jquery-1.11.3.min.js"></script>
<script>
var sign=1;
var lines='01';
var base_num='100';
var flag=2;
var p="";
var timer;

//refresh();

 timer= setInterval(myrefresh, 10000);
 sessionStorage.setItem('t',timer);
/* function refresh()
{
	timer=setTimeout('myrefresh()', 5000); 
} */






function modify(data,v,t){
	p=v;
	var tr="";
	var o="";
	//if(t==1){
		
		if(flag==2){for(var i=0;i<data.data.length;i++){
			if(data.data[i].upd_did=='-'){
				tr+="<tr><td><img src='${pageContext.request.contextPath}/static/png/blue.png'></img></td><td>"+data.data[i].upd_did+"</td><td>"+data.data[i].mac_code+"</td><td>"+data.data[i].tblno+"</td><td>"+data.data[i].parts_code+"</td><td>"+data.data[i].rackposition+"</td><td>"+data.data[i].line_name+"</td><td>"+data.data[i].did+"</td><td>"+data.data[i].parts_qty+"</td><td>"+data.data[i].limit_board+"</td><td>"+data.data[i].limit_length+"</td></tr>";
		}
	}
		$("#tb1").attr("class","layui-icon layui-icon-rate");
			
			
			
		}
		else if(flag==1)
		{
			for(var i=0;i<data.data.length;i++){
				if(data.data[i].upd_did=='-'){
					tr+="<tr><td><img src='${pageContext.request.contextPath}/static/png/blue.png'></img></td><td>"+data.data[i].upd_did+"</td><td>"+data.data[i].mac_code+"</td><td>"+data.data[i].tblno+"</td><td>"+data.data[i].parts_code+"</td><td>"+data.data[i].rackposition+"</td><td>"+data.data[i].line_name+"</td><td>"+data.data[i].did+"</td><td>"+data.data[i].parts_qty+"</td><td>"+data.data[i].limit_board+"</td><td>"+data.data[i].limit_length+"</td></tr>";
				}
				else{
					tr+="<tr><td><img src='${pageContext.request.contextPath}/static/png/star.png'></img></td><td>"+data.data[i].upd_did+"</td><td>"+data.data[i].mac_code+"</td><td>"+data.data[i].tblno+"</td><td>"+data.data[i].parts_code+"</td><td>"+data.data[i].rackposition+"</td><td>"+data.data[i].line_name+"</td><td>"+data.data[i].did+"</td><td>"+data.data[i].parts_qty+"</td><td>"+data.data[i].limit_board+"</td><td>"+data.data[i].limit_length+"</td></tr>";
				}
				}
				$("#tb1").attr("class","layui-icon layui-icon-rate-solid");
		}
		
	$("#tb").html(tr);
	  var obj  =  document.getElementById("tab");
	var rows = obj.rows.length ;
    //表格列数
    var m = obj.rows.item(1).cells.length ;
    
    for(var u=1;u<rows;u++){
    	for(var pp=0;pp<m;pp++){
    		obj.rows[u].cells[pp].style.display="table-cell";
    	}
    }
	var s=v.split(",");
	if(s!=""){
				m = obj.rows.item(1).cells.length ;
				for(var j=0;j<11;j++){
					for(var y=0;y<s.length;y++){
					 if(obj.rows[1].cells[j].innerHTML==s[y]){
						 for(var t=1;t<rows;t++){
								obj.rows[t].cells[j].style.display="none";
							}
						 break;
					}
					 
				}
			}
	//}
	
	}
}
function myrefresh()
{
	  $.ajax({
			url:"${pageContext.request.contextPath}/getDatas?pp="+encodeURI(encodeURI(p))+"",
			data:{'line_name':lines,'limit_board':base_num},
			type:"post",
			success:function(data){
				modify(data,data.v,flag);
			},
			error:function(data){
				
			}
			
		});
}
layui.use(['layer', 'table',  'upload', 'element', 'jquery','form'], function(){
  var laydate = layui.laydate //日期
  ,laypage = layui.laypage //分页
  ,layer = layui.layer //弹层
  ,table = layui.table //表格
  ,upload = layui.upload //上传
  ,element = layui.element //元素操作
  ,slider = layui.slider //滑块
  ,$=layui.jquery
  ,form=layui.form;
  
   initLines();
  initBasics();
  showLines();
  
  
  function showLines(){
		lines= sessionStorage.getItem('line');
		$("#line_list").get(0).value = lines;
		form.render('select');
	}
  
  
  var pp1=true;
  sessionStorage.setItem('pp1',true);
  $("#stopRefresh").click(function(){
	  pp1= sessionStorage.getItem('pp1');
	  if(pp1=="true"){
		  timer= sessionStorage.getItem('t');
		  clearTimeout(timer);
		  $("#stopRefresh").text("开始刷新");
		  pp1=false;
		  sessionStorage.setItem('pp1',false);
	  }
	  else{
		  $("#stopRefresh").text("停止刷新"); 
		  timer = setInterval(myrefresh, 10000);
		  sessionStorage.setItem('t',timer);
		  pp1=true;
		  sessionStorage.setItem('pp1',true);
	  }
	  
  });
  $(function () {
	    $(document).keydown(function (event) {
	        if (event.keyCode == 116) {
	        	//alert(lines);
	        	sessionStorage.setItem('line',lines);
	        }
	    });
	});
  
  
  $("#tb1").click(function(){
	  lines= sessionStorage.getItem('line');
	  if(flag==1){
		  flag=2;
	  }
	  else{
		  flag=1;
	  }
	  $.ajax({
			url:"${pageContext.request.contextPath}/getDatas?pp="+encodeURI(encodeURI(p))+"",
			data:{'line_name':lines,'limit_board':base_num},
			type:"post",
			success:function(data){
				modify(data,data.v,2);
			},
			error:function(data){
				
			}
			
		});
  });
 
  function initBasics()
  {
	  var bn="<option value='100'>100</option><option value='200'>200</option><option value='300'>300</option><option value='400'>400</option><option value='500'>500</option><option value='1200'>1200</option><option value='2000'>2000</option><option value='3000'>3000</option>";
	  $("#bn").html(bn);
	  form.render('select');
  }
  
  function initLines()
  {
  	var liness="<option value='01'>PT-L01</option><option value='02'>PT-L02</option><option value='03'>PT-L03</option><option value='04'>PT-L04</option><option value='05'>PT-L05</option><option value='06'>PT-L06</option><option value='07'>PT-L07</option><option value='08'>PT-L08</option><option value='09'>PT-L09</option><option value='10'>PT-L10</option><option value='11'>PT-L11</option><option value='12'>PT-L12</option>";
  	$("#line_list").html(liness);
  	form.render('select');
  }
  
  
  $("#ck").click(function(){
		  $("#employee").show();
		  $("#employee").focus();
		  timer= sessionStorage.getItem('t');
		  clearTimeout(timer);
		  $("#stopRefresh").text("开始刷新");
  });
  
  
//employee失去光标移除员工号
  $("#employee").blur(function(){
	  //sessionStorage.removeItem('key');
	  $("#employee").hide();
	  //$("#employee").show();
	   timer = setInterval(myrefresh, 10000);
	   sessionStorage.setItem('t',timer);
	   sessionStorage.setItem('pp1',true);
	   $("#stopRefresh").text("停止刷新");
	   $("#info").text("");
	   $("#dids").text("");
  });
  
  //员工号验证
  $("#employee").keyup(function(){
	  
	  if(event.keyCode ==13){
		  if($("#employee").val().trim()!=''&&$("#employee").val().trim()!='undefined'&&$("#employee").val().trim()!=null){
			  $.ajax({
					url:"${pageContext.request.contextPath}/checkEmployee",
					data:{'operator':$("#employee").val()},
					type:"post",
					success:function(data){
						if(data=="ok"){
							$("#employee").css("display","none");
							$("#dids").css("display","block");
							$("#info").text("");
							$("#dids").focus();
							//sessionStorage.setItem('key', 'ok');
							$("#employee").val("");
							timer= sessionStorage.getItem('t');
							clearTimeout(timer);
							$("#stopRefresh").text("开始刷新");
							sessionStorage.setItem('pp1',false);
						}
						else{
							$("#info").text("员工号输入错误");
						}
					},
					error:function(data){
						
						alert("内部服务器错误");
					}
					
				});
		  }
		  else{
			  $("#info").text("员工号不能为空");
		  }
	  }
  });
  
  //did失去光标移除员工号
  $("#dids").blur(function(){
	  sessionStorage.removeItem('key');
	  $("#dids").hide();
	  //$("#employee").show();
	   timer = setInterval(myrefresh, 10000);
	   sessionStorage.setItem('t',timer);
	   sessionStorage.setItem('pp1',true);
	   $("#stopRefresh").text("停止刷新");
	   $("#dids").text("");
	   $("#info").text("");
  });
  
  //did回车事件
   $("#dids").keyup(function(){
	   
	   if(event.keyCode ==13){
		   $("#info").text("");
		   if($("#dids").val().trim()!=''&&$("#dids").val().trim()!='undefined'&&$("#dids").val().trim()!=null){
			   $.ajax({
					url:"${pageContext.request.contextPath}/FRSOutDeal?pp="+encodeURI(encodeURI(p))+"",
					data:{'did':$("#dids").val()},
					type:"post",
					success:function(data){
						$("#dids").val("");
						if(data.status=="0"){
							$("#info").text("出库成功");
							modify(data,data.v,2);
							
						}
						if(data.status=="1"){
							$("#info").text("g_code为空");
						}
						else if(data.status=="2"){
							$("#info").text("QTY为空");
						}	
						else if(data.status=="3"){
							$("#info").text("RACK_POSITION为空");
						}
						else if(data.status=="5"){
							$("#info").text("did不存在");
						}
						else if(data.status=="9"){
							$("#info").text("该did不存在，请确认");
						}
						else if(data.status=="-99"){
							$("#info").text(data.status);
						}
						modify(data,data.v,flag);
					},
					error:function(data){
						
					}
					
				});
		   }
		   else{
				  $("#info").text("did不能为空");
			  }
		   
	   }
	  
}); 
  
 /*  $("#hide").click(function(){
	   layer.open({
		  type: 2,
		  area: ['600px', '400px'],
		  content: "${pageContext.request.contextPath}/hideColumn.jsp",
		  success: function(layero, index){
		  },
		});   
  });
   */
  $("#set").click(function(){
	   layer.open({
		  type: 2,
		  area: ['600px', '400px'],
		  content: "${pageContext.request.contextPath}/set.jsp?v="+  encodeURI(encodeURI(p))+"&lines="+lines+"",
		  success: function(layero, index){
		  },
		});   
 });
  
  $("#sub").click(function(){
	  var tr="";
	  $.ajax({
			url:"${pageContext.request.contextPath}/getDatas?pp="+encodeURI(encodeURI(p))+"",
			data:{'line_name':lines,'limit_board':base_num},
			type:"post",
			success:function(data){
				
				modify(data,data.v,flag);
				/* for(var i=0;i<data.length;i++){
					if(data[i].upd_did=='-'){
						tr+="<tr><td><img src='${pageContext.request.contextPath}/static/png/blue.png'></img></td><td>"+data[i].upd_did+"</td><td>"+data[i].parts_code+"</td><td>"+data[i].mac_code+"</td><td>"+data[i].line_name+"</td><td>"+data[i].did+"</td><td>"+data[i].limit_board+"</td><td>"+data[i].limit_length+"</td></tr>";
					}
					else{
						tr+="<tr><td><img src='${pageContext.request.contextPath}/static/png/star.png'></img></td><td>"+data[i].upd_did+"</td><td>"+data[i].parts_code+"</td><td>"+data[i].mac_code+"</td><td>"+data[i].line_name+"</td><td>"+data[i].did+"</td><td>"+data[i].limit_board+"</td><td>"+data[i].limit_length+"</td></tr>";
					}
					
				}
				$("#tb").html(tr);  */
			},
			error:function(data){
				
			}
			
		});
  });
  
  
  

  function deleteSuccess(data){
	  layer.msg(data, {icon:6, time:3000}, function(index){
            //layer.close(index);
            window.location.reload();
        }); 
  }
  
  
  function delSuccess(data){
	  layer.msg(data, {icon:6, time:3000}, function(index){
            layer.close(index);
            window.parent.location.reload();
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
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
  
  function delFailed(){
	  layer.msg('服务器内部错误', {icon:5, time:3000}, function(index){
            layer.close(index);
            window.parent.location.reload();
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        });
  }
  
  
  
  //获得线别下拉列表选中的数据
  form.on('select(line)', function(data){
	  lines=data.value;
	  sessionStorage.setItem('line',lines);
	});     
  
  //获得基板数下拉列表选中的数据
  form.on('select(basic_num)', function(data){
	  base_num=data.value;
	}); 
  
  
  
 
});
</script>
</html>