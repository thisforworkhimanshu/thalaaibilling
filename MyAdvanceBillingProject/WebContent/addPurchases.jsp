<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
	function check(){
		
		var date = document.addpurchaseform.date.value;
		var x = document.addpurchaseform.billnumber.value;
		var y = document.addpurchaseform.shopname.value;
		var z = document.addpurchaseform.billprice.value;
		var w = document.addpurchaseform.taxamount.value;
		
		if(date=='yyyy-mm-dd' || date==null){
			alert("Enter Date Please");
			return false;
		}else if(x==null || x==''){
			alert("Enter Date Please");
			return false;
		}else if(y=='' || y==null){
			alert("Enter Shop Name Please");
			return false;
		}else if(y=='' || y==null){
			alert("Enter Bill Price Please");
			return false;
		}else if(z=='' || z==null){
			alert("Enter Tax Amount Please");
			return false;
		}
	}
	
	function checkuser() {
		<%
			if(String.valueOf(session.getAttribute("UName")).equals("himanshu")==false){
				JOptionPane.showMessageDialog(null, "Admin Can Access Only");
				response.sendRedirect("Index.jsp");
			}
			/* 	if(session.getAttribute("UName")==null){
					JOptionPane.showMessageDialog(null, "Login First");
					response.sendRedirect("Index.jsp");
				} */
		%>
	}
</script>
</head>
<body style="margin: 0px; padding: 0px;" onload="checkuser()">

<div style="position: fixed; border-bottom: dotted; background-color: lime; width: 100%">
	<div style="width: 100px; height: 60px; float: left;" >
		<a href="Index.jsp" ><img alt="Thalaai" src="IMG-20170806-WA0005.jpg" width="100px" height="60px"></a>
	</div>
	
	<div style=" float:left; margin-left:10px; text-decoration: none; margin-top:20px; ">
		<ul style="margin: 0px; padding: 0px;">
			<li style="display: inline; margin-left: 0px"><a href="login.jsp" style="text-decoration: none; color: blue;">Profile Page</a> </li>
			<li style="display: inline; margin-left: 35px;"><a href="productlist.jsp" style="text-decoration: none; color: blue;">Product List</a> </li>
			<li style="display: inline; margin-left: 35px;"><a href="addProduct.jsp" style="text-decoration: none; color: blue;">Add Product</a> </li>
			<li style="display: inline; margin-left: 35px;"><a href="find.jsp" style="text-decoration: none; color: blue;">Update Product</a> </li>
			<li style="display: inline; margin-left: 35px;"><a href="deleteProduct.jsp" style="text-decoration: none; color: blue;">Delete Product</a> </li>
			<li style="display: inline; margin-left: 35px;"><a href="addEmploye.jsp" style="text-decoration: none; color: blue;">Add Employee</a> </li>
			<li style="display: inline; margin-left: 35px;"><a href="SearchEmploy.jsp" style="text-decoration: none; color: blue;">Search Employee</a> </li>
			<li style="display: inline; margin-left: 35px;"><a href="mybill.jsp" style="text-decoration: none; color: blue;">Create Bill</a> </li>
			<li style="display: inline; margin-left: 35px;"><a href="inventory.jsp" style="text-decoration: none; color: blue;">See Sales</a> </li>
			<li style="display: inline; margin-left: 35px;"><a href="listpurchases.jsp" style="text-decoration: none; color: blue;">List Purchases</a> </li>
			
		</ul>
	</div>
</div>

<div style="margin-top: 80px; float: left;">
	<form action="AddPurchases" name="addpurchaseform" method="post" onsubmit="return check()">
			<table>
				<tr style="font-size: 15px;">
					<th>Enter Date</th>
					<!-- <td><input type="text"  name="date" value="yyyy-mm-dd"  onfocus="if (this.value=='yyyy-mm-dd') this.value='';" onblur="if(this.value=='') this.value='yyyy-mm-dd';" style="opacity: 0.9"></td> -->
					<td><input type="date" name="date"> </td>
					<th>Enter Bill Number</th>
					<td><input type="text" name="billnumber" id="billnumber"></td>
					<th>Enter Shop Name</th>
					<td><input type="text" name="shopname" id="shopname"></td>
					<th>Goods Price </th>
					<td><input type="text" name="billprice" id="billprice"></td>
					<th>Tax Amount</th>
					<td><input type="text" name="taxamount" id="taxamount"></td>
					<td><input type="submit" value="Add Please"></td>
				</tr>
			</table>
	</form>
</div>

<!-- <div style="float: left; margin-top: 20px; border-top: dotted; width: 100%;">
	<form action="EmpSalary" name="addsalaryform" method="post">
		<table style="margin-top: 20px;">
		<tr>
			<td><strong>Employee Section</strong></td>
		</tr>
		
		<tr style="font-size: 15px;">
					<th>Enter Employee Id</th>
					<td><input type="text"  name="eid"  id="eid"></td>
					<th>Enter Employee Name</th>
					<td><input type="text"  name="ename"  id="ename"></td>
					<th style="padding-left: 20px;">Salary Paid</th>
					<td><input type="text" name="salary" id="salary"></td>
					
					<td style="padding-left: 50px;"><input type="submit" value="Record Please"></td>
				</tr>
		</table>
	</form>

</div> -->
</body>
</html>