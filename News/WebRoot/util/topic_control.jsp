<%@page import="impl.TopicDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'topic_control.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
  		request.setCharacterEncoding("utf-8");
  		int id = Integer.parseInt(request.getParameter("tid"));
		String name = request.getParameter("tname");
		TopicDaoImpl tdi = new TopicDaoImpl();
		int re = tdi.findTopicName(name);
		if (re > 0) {
			response.sendRedirect("../newspages/topic_modify.jsp");
		} else {
			if (tdi.upTopic(id, name) > 0) {
				response.sendRedirect("../newspages/topic_list.jsp");
			} else {
				response.sendRedirect("../newspages/topic_modify.jsp");
			}
		}	
	%>
  </body>
</html>
