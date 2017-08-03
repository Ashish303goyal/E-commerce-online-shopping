<!DOCTYPE html>  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
<title>JSP CRUD Example</title>  
<style>
table
{
position:relative;
left:37%;
}
table,tr,td
{
border:2px solid blue;
border-collapse:collapse;
}
tr,td
{
padding:15px;
}
a
{
text-decoration:none;
}
a:hover
{
color:black;
text-decoration:underline;
}
</style>
</head>  
<body> 
<%String email=(String)session.getAttribute("email1");%>
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
<h1>Admin Control Pannel</h1>  
</center>
<table>
<tr>
<td>
<a href="add_category.jsp">Add Category</a>  
</td>
<td>
<a href="add_item.jsp">Add Items</a>
</td>
<td>
<a href="category_report.jsp">Category Report</a>
</td>
</tr>
<tr>
<td>
<a href="delete_category.jsp">Delete Category</a>
</td>
<td>
<a href="delete_item.jsp">Delete Product</a>
</td>
<td>
<a href="view_purchase_report.jsp">View Purchase Report</a>  
</tr>
</table>
</body>
</html>