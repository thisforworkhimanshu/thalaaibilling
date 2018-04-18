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
<title>Inventory</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript">
	function check() {
		<%
			if(session.getAttribute("UName")==null){
				JOptionPane.showMessageDialog(null, "Please Login First");
				response.sendRedirect("Index.jsp");
			}
			request.getRequestDispatcher("ClearData").include(request,response);
		%>
		
	}
	
	function printDiv(divName) {
		var printContents = document.getElementById(divName).innerHTML;
		var originalCotents = document.body.innerHTML;
		
		document.body.innerHTML = printContents;
		window.print();
		document.body.innerHTML = originalCotents;
	}
</script>
</head>
<body onload="check()" style="margin:0px; padding: 0px;">
<%float sum=0; %>
<!-- <a href="Index.jsp">Click to Home</a> -->
<div align="right">
	<a href="logoutservlet" style="margin-right: 0px;"><!-- LogOut -->
				<img alt="Logout" src="logout.png" width="200px" style="height: 20px;">
	</a>
</div>
<div style="float: left" id="aefirst">
	<ul>
		<li style="margin: 0px;"><a href="Index.jsp">Home</a> </li>
		<li><a href="addProduct.jsp">Add Product</a></li>
		<li><a href="deleteProduct.jsp">Delete Product</a></li>
		<li><a href="productlist.jsp">List Product</a></li>
		<li><a href="listEmploye.jsp">List Employee</a> </li>
		<li><a href="SearchEmploy.jsp">Search Employee</a> </li>
		<li><a href="addEmploye.jsp">Add Employee</a></li>
		<li><a href="mybill.jsp">Create Bill</a> </li>
	</ul>
</div>
<div style="float: left; margin-top: 0px; margin-left: 15%">
<div align="center" style="margin-top: 10%">
	<form action="Inventory" method="get"> 
		<label>Select Month</label>
		<select name="month">
			<option disabled="disabled" selected="selected">---Select---</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
		</select>
		<label>Enter Year</label>
		<input type="text" name="year">
		<input type="submit" value="Get Information">
	 </form>
</div>
<div id="printthis">
	<table border="1" width="500px;" style="margin-top: 10px;  border-collapse: collapse;">
				<tr>
				<th width="150px;" align="center">Bill Id</th>
				<th width="50px;" align="center">Price</th>
				<!-- <th width="50px;" align="center">Month</th>
				<th width="50px;" align="center">Year</th> -->
			</tr>
	<% 	
		Connection connection=null;
		PreparedStatement statement;
		try{
			  Class.forName("com.mysql.jdbc.Driver");
			  connection = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
			  /* statement = (PreparedStatement)connection.prepareStatement("select * from totalsell where Month=? and Year=? and UserName=?"); */
			  statement = (PreparedStatement)connection.prepareStatement("select * from totalsell where Month=? and Year=? ");
			  int month = Integer.parseInt(session.getAttribute("month").toString());
			  int year = Integer.parseInt(session.getAttribute("year").toString());
			  
			  statement.setInt(1,month);
			  statement.setInt(2, year);
			  
			  /* statement.setString(3, session.getAttribute("UName").toString()); */
			  
			  ResultSet rs = statement.executeQuery();
			  while(rs.next()){
				  %>
				 <tr>
				 	<td align="center"><%=rs.getString(7)%></td>
				 	<td align="right"><%=rs.getFloat(2) %></td>
				 	<%
				 		sum = sum + rs.getFloat(2);
				 	%>
				 	<%-- <td align="left"><%=rs.getInt(3) %></td>
				 	<td align="left"><%=rs.getInt(4) %></td> --%>
				 </tr>
				  <% 
			  }
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.removeAttribute("month");
			session.removeAttribute("year");
			connection.close();
		}
	%>
	</table>
	
	<div style="margin-top: 10px;">
	
		<table border="1" width="500px;" style="border-collapse: collapse;">
		<tr>
			<th align="left">Total Sell For Selected value :</th>
			<td align="right"><%=sum %></td>
		</tr>
		</table>
	</div>
	</div> 
</div>
	<div align="right">
	<input type="button" value="Print" style="margin-right: 0px;" onclick="printDiv('printthis')">
</div>
</body>
</html>