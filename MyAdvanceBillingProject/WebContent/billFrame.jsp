<%@page import="javax.print.attribute.standard.DateTimeAtProcessing"%>
<%@page import="java.util.Date"%>
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
<title>Billing</title>
<style type="text/css">
	@page {
	size:portrait;
    margin-top: 0mm;
    margin-bottom: 110mm;
 }
 @media print {
     body {margin-top: 0mm; margin-bottom: 0mm; 
           margin-left: 1mm; margin-right: 150mm}
}
</style>
<script type="text/javascript">
	function printDiv(divName) {
		<%
			session.setAttribute("billstart", "printing");
		%>
		var printContents = document.getElementById(divName).innerHTML;
		var originalCotents = document.body.innerHTML;
		
		document.body.innerHTML = printContents;
		
		window.print();
		document.body.innerHTML = originalCotents;
		
		window.location.replace("ClearData");
	}
</script>
</head>
<body>

<% Connection connection;
	PreparedStatement statement;
	float tax=0;
	float discount=0;
%>
<div id="printableArea">
	
		<h1 style="margin-left: 210px;">Invoice</h1>
	
	<table border="1" width="500px;" style="border-collapse: collapse; margin-left:5px;">
		<tr align="center">
			<td align="center"  height="30px;" width="100px;" colspan="1" ><a href="Index.jsp">
				<img src="IMG-20170806-WA0005.jpg" alt="" style="width:100px; height:auto;">
			</a>
			</td>
			<td width="400px;" height="50px;" colspan="5" align="right">Thalaai - The Mysore Cafe<br>
														  102,Sun Elegent, Hill Drive, Opp. Madhav Baug, Waghawadi Road<br>
														  Bhavnagar - 364002<br>
														  thalaaithemysorecafe@gmail.com
			</td>
		</tr>
<%-- 		<tr>
			<th colspan="1">Name of Customer</th>
			<td colspan="2"><input type="text" style="width: 300px;" value="<%=session.getAttribute("cusName")%>" disabled="disabled"></td>
			<th colspan="1" width="200px;"> Tax Number</th>
			<td colspan="2"><input type="text" style="width: 270px;" disabled="disabled" ></td>
		</tr> --%>
		<tr>
			<th colspan="1">Bill Date and Time</th>
			<td width="210px;"><% 	Date dt = new Date();
					DateTimeAtProcessing atProcessing = new DateTimeAtProcessing(dt);
				%>
				<%=atProcessing.getValue() %>
			</td>
			<th width="70px;" style="font-size: 12px;">Bill Number</th>
			<td><%=session.getAttribute("billid") %></td>
		</tr>
	</table>
	<table border="1" align="center" width="500px;" style="margin-top: 10px; margin-left:5px; border-collapse: collapse;">
				<tr>
				<th width="150px;">Product Name</th>
				<th width="50px;">Price</th>
				<th width="50px;">Quantity</th>
				<th width="50px;">Total</th>
			</tr>
			<% try{
										Class.forName("com.mysql.jdbc.Driver");
									    connection = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
									    /* statement = (PreparedStatement)connection.prepareStatement("select * from billtable where UserName=? "); */
									    statement = (PreparedStatement)connection.prepareStatement("select * from billtable");
									    /* statement.setString(1, session.getAttribute("UName").toString()); */
									    ResultSet rs = statement.executeQuery();
									   while(rs.next()){
									%>
						<tr>
							<td style="width: 150px;"> <%=rs.getString(1)%> </td>
							<td style="width: 50px;"> <%=rs.getFloat(2)%> </td>
							<td style="width: 50px;"> <%=rs.getInt(3)%> </td>
							<td style="width: 50px;"> <%=rs.getFloat(4)%> </td>
						</tr>
			<%		}
				}catch(Exception e){
					e.printStackTrace();
				}
			%>
	</table>
	<table width="235px;" border="1" style="margin-top: 10px; margin-left: 270px; border-collapse: collapse;">
			<% try{
										Class.forName("com.mysql.jdbc.Driver");
									    connection = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
									    statement = (PreparedStatement)connection.prepareStatement("select * from tax");
									    ResultSet rs1 = statement.executeQuery();
									    boolean status = rs1.next();
									    if(status==true){
									    	tax = rs1.getFloat(1);	
									    	discount = rs1.getFloat(2);
									    }
			%>
			<tr>
				<th rowspan="1">Tax %</th>
				<td><%=rs1.getFloat(1)%></td>
			</tr>
			<tr>
				<th rowspan="1">Discount %</th>
				<td><%=rs1.getFloat(2)%></td>
			</tr>
			<tr>
				<th rowspan="1" >Total Amount Payable</th>
				<td >
					<%
						float payamount=0;
						try{
							Class.forName("com.mysql.jdbc.Driver");
						    connection = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
						    /* statement = (PreparedStatement)connection.prepareStatement("select * from billtable where UserName=? "); */
						    statement = (PreparedStatement)connection.prepareStatement("select * from billtable");
						    /* statement.setString(1, session.getAttribute("UName").toString()); */
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
					<%=payamount %>
				</td>
			</tr>
			<%
				}catch(Exception e){
					e.printStackTrace();
				}
			%> 
			</table>
</div>

	<div style="margin-top: 100px;" align="center" >
			<input type="button" onclick="printDiv('printableArea')" value="Print">
			<!-- <input type="button" onclick="goBack()" value="Go Back"> -->
	</div>
	
</body>
</html>