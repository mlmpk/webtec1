<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Umfrage DB</title>
</head>
<body>
<sql:setDataSource var="mysql" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://192.168.1.2:3306/webtec1" user="webtec1" password="webtec1" />
<sql:query dataSource="${mysql}" sql="select USER,LANG,TIME FROM umfrage" var="result"></sql:query>

<table border="1">
<c:forEach var="row" items="${result.rows}">
	<tr><td><c:out value="${row.user}" /></td><td><c:out value="${row.lang}" /></td><td><c:out value="${row.time}" /></td></tr>
</c:forEach>
</table>
</body>
</html>