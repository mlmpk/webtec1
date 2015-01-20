<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="bean.UserProfile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Profil aktualisieren</title>
</head>
<body>

<jsp:useBean id="profile" class="bean.UserProfile" scope="session"></jsp:useBean>

<jsp:setProperty property="*" name="profile" />

<%-- <jsp:setProperty property="name" name="profile" value="<%= request.getParameter("name") %>"/> --%>
<%-- <jsp:setProperty property="password" name="profile" value="<%= request.getParameter("password") %>"/> --%>
<%-- <jsp:setProperty property="age" name="profile" value="<%= request.getParameter("age") %>"/> --%>

<% 

// 	String name = request.getParameter("name");
// 	String password = request.getParameter("password");
// 	String age = request.getParameter("age");
	
// 	profile.setUsername(name);
// 	profile.setPassword(password);
// 	profile.setAge(Integer.valueOf(age));
	
%>
<p>User Profil aktualisiert!</p><br/>
<a href="viewProfile.jsp"> zurück zum Profil</a>

</body>
</html>