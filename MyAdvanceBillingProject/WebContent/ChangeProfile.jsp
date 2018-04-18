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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript">
	function check() {
		<% request.getRequestDispatcher("ClearData").include(request,response);
			if(session.getAttribute("UName")==null){
				JOptionPane.showMessageDialog(null,"Login First Please ");
				response.sendRedirect("Index.jsp");
			}
		 	
			
		%>	
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
						<li><a href="" >Add Your Product</a></li>
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
			<div style="margin-top: 40px;">
					<form action="ChangeProfileServlet" method="post">
					
						<table border="1" style="border-collapse: collapse;" height="400">
						<tr>
							<td colspan="2" align="center">Change Profile Details</td>
						</tr>
							<% 
								String name =session.getAttribute("UName").toString();
								Connection connection=null;
								PreparedStatement statement;
								try{
								  Class.forName("com.mysql.jdbc.Driver");
								  connection = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
								  statement = (PreparedStatement)connection.prepareStatement("select * from user where UserName=?");
								  statement.setString(1, name);
								  ResultSet rs = statement.executeQuery();
								  if(rs.next()){
									  %>
									  	
									  	<tr>
									  		<td>UserName:</td>
									  		<td><input type="text" name="txtName" value="<%=rs.getString("UserName")%>"><br></td>
									  	</tr>
									  	<tr>
									  		<td>First Name: </td>
									  		<td><input type="text" name="txtFName" value="<%=rs.getString("FirstName")%>"><br></td>
									  	</tr>
									  	<tr>
									  		<td>Last Name: </td>
									  		<td><input type="text" name="txtLName" value="<%=rs.getString("LastName")%>"><br></td>
									  	</tr>
									  	<tr>
									  		<td>Mobile Number: </td>
									  		<td><input type="text" name="CellNum" value="<%=rs.getString("MobileNumber")%>"><br></td>
									  	</tr>
									  	<tr>
									  		<td>Email Id: </td>
									  		<td><input type="text" name="Email" value="<%=rs.getString("Emailid")%>"><br></td>
									  	</tr>
									  <%
								  }
								  
								}catch(Exception e){
									e.printStackTrace();
								}
							%>
							<tr >	
								<td colspan="2" align="center"><input type="submit" value="Submit">
									<input type="button" value="Cancle" onclick="window.location.replace('login.jsp')" style="margin-left: 100px;">
								</td>
							</tr>
						</table>
					</form>
			</div>
	</div>
</div>
</body>
</html>