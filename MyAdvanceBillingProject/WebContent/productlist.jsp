<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product List</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript">
	function printDiv() {
		var printContents = document.getElementById('empForm').innerHTML;
		var originalCotents = document.body.innerHTML;
		
		document.body.innerHTML = printContents;
		
		window.print();
		
		document.body.innerHTML = originalCotents;
	}

	function check() {
	<%
		if(session.getAttribute("UName")==null){
			JOptionPane.showMessageDialog(null, "Please Login First");
			response.sendRedirect("Index.jsp");
		}
		%>
}
</script>
</head>
<body onload="check()">
<!-- <div>
	<a href="Index.jsp">Click to Home</a>
</div> -->
<div style="float: left" id="aefirst">
	<ul>
		<li><a href="Index.jsp">Home</a> </li>
		<li><a href="addProduct.jsp">Add Product</a></li>
		<li><a href="deleteProduct.jsp">Delete Product</a></li>
		<li><a href="listEmploye.jsp">List Employee</a> </li>
		<li><a href="SearchEmploy.jsp">Search Employee</a> </li>
		<li><a href="addEmploye.jsp">Add Employee</a></li>
		<li><a href="mybill.jsp">Create Bill</a> </li>
	</ul>
</div>
<div align="right" style="margin-right: 50px;">
	<input type="button" value="Print" onclick="printDiv()">
</div>
<div style="float: left; margin-top: 5px; margin-left: 15%" id="empForm" >
	<div align="center" style="margin-top: 5px">
	<table border="1" align="center" style="border-collapse: collapse; border: none;">
		<tr>
		<th width="240px;">Product ID</th>
		<th width="200px;">Product Name</th>
		<th width="200px;">Product Price</th>
		</tr>
	<%
		Connection connection;
		PreparedStatement statement;
		try{
			   Class.forName("com.mysql.jdbc.Driver");
			   connection = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
			   /* statement = (PreparedStatement)connection.prepareStatement("select * from product where UserName=?"); */
			   
			   statement = (PreparedStatement)connection.prepareStatement("select * from product");
			   
			   /* statement.setString(1, session.getAttribute("UName").toString()); */
			   ResultSet rs = statement.executeQuery();   
			   while(rs.next()){
		%>
			<tr>
				<td align="center"><%=rs.getString(1) %></td>
				<td align="center"><%=rs.getString(2) %></td>
				<td align="center"><%=rs.getFloat(3) %></td>
			</tr>	   
	   <%
			   }
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	</table>
	</div>
</div>
</body>
</html>