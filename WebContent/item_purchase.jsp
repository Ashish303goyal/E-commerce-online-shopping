<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
table
{

border-collapse:collapse;
}
tr,td
{
border-collapse:collapse;
padding-top:30px;
padding-right:30px;
padding-bottom:30px;
padding-left:15px;
}
.first
{
position:relative;
left:85%;
font-size:20px;
color:green;
}
</style>
</head>
<body>
<%
String email=(String)session.getAttribute("email1");
%>
<a href="index.jsp">home</a>
<p class="first"><%=email %></p>
<h1> purchase item </h1>
<%
if(email==null)
{
	%>
	<h1>you must login in first</h1>
	<jsp:forward page="index1.jsp"/>
	<%
}
try
{
	String name=request.getParameter("category_name");
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/ecommerce";
	Connection con=DriverManager.getConnection(url,"root","");
	PreparedStatement ps=con.prepareStatement("select * from products where category_name=? ");
	ps.setString(1,name);
	ResultSet rs=ps.executeQuery();
	%>
	<table border="1px solid blue">
	<tr>
	<th><strong>product_name</strong></th>
	<th><strong>product_price</strong></th>
	<th><strong>product_qty</strong></th>
	</tr>
	<%
	while(rs.next())
	{
		String name1;
		%>
		<tr>	
		<td>
		<%name1=rs.getString("product_name");
		out.println(name1);
		%>
		</td>
		<td>
		<%=rs.getInt("product_price") %>
		</td>
		<td>
		<a href=<%= "\"purchase_item.jsp?product_name=" + name1 + "\"" %> >Purchase</a>
		</td>
		</tr>
		<%
	}
	%>
	</table>
	<%
}catch(Exception e)
{
	System.out.print(e);
}
%>
</body>
</html>