<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Dein Profil EL</title>
</head>
<body>

<table border="1">
<tr><td>Name:</td><td>${profile.username}</td></tr>
<tr><td>Passwort:</td><td>${profile.password }</td></tr>
<tr><td>Alter:</td><td>${profile.age}</td></tr>
</table>


<a href="editProfile.jsp"> Profil anpassen </a>
</body>
</html>