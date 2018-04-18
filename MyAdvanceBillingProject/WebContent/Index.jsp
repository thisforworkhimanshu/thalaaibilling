<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">
	function check() {
		<%
			if(session.getAttribute("UName")==null){
				session.invalidate();
					%>
					var x = document.getElementById('middleone');
					var y = document.getElementById('rlink');
					if(y.style.display==='none'){
						y.style.display='block';
					}
					if(x.style.display==='none'){
						x.style.display='block';
					}else{
						x.style.display='none';
					}
					<%
				}else{
					%>
					var x = document.getElementById('showDiv');
					if(x.style.display==='none'){
						x.style.display='block';
					}else{
						x.style.display='none';
					}
					<%
				}
		%>
	}
	function validateform(){
		var name = document.myloginform.txtName.value;
		var password = document.myloginform.txtPass.value;
		if(name==null || name==''){
			alert("Please Fill the UserName");
			return false;
		}
		else if(password==null || password==''){
			alert("Please enter your PassWord");
			return false;
		}
		
	}
</script>
<title>Main Page</title>
</head>
<body onload="check()">
<div id="container">
	<div id="FirstDiv">
		<label style="font-size: 20px;">Thalaai Restaurant</label>
		<a href="checkProfile.jsp" id="rlink" style="display: none;">Register</a>
	</div>
	<div id="menu" >
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
		<br></br>
	</div>
	<!-- <br></br> -->
	<div id="second" align="center" >
		<label style="font-size: 20px; font-family: sans-serif; text-decoration: underline; color: blue;">Facilities</label>
		<br></br>
		<!-- <br></br> -->
		<!-- <a href="#">Book Table? Click Here</a>
		<br></br>
		<a href="#">Check Status of Table</a>
		<br></br> -->
		<a href="productlist.jsp">Product List</a>
		<br></br>
		<a href="SendMail.jsp">Send Mail</a>
		<br></br>
		<marquee direction="right" behavior="alternate"><label style=" word-spacing: 3px; ">Many More, Coming Soon</label></marquee> 
		
	</div>
	
	<div id="middle">
		<div id="showDiv" style="display: none; margin-top: 190px;" align="center" >
			<label style="font-size: 30px; font-family: fantasy;">
			<a href="logoutservlet" > <img alt="Already Logged" src="attention-307030_960_720.png" width="100px" height="100px">
			<!-- Already Login! Click To --> Logout</a>
			</label><br></br>
			<a href="login.jsp">Go to Profile</a>
		</div>
		
		<div id="middleone" style="display: none; margin-top: 90px; margin-left: 30px;">
			<form action="loginservlet" name="myloginform" style="margin-top: 0px;" onsubmit="return validateform()">
					<table border="1" style="border-collapse: collapse;" width="500px" height="300px">
					<tr>
						<th align="center" colspan="2" style="font-size: 50px;"><img alt="LoginUser" src="male-user-silhouette_318-35708.jpg" width="100px;" height="100px;"><br>Login</th>
					</tr>
					<tr>
						<th style="font-size: 40px; height: 40px;">UserName</th>
							<td><input type="text" name="txtName" style="height: 40px; font-size: 40px; width: 500px;"></td>
					</tr>
					<tr>
						<th style="font-size: 40px; height: 40px;">Password</th>
							<td><input type="password" name="txtPass" style="height: 40px; font-size: 40px; width: 500px;"></td>
					</tr>
					<tr>
						<th colspan="2"><input type="submit" value="Login" style="height: 50px; width:300px; font-size: 30px; border-radius: 100px;"></th>
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
			<li><a href="SearchEmploy.jsp">Search Employee</a></li>
			<li><a href="listEmploye.jsp">List Employee</a></li>
			<li><a href="addEmploye.jsp">Add Employee</a></li>
		</ul>
	</div>
</div>
</body>
</html>