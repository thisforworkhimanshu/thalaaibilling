<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Employee</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<div style="float: left" id="aefirst">
	<ul>
		<li><a href="Index.jsp">Home</a> </li>
		<li><a href="listEmploye.jsp">List Employee</a> </li>
		<li><a href="addEmploye.jsp">Add Employee</a> </li>
		<li><a href="mybill.jsp">Create Bill</a> </li>
	</ul>
</div>
<div style="float: left; margin-top: 10px; margin-left: 20%" id="empForm" >
	<div align="center" style="margin-top: 20%">
		<form action="UpdateEmploye" method="get" style="font-size: 20px;">
			<table border="1" style="border-collapse: collapse;">
				<tr>
					<th colspan="2" style="font-size: 30px;">Update Employee</th>
				</tr>
				<tr>
					<th>Enter Employee Name</th>
					<td><input type="text" name="empname" value="<%=session.getAttribute("ename")%>"></td> 
				</tr>
				<tr>
					<th>Enter Employee Address</th>
					<td><textarea name="eadd" ><%=session.getAttribute("eadd")%></textarea></td> 
				</tr>
				<tr>
					<th>Enter Employee Cell Number</th>
					<td><input type="text" name="ecellnum" value="<%=session.getAttribute("ecellnum")%>"></td> 
				</tr>
				<tr>
					<th>Enter Employee Email Id</th>
					<td><input type="text" name="eemail" value="<%=session.getAttribute("eemail")%>"></td> 
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="Submit"></td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>