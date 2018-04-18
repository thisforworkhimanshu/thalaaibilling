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
	<%
		if(session.getAttribute("UName")==null){
			JOptionPane.showMessageDialog(null, "Please Login First");
			response.sendRedirect("Index.jsp");
		}else if(session.getAttribute("ename")!=null){
				session.removeAttribute("ename");
				response.sendRedirect("SearchEmploy.jsp");
			}
		%>
}
</script>
</head>
<body onload="check()">
<div style="float: left" id="aefirst">
	<ul>
		<li style="margin: 0px;"><a href="Index.jsp">Home</a> </li>
		<li><a href="addEmploye.jsp">Add Employee</a> </li>
		<li><a href="SearchEmploy.jsp">Search Employee</a> </li>
		<li><a href="mybill.jsp">Create Bill</a> </li>
	</ul>
</div>
<div style="float: left; margin-top: 20px; margin-left: 6%;" id="empForm"  >
<div align="center" style="margin-top: 5%">
	<%
		Connection connection=null;
		PreparedStatement statement;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
			/* statement = (PreparedStatement) connection.prepareStatement("select * from employe where UserName=?"); */
			statement = (PreparedStatement) connection.prepareStatement("select * from employe");
			/* statement.setString(1, session.getAttribute("UName").toString()); */
			ResultSet rs = statement.executeQuery();
			%>
				<table border="1" style="border-collapse: collapse;" width="900px">
					<tr>
						<th width="100px">Employee Id</th>
						<th width="150px">Employee Name</th>
						<th width="300px">Address</th>
						<th width="150px">Mobile Number</th>
						<th width="300px">Email</th>
					</tr>
					<%while(rs.next()){
						%>
							<tr>
								<td><%=rs.getInt(1) %></td>
								<td><%=rs.getString(2) %></td>
								<td><%=rs.getString(3) %></td>
								<td><%=rs.getString(4) %></td>
								<td><%=rs.getString(5) %></td>
							</tr>
						<%
					}
						%>
				</table>
			<% 
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			connection.close();
		}
	%>
</div>
</div>
</body>
</html>