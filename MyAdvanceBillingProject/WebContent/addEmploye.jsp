<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Employee</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript">
	
	function check() {
	<%
		 if(String.valueOf(session.getAttribute("UName")).equals("himanshu")==false){
			JOptionPane.showMessageDialog(null, "Admin can Access Only");
			response.sendRedirect("Index.jsp");
		}
			/* if(session.getAttribute("UName")==null){
				JOptionPane.showMessageDialog(null, "Login First");
				response.sendRedirect("Index.jsp");
			} */else if(session.getAttribute("ename")!=null){
						session.removeAttribute("ename");
				response.sendRedirect("SearchEmploy.jsp");
			}
		%>
	}
	function checkval() {
	
		var x = document.EmpForm.ecellnum.value;
		var name = document.EmpForm.empname.value;
		var address = document.EmpForm.eaddress.value;
		var email = document.EmpForm.eemail.value;
		if(name==null || name==''){
			alert("Enter Name");
			return false;
		}
		else if(address==null || address==''){
			alert("Enter Address");
			return false;
		}
		else if(isNaN(x)||x.indexOf(" ")!=-1 || x.length!=10){
			alert("Enter valid mobile number");
			return false;
		}
		else if (email== ''|| email==null) {
			alert("Enter Emil-id");
			return false;
		}
		else if(!(/^\w+([\.-]?w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/.test(EmpForm.eemail.value))){
			alert("Enter Correct Email");
			return false;
		}
		
	}
</script>
</head>
<body onload="check()">

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
<form action="AddEmployeServlet" method="get" name="EmpForm" onsubmit="return checkval()">
	<table border="1" style="border-collapse: collapse;">
		<tr>
			<th colspan="2">Employee Registration</th>
		</tr>	
		<tr>
			<th>Enter Name</th>
			<td><input type="text" name="empname"></td>
		</tr>
		<tr>
			<th>Enter Address</th>
			<td><textarea name="eaddress"></textarea></td>
		</tr>
		<tr>
			<th>Enter Mobile Number</th>
			<td><input type="text" name="ecellnum"> </td>
		</tr>
		<tr>
			<th>Enter Email</th>
			<td><input type="text" name="eemail"> </td>
		</tr>
		<tr>
			 <td colspan="2" align="center"><input type="submit"></td>
		</tr>
	</table>
</form>
</div>
</div>
</body>
</html>