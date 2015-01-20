<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Umfrage</title>
</head>
<body>

<%
	
	String param = (String)request.getParameter("param");

	if(param != null){
		switch( param ){
		case "clear":
			application.setAttribute("JSP", 0);
			application.setAttribute("PHP", 0);
			application.setAttribute("ASP", 0);
			application.setAttribute("ColdFusion", 0);
			break;
		case "JSP":
			Integer jsp = (Integer) application.getAttribute("JSP");
			if(jsp == null){
				application.setAttribute("JSP", 1);
			}else{
				application.setAttribute("JSP", jsp + 1);
			}
			break;
		case "PHP":
			Integer php = (Integer) application.getAttribute("PHP");
			if(php == null){
				application.setAttribute("PHP", 1);
			}else{
				application.setAttribute("PHP", php + 1);
			}
		break;
		case "ASP":
			Integer asp = (Integer) application.getAttribute("ASP");
			if(asp == null){
				application.setAttribute("ASP", 1);
			}else{
				application.setAttribute("ASP", asp + 1);
			}
		break;
		case "ColdFusion":
			Integer coldfusion = (Integer) application.getAttribute("ColdFusion");
			if(coldfusion == null){
				application.setAttribute("ColdFusion", 1);
			}else{
				application.setAttribute("ColdFusion", coldfusion + 1);
			}
		break;
		default:
			break;
	}
	
}
%>


<h1>Umfrage</h1>
<p><a href="umfrage.jsp?param=JSP">JSP</a></p>
<p><a href="umfrage.jsp?param=PHP">PHP</a></p>
<p><a href="umfrage.jsp?param=ASP">ASP</a></p>
<p><a href="umfrage.jsp?param=ColdFusion">ColdFusion</a></p>
<br />
<p><a href="umfrage.jsp?param=clear">Umfrage löschen</a></p>

<h1>Ergebnis</h1>

<table>
	<tr>
		<td>Sprache</td>
		<td>Anzahl</td>
	</tr>
	<tr><td>JSP</td><td><%= application.getAttribute("JSP") %></td></tr>
	<tr><td>PHP</td><td><%= application.getAttribute("PHP") %></td></tr>
	<tr><td>ASP</td><td><%= application.getAttribute("ASP") %></td></tr>
	<tr><td>ColdFusion</td><td><%= application.getAttribute("ColdFusion") %></td></tr>
</table>



</body>
</html>