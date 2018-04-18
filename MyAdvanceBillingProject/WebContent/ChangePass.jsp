<%@page import="javax.swing.JOptionPane"%>
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
	
	function validform() {
		var pass = document.getElementById('newpasscheck').value;
		var cpass =document.getElementById('cnewpasscheck').value;
		if(pass=='' || cpass=='' || pass==null || cpass==null){
			alert("Enter Password Details Completely");
			return false;
		}else if(cpass!=pass){
			alert("Password not Matched");
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
			<form action="ChangePassServlet" style="margin-top: 50px;" name="myChangePassForm" onsubmit="return validform()">
				<table border="2" height="400">
						<tr>
							<th colspan="2" style="font-size: 30px;">PassWord Change Form</th>
						</tr>
						<tr>
							<th style="font-size: 20px;">Enter Old PassWord</th>
							<td><input type="text" name="oldpass" id="oldpasscheck" style="height: 30px; font-size: 20px;"></td>
						</tr>
						<tr>
							<th style="font-size: 20px;">Enter New PassWord</th>
							<td><input type="text" name="newpass" id="newpasscheck" style="height: 30px; font-size: 20px;"></td>
						</tr>
						<tr>
							<th style="font-size: 20px;">Enter Confirm New PassWord</th>
							<td><input type="text" name="cnewpass" id="cnewpasscheck" style="height: 30px; font-size: 20px;"></td>
						</tr>
						<tr>
							<th colspan="2"><input type="submit" value="Submit" style=" width:100px; height: 40px; ">
							
								<input type="button" value="Cancle" onclick="window.location.replace('login.jsp')" style="margin-left:100px; width:100px; height: 40px;">
							</th>
						</tr>
				</table>
			</form>
		</div>
</div>
</body>
</html>