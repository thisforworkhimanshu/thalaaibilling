<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<div style="float: left" id="aefirst">
	<ul>
		<li style="margin: 0px;"><a href="Index.jsp">Home</a> </li>
		<li><a href="listEmploye.jsp">List Employee</a> </li>
		<li><a href="SearchEmploy.jsp">Search Employee</a> </li>
		<li><a href="mybill.jsp">Create Bill</a> </li>
	</ul>
</div>
<div style="float: left; margin-top: 20px; margin-left: 30%" id="empForm" >
<div align="center" style="margin-top: 30%">  
<label>You are Updating Detail of  <%=session.getAttribute("ename") %></label>
<br></br>
</div>
<div align="center">
	<label>Select one Option</label>
	<input type="button" value="Update" onclick="window.location.replace('UpdateEmploye.jsp')">
	<input type="button" value="Delete" onclick="window.location.replace('DeleteEmploye')">
</div>
</div>
</body>
</html>