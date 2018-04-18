<%@page import="javax.swing.JOptionPane"%>
<%@page import="com.mysql.jdbc.ResultSet"%>
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
<script type="text/javascript">

		function check() {
				<%
					if(session.getAttribute("UName")==null){
						JOptionPane.showMessageDialog(null, "Please Login First");
						response.sendRedirect("Index.jsp");
					}
		%>
		}

</script>
</head>
<body style="margin: 0px; padding: 0px;" onload="check()">
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
			<li style="display: inline; margin-left: 35px;"><a href="addPurchases.jsp" style="text-decoration: none; color: blue;">Add Purchases</a> </li>
			
		</ul>
	</div>
</div>

<div style="margin-left:0px; padding:0px; margin-top: 60px; float: left; width: 100%">
	<div align="center" style="margin-top: 20px;">
		<table border="1" width="900px" style="border-collapse: collapse;">
			<tr>
				<th>Purchase Id</th>
				<th>Purchase Date</th>
				<th>Bill Number</th>
				<th>Shop Name</th>
				<th>Goods Price</th>
				<th>Tax Amount</th>
			</tr>
			
			<%		 Connection connection;
				 	 PreparedStatement statement;
				 	 float taxamounttotal=0;
				 	 float goodsamounttotal=0;
					 try{
							Class.forName("com.mysql.jdbc.Driver");
						    connection = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
						    statement = (PreparedStatement)connection.prepareStatement("select * from purchase");
						    ResultSet rs = (ResultSet)statement.executeQuery();
						    while(rs.next()){
						    		goodsamounttotal = goodsamounttotal + rs.getFloat(5);
						    		taxamounttotal = taxamounttotal + rs.getFloat(6);
						    	%>
						    			<tr>
						    						<td><%=rs.getInt(1) %></td>
													<td><%=rs.getDate(2) %></td>
													<td><%=rs.getString(3) %></td>
													<td><%=rs.getString(4) %></td>
													<td><%=rs.getFloat(5) %></td>
													<td><%=rs.getFloat(6) %></td>
						    			</tr>
						    	
						    	<%
						    }
					 }catch(Exception e){
						 response.getWriter().println(e);
					 }
			%>
			
		</table>
		<table border="1" width="900px" style="margin-top: 20px; margin-bottom:20px; border-collapse: collapse;">
				<tr>
					<th>Total Goods Amount</th>
					<td align="right"><%=goodsamounttotal %></td>
				</tr>
				<tr>
					<th>Total Tax Amount</th>
					<td align="right"><%=taxamounttotal %></td>
				</tr>
				<tr>
					<th>Total Amount</th>
					<td align="right"><%=goodsamounttotal+taxamounttotal %></td>
				</tr>
		</table>
	</div>
</div>
</body>
</html>