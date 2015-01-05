<?xml version="1.0" encoding="UTF-8" ?>

<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Random Integers</title>
</head>
<body>

<jsp:useBean id="RandomBean" class="model.RandomIntsBean" scope="session"></jsp:useBean>
	
	<ol>
	<%
		ArrayList<Integer> randomIntsList = RandomBean.getNewRandomIntsList();
	
		for(Integer item : randomIntsList){%>
			<li><%=item %></li><% 
		}
	%>
	</ol>

</body>
</html>