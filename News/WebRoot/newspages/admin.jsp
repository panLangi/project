<%@page import="entity.News"%>
<%@page import="impl.NewsDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<title>添加主题--管理后台</title>
<link href="css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="console_element/top.jsp" %>

<div id="main">
  <%@include file="console_element/left.html" %>
  <div id="opt_area">    
    <script language="javascript">
	function clickdel(){
		return confirm("删除请点击确认");
	}
</script>
    <ul class="classlist">
	      <%
	      	NewsDaoImpl ndi = new NewsDaoImpl();
	      	List<News> list = ndi.findNews();
	      	int num = 0;
	      	for (int i = 0; i < list.size(); i++) {
	      		num++;
	      %>
	      	<li><%=list.get(i).getNtitle() %><span> 作者：<%=list.get(i).getNauthor() %> &#160;&#160;&#160;&#160; <a href='#'>修改</a> &#160;&#160;&#160;&#160; <a href='#' onclick='return clickdel()'>删除</a> </span> </li>
	      <%
	      		if (num == 5) {
	      			num = 0;
	      			%>
	      				<li class='space'></li>
	      			<%
	      		}
	      	}
	      %>
    </ul>
  </div>
</div>
<div id="footer">
  <%@include file="console_element/bottom.html" %>
</div>
</body>
</html>
