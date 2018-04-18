<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div align="center" style="margin-top: 250px;">
	<form action="checkprofile" method="post">
	<table>
		<tr>
			<th>Enter Your Profile PassWord Given By Developer</th>
			<td><input type="password" name="profilepass"></td>
		</tr>
		<tr>
			<td><input type="submit" value="Lets Check You!">
				<input type="button" value="Not You?" onclick="window.location.replace('Index.jsp')">
			</td>
		</tr>
	</table>
	</form>
</div>
</body>
</html>