<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/static2/layui/layui.js"></script>
<script>
   layui.config({
       base: '${pageContext.request.contextPath}/static/js/',
       version: true,
       debug:true
   }).extend({
       elem: 'jqmodules/elem',
       tabmenu: 'jqmodules/tabmenu',
       jqmenu: 'jqmodules/jqmenu',
       ajax: 'jqmodules/ajax',
       dtable: 'jqmodules/dtable',
       jqdate: 'jqmodules/jqdate',
       modal: 'jqmodules/modal',
       tags: 'jqmodules/tags',
       jqform: 'jqmodules/jqform',
       echarts: 'lib/echarts',
       webuploader: 'lib/webuploader'
   })
</script>
</html>