<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript">
	function checkForm() {
		var uname = document.registerForm.uname.value;
		var pass = document.registerForm.txtPass.value;
		var cpass = document.registerForm.ctxtPass.value;
		var fname = document.registerForm.txtFName.value;
		var lname = document.registerForm.txtLName.value;
		var cellnum = document.registerForm.cellNumber.value;
		var ep = document.registerForm.eMail.value;
		if (ep== ''|| ep==null) {
			alert("Enter Emil-id");
			return false;
		}
		if(!(/^\w+([\.-]?w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/.test(registerForm.eMail.value))){
			alert("Enter Correct Email");
			return false;
		}
		if(uname==null || uname==''){
			alert("Enter UserName");
			return false;
		}else if(uname.length < 3){
			alert("Enter Correct UserName with Minimum 3 alphabets");
			return false;
		}
		if(fname==null || fname==''){
			alert("Enter First Name");
			return false;
		}
		if(lname==null || lname==''){
			alert("Enter Last Name");
			return false;
		}
		if(pass==null || pass==''){
			alert("Enter Password");
			return false;
		}
		if(cpass==null || cpass==''){
			alert("Enter Confirm Password");
			return false;
		}
		if(pass!=cpass){
			alert("Both Pass should be Same");
			return false;
		}
		if(cellnum==null || cellnum==''){
			alert("Enter Mobile Number");
			return false;
		}else if(isNaN(cellnum)|| cellnum.indexOf(" ")!=-1){
			alert("Enter valid Mobile Number");
			return false;
		}
		if(cellnum.length!=10){
			alert("Mobile Number Should be of 10 digits only");
			return false;
		}
	}
</script>
</head>
<body>
	<div id="container">
		<div id="FirstDiv">
			<label style="font-size: 20px;">Thalai Restaurant</label>
			<a href="Index.jsp">Login</a>
		</div>
		<div id="menu">
			<ul>
				<li><a href="Index.jsp">Home</a></li>
				<li><a href="#">Product</a>
					<ul>
						<li><a href="addProduct.jsp" >Add Your Product</a></li>
						<li><a href="#">Delete Your Product</a></li>
						<li><a href="#">Update</a>
						<ul>
								<li><a href="changeTax.jsp">Update Your Tax and Discount</a></li>
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
		<div id="second" align="center">
			<label style="font-size: 20px; font-family: sans-serif; text-decoration: underline; color: blue;">Facilities</label>
			<br></br>
			<!-- <br></br> -->
			<a href="#">Book Table? Click Here.</a>
			<br></br>
			<a href="#">Check Status of Table</a>
			<br></br>
			<a href="#">Product List</a>
			<br></br>
			<marquee direction="right" behavior="alternate"><label style=" word-spacing: 3px; ">Many More, Coming Soon</label></marquee> 
			
		</div>
	
		<div id="middle">
			<!-- <a href="#">Test Division middle</a> -->
			<div align="center" style=" float: left;margin-left: 10px;margin-top: 10px;	width: 96.9%;height:477px;border-left: 1px solid red;border-top: 1px solid red;border-right: 1px solid red;border-bottom: 1px solid red;">
			<form action="registeruser" style="margin-top: 100px;" name="registerForm" onsubmit="return checkForm()">
						<table align="center" border="1">
						<tr >
							<th align="center" colspan="2">Register</th>
						</tr>
						<tr>
							<th>User Name</th>
								<td><input type="text" name="uname" ></td>
						</tr>
						<tr>
							<th>First Name</th>
								<%
									if(request.getParameter("txtFName")!=null){
										%>
											<td><input type="text" name="txtFName" value="<%=request.getParameter("txtFName")%>"> </td>
										<% 
									}else{
										%>
											<td><input type="text" name="txtFName" ></td>
										<% 		
									}
								%>
								
						</tr>
						<tr>
							<th>Last Name</th>
							<%
									if(request.getParameter("txtLName")!=null){
										%>
											<td><input type="text" name="txtLName" value="<%=request.getParameter("txtLName")%>"> </td>
										<% 
									}else{
										%>
											<td><input type="text" name="txtLName" ></td>
										<% 		
									}
								%>
								
						</tr>
						<tr>
							<th>Password:</th>
								<td><input type="password" name="txtPass" ></td>
						</tr>
						<tr>
							<th>Confirm Password:</th>
								<td><input type="password" name="ctxtPass" ></td>
						</tr>
						<tr>
							<th>Mobile Number</th>
								<%
									if(request.getParameter("cellNumber")!=null){
										%>
											<td><input type="text" name="cellNumber" value="<%=request.getParameter("cellNumber")%>"> </td>
										<% 
									}else{
										%>
											<td><input type="text" name="cellNumber" ></td>
										<% 		
									}
								%>
								
						</tr>
						<tr>
							<th>Email-Id</th>
								<%
									if(request.getParameter("eMail")!=null){
										%>
											<td><input type="text" name="eMail" value="<%=request.getParameter("eMail")%>"> </td>
										<% 
									}else{
										%>
											<td><input type="text" name="eMail" ></td>
										<% 		
									}
								%>
						</tr>
						<tr>
							<th colspan="2"><input type="submit" value="Register"></th>
						</tr>
						</table>
				</form>
			</div>
		</div>
	
		<div id="third" align="center">
				<!-- <a href="#">Test division 3</a> -->
			<label style="font-family: sans-serif; font-size: 20px; text-decoration: underline; color: blue;">Employee Management</label>
			<br></br>
			<ul>
				<li><a href="#">Search Employee</a></li>
				<li><a href="#">List Employee</a></li>
				<li><a href="#">Add Employee</a></li>
			</ul>
		</div>
</div>
</body>
</html>