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
    
    <title>My JSP 'do_add_topic.jsp' starting page</title>
    
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
		String tname = request.getParameter("tname");
		TopicDaoImpl tdi = new TopicDaoImpl();
		int re = tdi.findTopicName(tname);
		if (re > 0) {
			response.sendRedirect("../newspages/topic_add.jsp");
		} else {
			if (tdi.addTopic(tname) > 0) {
				response.sendRedirect("../newspages/topic_list.jsp");
			} else {
				response.sendRedirect("../newspages/topic_add.jsp");
			}
		}	
	%>
  </body>
</html>
