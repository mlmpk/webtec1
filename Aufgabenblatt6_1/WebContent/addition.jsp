<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Addition</title>
</head>
<body>

	<fieldset>
	<legend>Calculator</legend>
	
	<%

	double sum = 0;
	
	String[] values = request.getParameterValues("zahl");
	
	if(values != null && values.length > 0){
		
		for(int i=0;i<values.length-1;i++){
			sum += Double.valueOf(values[i]);
		}

	%>
	 	<form action="addition.jsp" method="get">
			<p>Ergebnis: <b><%=sum %></b></p>
			<input type="submit" value="Neue Berechnung"/>
		</form>
	<%
			
	}else{
		
	%>
	
	<form action="addition.jsp" method="get" onsubmit="check()">
	<div id="zahlenLayer">
		<div><label for="zahl1">Zahl 1</label><input type="text" id="zahl1" name="zahl" onkeyup="replaceComma(this);"/></div>
		<div><label for="zahl2">Zahl 2</label><input type="text" id="zahl2" name="zahl" onkeyup="replaceComma(this);"/></div>
	</div>	
		<input type="submit" value="Summieren" /><input type="reset" value="löschen" />
	</form>
	
	<% } %>
	
	</fieldset>
	
	
	<script type="text/javascript" src="./js/check.js"></script>
	
	
</body>
</html>