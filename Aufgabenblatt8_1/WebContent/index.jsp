<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSF Hello World</title>
</head>
<body>
<f:view>

	<h:form>
	<h:panelGrid columns="2">
		<h:outputLabel value="Name: " for="name"></h:outputLabel>
		<h:inputText id="name" value="#{myBean.name}" required="true">
			<f:validateLength minimum="5"/>
			<f:validateRegex pattern="[a-zA-Z]*"/>
		</h:inputText>
	</h:panelGrid>
	
	<h:commandButton value="Einloggen" action="#{myBean.login}" ></h:commandButton>
	<br>
	<h:message for="name"></h:message>
	
	</h:form>
</f:view>
</body>
</html>