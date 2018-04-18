<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Employee</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript">
	function check() {
		<% request.getRequestDispatcher("ClearData").include(request,response);
		if(session.getAttribute("not")!=null){
			%>
				var x = document.getElementById('yesshowme');
				if(x.style.display==='none'){
					<% session.removeAttribute("not"); %>
					x.style.display='block';
					
				}else{
					x.style.display='none';
				}
			<%
		}
		if(String.valueOf(session.getAttribute("UName")).equals("himanshu")==false){
			JOptionPane.showMessageDialog(null, "Admin Can Access Only");
			response.sendRedirect("Index.jsp");
		}
		/* if(session.getAttribute("UName")==null){
			JOptionPane.showMessageDialog(null, "Login");
			response.sendRedirect("Index.jsp");
		} */else if(session.getAttribute("ename")!=null){
				session.removeAttribute("ename");
				response.sendRedirect("SearchEmploy.jsp");
			}
		%>
	}
</script>
</head>
<body onload="check()">
<div style="float: left" id="aefirst">
	<ul>
		<li style="margin: 0px;"><a href="Index.jsp">Home</a> </li>
		<li><a href="listEmploye.jsp">List Employee</a> </li>
		<li><a href="addEmploye.jsp">Add Employee</a> </li>
		<li><a href="mybill.jsp">Create Bill</a> </li>
	</ul>
</div>
<div style="float: left; margin-top: 10px; margin-left: 15%" id="empForm" >
<div id="yesshowme" style="display: none;">
	<h2>Not Present! Record it First</h2>
</div>
	<div align="center" style="margin-top: 20%">
		<form action="SearchEmploye">
		<label style="height: 30px; font-size: 30px;">Enter Employee Id <input type="text" name="empid" id="empid" style="height: 30px;"></label>
		<input type="submit" value="Find" style="width: 100px; height:30px; border-radius: 100px;">
		</form>
	</div>
</div>
</body>
</html>