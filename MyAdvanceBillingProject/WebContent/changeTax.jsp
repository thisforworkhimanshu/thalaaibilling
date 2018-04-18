<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript">
	function check() {
		<% 		String name="himanshu";
				String uname=String.valueOf(session.getAttribute("UName"));
				if(!uname.equals(name)){
						JOptionPane.showMessageDialog(null, "Please Login as Admin");
						response.sendRedirect("Index.jsp");
					}
				/* if(session.getAttribute("UName")==null){
					JOptionPane.showMessageDialog(null, "Login");
					response.sendRedirect("Index.jsp");
				} */
			
				request.getRequestDispatcher("ClearData").include(request,response);
		%>	
	}
	
	function checktax() {
		var tax = document.taxForm.taxvalue.value;
		if(tax==null||tax==''){
			alert("Enter value");
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
				<li><a href="#">Product</a>
					<ul>
						<li><a href="addProduct.jsp" >Add Your Product</a></li>
						<li><a href="deleteProduct.jsp">Delete Your Product</a></li>
						<li><a href="#">Update</a>
						<ul>
								<li><a href="changeTax.jsp">Update Your Tax and Discount </a></li>
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
			<form action="ChangeTax" style="margin-top: 40px;" name="taxForm" onsubmit="return checktax()">
				<% 
					float discount=0;
					float tax=0;
					Connection connection=null;
				  	PreparedStatement statement;
				  try{
					  Class.forName("com.mysql.jdbc.Driver");
					  connection=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
					  statement = (PreparedStatement)connection.prepareStatement("select * from tax");
					  ResultSet rs = statement.executeQuery();
				%>
			<label>Your Current Tax Rate </label>
					<%
						while(rs.next()){
						tax = rs.getFloat(1);
						discount = rs.getFloat(2);
				%>
					<input type="text" disabled="disabled" value="<%=tax%>">
				<%
						}
				%>
				<br></br>
				<label>Change Tax Value </label>
				<input type="text" name="taxvalue" value="<%=tax%>">
				
				<br></br>
				<label>Your Current discount Rate </label>
					<input type="text" disabled="disabled" value="<%=discount%>">
				<br></br>
				<label>Change Discount Value </label>
				<input type="text" name="disvalue" value="<%=discount%>">
				
				<%}catch(Exception e){
					e.printStackTrace();
				}finally{
					connection.close();
				}
				%>
				<br></br>
				<input type="submit" value="Change" style="border-radius: 100px;">
			</form>
		</div>
</div>
</body>
</html>