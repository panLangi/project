<%@page import="entity.Topic"%>
<%@page import="impl.TopicDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加主题--管理后台</title>
<link href="css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="console_element/top.jsp" %>
<div id="main">
  <%@include file="console_element/left.html" %>
  <div id="opt_area">
    <ul class="classlist">
     <%
     	TopicDaoImpl tdi = new TopicDaoImpl();
     	List<Topic> list = tdi.findTopic();
     	for (Topic topic:list) {
      %>
	      <li><%=topic.gettName() %> &#160;&#160;&#160;&#160;  &#160;&#160;&#160;&#160; <a href='newspages/topic_modify.jsp?tid=<%=topic.gettId() %>&tname=<%=topic.gettName() %>'>修改</a> &#160;&#160;&#160;&#160; <a href='util/do_del_topic.jsp?tid=<%=topic.gettId() %>&tname=<%=topic.gettName() %>'>删除</a> </li>
      <%
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
