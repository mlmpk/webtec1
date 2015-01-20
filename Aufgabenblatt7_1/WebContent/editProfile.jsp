<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Profil editieren</title>
</head>
<body>

	<form action="updateProfile.jsp" method="post">
		<label for="name">Name: </label><input type="text" name="username"></input><br/>
		<label for="password">Passwort: </label><input type="password" name="password"></input><br/>
		<label for="age">Alter: </label><input type="text" name="age"></input><br/>
		
		<input type="submit" value="Profil updaten"></input>
	
	</form>

</body>
</html>