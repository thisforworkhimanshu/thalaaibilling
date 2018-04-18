<%@page import="javax.swing.JOptionPane"%>
<%@page import="com.mysql.jdbc.Statement"%>
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
			request.getRequestDispatcher("ClearData").include(request,response);
		%>
		
	}
</script>
</head>
<body style="margin:0px; padding: 0px;" onload="check()">
<div>	
	
	<form action="">
		<a href="login.jsp" style="text-decoration: none;"> Profile Page</a>
			<label style="margin-left: 450px;">Enter Year<input type="text" name="yeartxt" onblur="this.form.submit()"></label>
		<a href="Index.jsp" style=" margin-left:500px; text-decoration: none;">Home Page</a>
	</form>
</div>

<div align="center" style="float: left; width: 48%; height: 500px; border: dotted; max-height: 500px; overflow: auto;">
	
		<table cellspacing="5px" border="1" style="width:600px; border-collapse: collapse;">
			<thead style="position: fixed; width: 600px; background-color: black; color: white;">
			<tr align="center">
				<th colspan="3" width="600px">Selling Table</th>
			</tr>
			<tr>
					<th width="200px">Bill Number</th>
					<th  width="300px">Customer Name </th>
					<th  width="100px">Bill Amount</th>
			</tr>
			</thead>
		</table>
		<table cellspacing="5px" border="1" style="width:600px; border-collapse: collapse; margin-top: 50px;">
			<%		
					String year = request.getParameter("yeartxt");
					float selltotal=0;
					Connection connection;
					PreparedStatement statement;
					Statement smt;
					try{
						 Class.forName("com.mysql.jdbc.Driver");
						 connection = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
						 
						 /* String sql="select * from totalsell where UserName= '"+session.getAttribute("UName").toString()+"' and year like '"+year+"%'  "; */
						 
						 String sql="select * from totalsell where year like '"+year+"%'  ";
						 smt = (Statement)connection.createStatement();
						 
						 /* statement = (PreparedStatement)connection.prepareStatement("select * from totalsell where Year=?");
						 statement.setString(1, year);
						 ResultSet rs = (ResultSet)statement.executeQuery(); */
						 
						 ResultSet rs = (ResultSet)smt.executeQuery(sql);
						 while(rs.next()){
							 	selltotal = selltotal + rs.getFloat(2);
							%>
									<tr>
											<td width="200px"><%=rs.getString(7) %></td>
											<td width="300px"><%=rs.getString(1) %></td>
											<td width="100px"><%=rs.getFloat(2) %></td>
									</tr>
							
							<%
						 }
					}catch(Exception e){
						e.printStackTrace();
					}
			
			%>
			
		</table>
		
</div>

<div align="center" style="margin-left:10px; float:left; width: 50%; height: 500px; border: dotted; max-height: 500px; overflow: auto;">
	
		<table cellspacing="5px" border="1" style="width:600px; border-collapse: collapse;">
			<thead style="position: fixed; width: 600px;  background-color: black; color: white;">
			<tr align="center">
				<th colspan="4" width="600px">Purchase Table</th>
			</tr>
			<tr>
					<th width="150px">Purchase Date</th>
					<th width="150px">Bill Number</th>
					<th  width="200px">Shop Name</th>
					<th  width="100px">Total Price</th>
			</tr>
			</thead>
		</table>
		<table cellspacing="5px" border="1" style="width:600px; border-collapse: collapse; margin-top: 50px;">
			<%		
					Statement stmt;
					float purchasetotal=0;
					float total=0;
					try{
						 Class.forName("com.mysql.jdbc.Driver");
						 connection = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
						 
						 
						 /* String sql="select * from purchase where UserName='"+session.getAttribute("UName").toString()+"' and PDate like '"+year+"%' "; */
						 
						  String sql="select * from purchase where PDate like '"+year+"%'  ";
						 stmt = (Statement)connection.createStatement();
 						 
						 /* statement = (PreparedStatement)connection.prepareStatement("select * from purchase where pDate like ?");
 						 statement.setDate(1,"'"+year+"%' ");
						 ResultSet rs = (ResultSet)statement.executeQuery();*/
						 
						 ResultSet rs = (ResultSet)stmt.executeQuery(sql);
						 while(rs.next()){
							 	purchasetotal = purchasetotal + rs.getFloat(5);
							 	purchasetotal = purchasetotal + rs.getFloat(6);
							 	total = rs.getFloat(5)+ rs.getFloat(6);
							 	
							%>
									<tr>
											<td width="150px"><%=rs.getDate(2) %></td>
											<td width="150px"><%=rs.getString(3) %></td>
											<td width="200px"><%=rs.getString(4) %></td>
											<td width="100px"><%=total %></td>
									</tr>
							
							<%
						 }
					}catch(Exception e){
						e.printStackTrace();
					}
			
			%>
		</table>	
</div>
<div style="float:left; margin-top:10px; margin-bottom:5px; border: dotted; width: 100%; height: 80px;">
	<label style="margin-left: 100px;"> <strong>Selling Total   </strong></label> <label><%=selltotal %></label>
	<label style="margin-left: 850px;"> <strong>Purchase Total   </strong></label> <label><%=purchasetotal %></label> <br>
	<label style="margin-left: 590px;"> <strong>Net Amount   </strong></label> <label><%=selltotal-purchasetotal %></label>
</div>

</body>
</html>