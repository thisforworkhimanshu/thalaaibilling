<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<%! String name; %>
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
		<div id="profile">
			<ul>
				<li><a href="ChangeProfile.jsp">Change Profile</a></li>
				<li><a href="ChangePass.jsp">Change Password</a></li>
			</ul>
		</div>
		<div id="middlelogin" align="right">
		<label><%out.println("Your session id : " +session.getId());%></label>
			<div align="center" style="margin-top: 20px;">
				<img alt="UserImage" src="male-user-silhouette_318-35708.jpg" width="100px" height="100px">
			</div><br>
			<div align="center" style="margin-top: 20px;">
				<%	if(session.getAttribute("UName")!=null){
					name=(String)session.getAttribute("UName");
				%>	<label ><strong><%out.println("Welcome ");%>
						<%		if(String.valueOf(session.getAttribute("UName")).equals("himanshu")){
									out.print(" Admin");
								}
						%>
						
						<span style="color: green; font-family: cursive; font-size: 20px;">
						<%out.print(name); %></span>
					</strong> <br></br></label>
					
				<%
				}
						else
						{
								JOptionPane.showMessageDialog(null, "Please Login First");
								response.sendRedirect("Index.jsp");	
						}
				%>
				
			</div>
		</div>
</div>
</body>
</html>