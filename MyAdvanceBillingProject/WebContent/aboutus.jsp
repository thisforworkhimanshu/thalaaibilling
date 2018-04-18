<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>About Us</title>
<script type="text/javascript">
	
	function check() {
		<% request.getRequestDispatcher("ClearData").include(request,response);%>	
	}

</script>
</head>
<body onload="check()">
<div align="center">
	Hello! This is developed for Personnel Use only, not for public use.<br>
	<marquee direction="left">We are under improvement</marquee>
</div>

<div align="right">
	<input type="button" onclick="window.location='Index.jsp' " value="Click To Home">
</div>
</body>
</html>