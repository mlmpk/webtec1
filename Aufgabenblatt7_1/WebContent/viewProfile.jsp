<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Dein Profil</title>
</head>
<body>
<jsp:useBean id="profile" class="bean.UserProfile" scope="session"></jsp:useBean>

<table border="1">
<tr><td>Name:</td><td><jsp:getProperty property="username" name="profile"/></td></tr>
<tr><td>Passwort:</td><td><jsp:getProperty property="password" name="profile"/></td></tr>
<tr><td>Alter:</td><td><jsp:getProperty property="age" name="profile"/></td></tr>
</table>


<a href="editProfile.jsp"> Profil anpassen </a>
</body>
</html>