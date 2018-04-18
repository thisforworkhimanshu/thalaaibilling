<%@page import="javax.swing.JOptionPane"%>
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
			if(String.valueOf(session.getAttribute("UName")).equals("himanshu")==false){
				JOptionPane.showMessageDialog(null, "Admin Can Access Only");
				response.sendRedirect("Index.jsp");
			}
			/* 	if(session.getAttribute("UName")==null){
					JOptionPane.showMessageDialog(null, "Login");
					response.sendRedirect("Index.jsp");
				} */
		%>
		}
</script>
</head>
<body>
<div align="right">
	<a href="Index.jsp">Home</a>
</div>
<div align="center">
	<form action="SendMailServlet">  
		To:<input type="text" name="to" style="margin-top: 10px;"/><br/>  
		Subject:<input type="text" name="subject" style="margin-top: 10px;"/><br/>  
		Text:
		<textarea rows="10" cols="70" name="msg"></textarea><br/>  
		<input type="submit" value="send"/>  
	</form>
</div>  
</body>
</html>