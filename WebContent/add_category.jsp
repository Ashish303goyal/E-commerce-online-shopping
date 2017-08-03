<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
body{
background:	#F0F8FF;}
div{
background:	#D3D3D3;
position:relative;
left:30%;
top:20%;
border:1px solid green;
width:500px;
height:180px;
padding:15px;}
input[type="submit"]
{
position:relative;
left:38%;
padding:4px;
}
</style>
</head>

<body> 
<%
String email=(String)session.getAttribute("email1");
%>
<b><%=email%></b><a href="logout.jsp">logout</a>

<%
if(email==null)
{ 
%>
<jsp:forward page="adminlogin.jsp"/>
<%	
}
%>
<center>
<h2>Category add product pannel</h2>
</center>
<div class="abc">
<form action="add_category_name.jsp" method="post" enctype="multipart/form-data">
category name:&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<input type="text" name="category_name"><br><br>
category pic:&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<input type="file" name="ImageFile" width="100"><br><br>
category description:&nbsp; &nbsp; &nbsp;<textarea rows="4" cols="30" name="category_description"></textarea><br><br>
<input type="submit" value="submit"><br>
</form>
</div>
</body>
</html>

