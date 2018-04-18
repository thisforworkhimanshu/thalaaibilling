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
<title>MyBill</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript">
	window.history.forward();
	function check(){
		window.history.forward();
			<%
				if(session.getAttribute("billing")==null){
					session.removeAttribute("billing");
					session.setAttribute("billing", "yes");
				}
			if(session.getAttribute("UName")==null){
				JOptionPane.showMessageDialog(null, "Please Login First");
				response.sendRedirect("Index.jsp");
			}else if(String.valueOf(session.getAttribute("billing")).equals("printing")){
				JOptionPane.showMessageDialog(null, "Cleared");
				session.setAttribute("billing", "yes");
				response.sendRedirect("ClearData");
			}
			else if(session.getAttribute("showbutton")=="yes"){
				%>
					var x = document.getElementById('showprintButton');
					if(x.style.display==='none'){
						<%
							session.removeAttribute("showbutton");
							session.setAttribute("showbutton", "yes");
						%>
						 x.style.display='block';
					 }<%-- else{
						 <%
						 	session.removeAttribute("showbutton");	
						 %>
						x.style.display='none';
					} --%>
				<%
			 }/* else if(session.getAttribute("backremove")=="yes"){
				 request.getRequestDispatcher("ClearData").include(request, response);
			 } */
		%>
	}
	
	function visibleDiv(){
		var prodid = document.getElementById('prodid').value;
		var turntpd = document.getElementById('turntpd');
		var turnfld = document.getElementById('turnfld');
		var turnmysr = document.getElementById('turnmysr');
		var turnpprd = document.getElementById('turnpprd');
		var turnmsld = document.getElementById('turnmsld');
		var turnupm = document.getElementById('turnupm');
		var turncrd = document.getElementById('turncrd');
		var turnunlm = document.getElementById('turnunlm');
		if(prodid=="tpd"){
			if(turntpd.style.display==='none'){
				turntpd.style.display='block';
				turnfld.style.display='none';
				turnmysr.style.display='none';
				turnpprd.style.display='none';
				turnmsld.style.display='none';
				turnupm.style.display='none';
				turncrd.style.display='none';
				turnunlm.style.display='none';
			}
		}
		else if(prodid=="fld"){
			if(turnfld.style.display==='none'){
				turnfld.style.display='block';
				turntpd.style.display='none';
				turnmysr.style.display='none';
				turnpprd.style.display='none';
				turnmsld.style.display='none';
				turnupm.style.display='none';
				turncrd.style.display='none';
				turnunlm.style.display='none';
			}
		}else if(prodid=="mysr"){
			if(turnmysr.style.display==='none'){
				turnfld.style.display='none';
				turntpd.style.display='none';
				turnmysr.style.display='block';
				turnpprd.style.display='none';
				turnmsld.style.display='none';
				turnupm.style.display='none';
				turncrd.style.display='none';
				turnunlm.style.display='none';
			}
		}else if(prodid=="pprd"){
			if(turnpprd.style.display==='none'){
				turnfld.style.display='none';
				turntpd.style.display='none';
				turnmysr.style.display='none';
				turnpprd.style.display='block';
				turnmsld.style.display='none';
				turnupm.style.display='none';
				turncrd.style.display='none';
				turnunlm.style.display='none';
			}
		}else if(prodid=="msld"){
			if(turnmsld.style.display==='none'){
				turnfld.style.display='none';
				turntpd.style.display='none';
				turnmysr.style.display='none';
				turnpprd.style.display='none';
				turnmsld.style.display='block';
				turnupm.style.display='none';
				turncrd.style.display='none';
				turnunlm.style.display='none';
			}
		}else if(prodid=="upm"){
			if(turnupm.style.display==='none'){
				turnfld.style.display='none';
				turntpd.style.display='none';
				turnmysr.style.display='none';
				turnpprd.style.display='none';
				turnmsld.style.display='none';
				turnupm.style.display='block';
				turncrd.style.display='none';
				turnunlm.style.display='none';
			}
		}else if(prodid=="crd"){
			if(turncrd.style.display==='none'){
				turnfld.style.display='none';
				turntpd.style.display='none';
				turnmysr.style.display='none';
				turnpprd.style.display='none';
				turnmsld.style.display='none';
				turnupm.style.display='none';
				turncrd.style.display='block';
				turnunlm.style.display='none';
			}
		}else if(prodid=="unlm"){
			if(turnunlm.style.display==='none'){
				turnfld.style.display='none';
				turntpd.style.display='none';
				turnmysr.style.display='none';
				turnpprd.style.display='none';
				turnmsld.style.display='none';
				turnupm.style.display='none';
				turncrd.style.display='none';
				turnunlm.style.display='block';
			}
		}
		
	}
	
	function checkval() {
		/* var name = document.myBillForm.cusName.value;
		if(name==null || name==''){
			alert("Please Fill the Customer Name");
			return false;
		} */
		var  e = document.getElementById("tableprod").rows.length;
		
		if(e<2){
			alert("Please Select Product for purchase");
			return false;
		}
	}
	function checkform() {
		/* var name = document.itemaddForm.quant.value;
		var e = document.getElementById("prodid"); */
		
		var q = document.itemaddForm.quant.value;
		
		/* var val = e.options[e.selectedIndex].value; */
		
		if(q==null || q==''){
			alert("Enter quantity Please");
			return false;
		}
		/* if(val=="0"){
			alert("Please Select Category");
			return false;
		} */
		/* else if(name==null || name==''){
			alert("Please Fill the Quantity");
			return false;
		} */
		
	}
	
	/* function show() {
		var save = document.getElementById("submitbutton");
		save.style.visibility = "visible";
	} */


</script>
</head>
<body onload="check()" onpageshow="if (event.persisted) check();" onunload="">
<div id="container">
	<div id="FirstDiv">
		<label style="font-size: 20px;">Thalai Restaurant</label>
		<!-- <a href="Index.html">Login</a> -->
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
	<div style="margin-top: 20px; border-top:dotted thin;">
	<a href="ClearTableData">Clear</a>
	<!-- <a href="Remove">Remove Last Row</a> -->
	<div>
	
	<form action="CreateBill" method="get" name="itemaddForm" onsubmit="return checkform()">
	
		<div id="showdiv" align="center" style="margin-top: 10px;">
			Select Product: <input list="products" name="prod" id="prodselect">
		  <%
		  	float tax=0;
	  		float discount=0;
		  	Connection connection=null;
		  	PreparedStatement statement;
		  	try{
			    Class.forName("com.mysql.jdbc.Driver");
			    connection = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
			    statement = (PreparedStatement)connection.prepareStatement("select * from product");
			    ResultSet rs = (ResultSet)statement.executeQuery();
			    %>
			    
			    <datalist id="products">
			    
			    <%
			    while(rs.next()){
			    		%>
			  							<option value="<%=rs.getString(2) %>"><%=rs.getString(1) %></option>
			  				
			    		<%
			    }
			    
		  	}catch(Exception e){
		  		e.printStackTrace();
		  	}
		  %>
		   </datalist>
		   
		   
		<%-- 		<label>Select Category</label>
			<select id="prodid" onchange="visibleDiv(this.value)">
				<option selected="selected" disabled="disabled" value="0">Select</option>
				<option value="tpd">tpd</option>
				<option value="fld">fld</option>
				<option value="mysr">mysr</option>
				<option value="pprd">pprd</option>
				<option value="msld">msld</option>
				<option value="upm">upm</option>
				<option value="crd">crd</option>
				<option value="unlm">unlm</option>
			</select>
			</div>
				<div id="turntpd" align="center" style="display: none; margin-top: 10px;">
				<label>Select product</label>
						  <%	
						  		String uname = session.getAttribute("UName").toString();
						 		System.out.println(uname);
						  		float tax=0;
						  		float discount=0;
						  		Connection connection=null;
								PreparedStatement statement;
								try{
							    Class.forName("com.mysql.jdbc.Driver");
							    connection = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
							    statement = (PreparedStatement)connection.prepareStatement("select * from product where ProductId like ?");
							    statement.setString(1, "tpd%");
							    ResultSet rs = statement.executeQuery();
							%>
								<select name="prod" id="prod" style="width: 200px;" >
								<option value="selectitem" disabled="disabled" selected="selected">---Select Item---</option>
								<%
								while(rs.next()){
									String prodname = rs.getString("ProductName");
									String pid= rs.getString("ProductId");
									%>
										<option value="<%=prodname%>" ><%=pid %>. <%=prodname%></option>
									<% 
								}
								%>
								<%
								}catch(Exception e){
									e.printStackTrace();
								}/* finally{
									connection.close();
								} */
								%>
				</select> 
			</div>
			<div id="turnfld" align="center"  style="display: none; margin-top: 10px;">
			<label>Select product</label>
						  <%	
								try{
							    Class.forName("com.mysql.jdbc.Driver");
							    connection = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
							    statement = (PreparedStatement)connection.prepareStatement("select * from product where ProductId like ?");
							    statement.setString(1, "fld%");
							    ResultSet rs = statement.executeQuery();
							%>
								<select name="prod" id="prod" style="width: 200px;" >
								<option value="selectitem" disabled="disabled" selected="selected">---Select Item---</option>
								<%
								while(rs.next()){
									String prodname = rs.getString("ProductName");
									String pid= rs.getString("ProductId");
									%>
										<option value="<%=prodname%>" ><%=pid%>. <%=prodname%></option>
									<% 
								}
								%>
								<%
								}catch(Exception e){
									e.printStackTrace();
								}finally{
									connection.close();
								}
								%>
				</select> 
			</div>
			<div id="turnmysr" align="center" style="display: none; margin-top: 10px;">
			<label>Select product</label>
						  <%	
								try{
							    Class.forName("com.mysql.jdbc.Driver");
							    connection = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
							    statement = (PreparedStatement)connection.prepareStatement("select * from product where ProductId like ?");
							    statement.setString(1, "mysr%");
							    ResultSet rs = statement.executeQuery();
							%>
								<select name="prod" id="prod" style="width: 200px;" >
								<option value="selectitem" disabled="disabled" selected="selected">---Select Item---</option>
								<%
								while(rs.next()){
									String prodname = rs.getString("ProductName");
									String pid= rs.getString("ProductId");
									%>
										<option value="<%=prodname%>" ><%=pid%>. <%=prodname%></option>
									<% 
								}
								%>
								<%
								}catch(Exception e){
									e.printStackTrace();
								}finally{
									connection.close();
								}
								%>
				</select> 
			</div>
			<div id="turnpprd" align="center" style="display: none; margin-top: 10px;">
			<label>Select product</label>
						  <%	
								try{
							    Class.forName("com.mysql.jdbc.Driver");
							    connection = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
							    statement = (PreparedStatement)connection.prepareStatement("select * from product where ProductId like ?");
							    statement.setString(1, "pprd%");
							    ResultSet rs = statement.executeQuery();
							%>
								<select name="prod" id="prod" style="width: 200px;" >
								<option value="selectitem" disabled="disabled" selected="selected">---Select Item---</option>
								<%
								while(rs.next()){
									String prodname = rs.getString("ProductName");
									String pid= rs.getString("ProductId");
									%>
										<option value="<%=prodname%>" ><%=pid%>. <%=prodname%></option>
									<% 
								}
								%>
								<%
								}catch(Exception e){
									e.printStackTrace();
								}finally{
									connection.close();
								}
								%>
				</select> 
			</div>
			<div id="turnmsld" align="center" style="display: none; margin-top: 10px;">
			<label>Select product</label>
						  <%	
								try{
							    Class.forName("com.mysql.jdbc.Driver");
							    connection = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
							    statement = (PreparedStatement)connection.prepareStatement("select * from product where ProductId like ?");
							    statement.setString(1, "msld%");
							    ResultSet rs = statement.executeQuery();
							%>
								<select name="prod" id="prod" style="width: 200px;" >
								<option value="selectitem" disabled="disabled" selected="selected">---Select Item---</option>
								<%
								while(rs.next()){
									String prodname = rs.getString("ProductName");
									String pid= rs.getString("ProductId");
									%>
										<option value="<%=prodname%>" ><%=pid%>. <%=prodname%></option>
									<% 
								}
								%>
								<%
								}catch(Exception e){
									e.printStackTrace();
								}finally{
									connection.close();
								}
								%>
				</select> 
			</div>
			<div id="turnupm" align="center" style="display: none; margin-top: 10px;">
			<label>Select product</label>
						  <%	
								try{
							    Class.forName("com.mysql.jdbc.Driver");
							    connection = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
							    statement = (PreparedStatement)connection.prepareStatement("select * from product where ProductId like ?");
							    statement.setString(1, "upm%");
							    ResultSet rs = statement.executeQuery();
							%>
								<select name="prod" id="prod" style="width: 200px;" >
								<option value="selectitem" disabled="disabled" selected="selected">---Select Item---</option>
								<%
								while(rs.next()){
									String prodname = rs.getString("ProductName");
									String pid= rs.getString("ProductId");
									%>
										<option value="<%=prodname%>" ><%=pid%>. <%=prodname%></option>
									<% 
								}
								%>
								<%
								}catch(Exception e){
									e.printStackTrace();
								}finally{
									connection.close();
								}
								%>
				</select> 
			</div>
			<div id="turncrd" align="center" style="display: none; margin-top: 10px;">
			<label>Select product</label>
						  <%	
								try{
							    Class.forName("com.mysql.jdbc.Driver");
							    connection = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
							    statement = (PreparedStatement)connection.prepareStatement("select * from product where ProductId like ?");
							    statement.setString(1, "crd%");
							    ResultSet rs = statement.executeQuery();
							%>
								<select name="prod" id="prod" style="width: 200px;" >
								<option value="selectitem" disabled="disabled" selected="selected">---Select Item---</option>
								<%
								while(rs.next()){
									String prodname = rs.getString("ProductName");
									String pid= rs.getString("ProductId");
									%>
										<option value="<%=prodname%>" ><%=pid%>. <%=prodname%></option>
									<% 
								}
								%>
								<%
								}catch(Exception e){
									e.printStackTrace();
								}finally{
									connection.close();
								}
								%>
				</select> 
			</div>
			<div id="turnunlm" align="center" style="display: none; margin-top: 10px;">
			<label>Select product</label>
						  <%	
								try{
							    Class.forName("com.mysql.jdbc.Driver");
							    connection = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
							    statement = (PreparedStatement)connection.prepareStatement("select * from product where ProductId like ?");
							    statement.setString(1, "unlm%");
							    ResultSet rs = statement.executeQuery();
							%>
								<select name="prod" id="prod" style="width: 200px;" >
								<option value="selectitem" disabled="disabled" selected="selected">---Select Item---</option>
								<%
								while(rs.next()){
									String prodname = rs.getString("ProductName");
									String pid= rs.getString("ProductId");
									%>
										<option value="<%=prodname%>" ><%=pid%>. <%=prodname%></option>
									<% 
								}
								%>
								<%
								}catch(Exception e){
									e.printStackTrace();
								}finally{
									connection.close();
								}
								%>
				</select>--%> 
			</div> 
			<div align="center" style="margin-top: 10px;">
				<label>Quantity</label>
				<input type="text" name="quant" id="qauntcal">
				<input type="submit" value="Add Item">
			</div>
			</form>
		</div>
		
		<div style="margin-top: 20px;" >
		
		<form action="AddBillProd" method="get" name="myBillForm" onsubmit="return checkval()" >
		<label style="margin-left: 550px;font-weight:bolder;">Name of Customer</label> <input type="text" name="cusName" ><br></br>
		<label style="margin-left: 550px;font-weight:bolder;">Email Id </label> <input type="text" name="to">
		
		<div align="center" style="margin-top:20px;">
			<table border="1" style="border-collapse: collapse;" id="tableprod">
			<tr>
				<th width="200px;" >Product Name</th>
				<th width="200px;">Price</th>
				<th width="200px;">Quantity</th>
				<th width="200px;">Total</th>
				<th width="200px">Delete</th> 
			</tr>
			<% try{
										Class.forName("com.mysql.jdbc.Driver");
									    connection = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
									    /* statement = (PreparedStatement)connection.prepareStatement("select * from billtable where UserName=?"); */
									    statement = (PreparedStatement)connection.prepareStatement("select * from billtable");
									    /* statement.setString(1, uname); */
									    ResultSet rs = statement.executeQuery();
									   while(rs.next()){
									%>
						<tr>
							<td> <%=rs.getString(1)%></td>
							<td> <%=rs.getFloat(2)%></td>
							<td><%=rs.getInt(3)%> </td>
							<td><%=rs.getFloat(4)%></td>
							<td><a href="DeletefrmbillTable?id=<%=rs.getInt(6)%>">Delete</a></td>
						</tr>
			<%		}
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					connection.close();
				}
			%>
		</table>
		</div>
		<div align="right" style="margin-right: 280px; margin-top: 20px;" >
			<table border="1" style="border-collapse: collapse;">
			<% try{
										Class.forName("com.mysql.jdbc.Driver");
									    connection = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
									    statement = (PreparedStatement)connection.prepareStatement("select * from tax");
									    ResultSet rs1 = statement.executeQuery();
									    boolean status = rs1.next();
									    if(status==true){
									    	tax = rs1.getFloat(1);	
									    	discount=rs1.getFloat(2);
									    }
			%>
			<tr>
				<th rowspan="1">Tax %</th>
				<td style="width: 70px;"><%=rs1.getFloat(1)%> %</td>
			</tr>
			<tr>
				<th rowspan="1">Discount %</th>
				<td style="width: 70px;"><%=rs1.getFloat(2)%> %</td>
			</tr>
			<tr>
				<th rowspan="1">Total Amount Payable</th>
				<td style="width: 70px;">
					<%
						float payamount=0;
						try{
						    /* statement = (PreparedStatement)connection.prepareStatement("select * from billtable where UserName =?"); */
						    statement = (PreparedStatement)connection.prepareStatement("select * from billtable ");
						    /* statement.setString(1, uname); */
						    ResultSet rs2 = statement.executeQuery();
						    while(rs2.next()){
						    	payamount = payamount + rs2.getFloat(4);
						    }
						    if(discount!=0){
						    	payamount = payamount - (discount/100)*payamount;	
						    }
						    if(tax!=0){
						    	payamount = payamount + payamount/tax;	
						    }
						   
							
						 }catch(Exception e){
							e.printStackTrace();
						}
					%>
					
					<%=payamount%>
				</td>
			</tr>
			<%
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					connection.close();
				}
			%> 
			</table>
		</div>
		<!-- <div onmouseover="show()" style="display: none;" id="showprintButton">
			<input type="submit" id="submitbutton" style="margin-top:30px; margin-left:600px; visibility: hidden;" value="Proceed To Print" >
		</div>  -->
		
		<div id="showprintButton">
			<input type="submit" id="submitbutton" style="margin-top:30px; margin-left:600px;" value="Proceed to Print">
		</div>
		
		</form>
		</div>
	</div>
</div>
</body>
</html>