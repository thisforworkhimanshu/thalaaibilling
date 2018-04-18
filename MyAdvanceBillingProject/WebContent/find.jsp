<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Product</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript">
	function check() {
		<% 
			if(String.valueOf(session.getAttribute("UName")).equals("himanshu")==false){
				JOptionPane.showMessageDialog(null, "Admin Access Only");
				response.sendRedirect("Index.jsp");
			}
			/* 	if(session.getAttribute("UName")==null){
					JOptionPane.showMessageDialog(null, "Login");
					response.sendRedirect("Index.jsp");
				} */
			
		%>	
	}
	
	function checkprod(){
		var e = document.getElementById("prod");
		var val = e.options[e.selectedIndex].value;
		if(val=="0"){
			alert("Please Select Product");
			return false;
		}
	}
</script>
</head>
<body onload="check()">
<div id="container">
		<div id="FirstDiv">
			<label style="font-size: 20px;" >Thalai Restaurant</label>
			<a href="logoutservlet" style="margin-right: 0px;"><!-- LogOut -->
				<img alt="Logout" src="logout.png" width="200px" style="height: 20px;">
			</a>
		</div>
		<div id="menu">
			<ul>
				<li><a href="Index.jsp">Home</a></li>
				<li><a href="">Product</a>
					<ul>
						<li><a href="addProduct.jsp" >Add Your Product</a></li>
						<li><a href="deleteProduct.jsp">Delete Your Product</a></li>
						<li><a href="">Update</a>
						<ul>
								<li><a href="changeTax.jsp">Update Your Tax </a></li>
								<li><a href="find.jsp">Update Product Detail</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<li><a href="inventory.jsp">Inventory Management</a>
				<ul>
					<li><a href="inventory.jsp">See Sales</a></li>
					<li><a href="datesale.jsp">Date wise Sales</a></li>
					<li><a href="#">Manage Purchases</a>
						<ul>
							<li><a href="addPurchases.jsp">Add Purchases</a></li>
							<li><a href="listpurchases.jsp">List Purchases</a></li>
						</ul>
					</li>
					<li><a href="netamount.jsp">See Net Sales Amount</a></li>
				</ul>
				</li>
				<li><a href="#">Billing System</a>
					<ul>
						<li><a href="mybill.jsp">Create Bill</a></li>
					</ul>
				</li>
				<li><a href="aboutus.jsp">About Us</a></li>
			</ul>
		</div>
		<br></br>
		<div id="profile" align="right" style="margin-left: 882px;">
			<ul>
				<li><a href="login.jsp">Goto Profile</a></li>
			</ul>
		</div>
		<div id="middlelogin" align="center">
			<form action="Find" style="margin-top: 50px; margin-left: 10px;" onsubmit="return checkprod()">
				<p style="margin-top:50px; margin-left: 20px; font-size: 20px; font-style: oblique;">Please Select Product You want to Update</p>
				<% Connection connection;
				   PreparedStatement statement;
				   try{
					   Class.forName("com.mysql.jdbc.Driver");
					   connection = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
					   statement = (PreparedStatement)connection.prepareStatement("select * from product");
					   ResultSet rs = statement.executeQuery();
				%>
					<select name="prod" id="prod" style="margin-top:30px; margin-left:20px; width: 300px; height: 40px;">
					<option value="0" disabled="disabled" selected="selected">---Select Product---</option>
					<% 
						while(rs.next()){
							String prodName = rs.getString("ProductName");
							String pid = rs.getString("ProductId");
							%>
								<option value="<%=prodName%>"><%=pid %> <%=prodName%></option>
							<% 
						}
					%>
					</select>
				<input type="submit" value="Find" style=" margin-left:20px; width: 60px; height: 40px; background-color: silver;">
				<%
				   }catch(Exception e){
					   e.printStackTrace();
				   }
				%>
			</form>
		</div>
</div>
</body>
</html>