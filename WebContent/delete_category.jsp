<%@page import="java.sql.*" %>
<!doctype html>
<head>
<style>
table
{
position:relative;
left:40%;
border-collapse:collapse;
}
tr,td
{
border-collapse:collapse;
padding:10px;
}
</style>
</head>
<body>
<center><h1>delete category pannel</h1></center>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/ecommerce";
	Connection con=DriverManager.getConnection(url,"root","");
	PreparedStatement ps=con.prepareStatement("Select * from category ");
	ResultSet rs=ps.executeQuery();
	%>
	<table border="1px solid blue">
	<tr>
	<th><strong>category_name</strong></th>
	<th><strong>category_delete</strong></th>
	</tr>
	<%
	while(rs.next())
	{
		String name1;
		%>
		<tr>
		<td>
		<%name1=rs.getString("category_name");
		out.println(name1);
		
		%>
		<td>
		<a href=<%= "\"delete_category_db.jsp?category_name=" + name1 + "\"" %> >delete</a>
		<!-- <a href="delete_item_db.jsp?category_name="+<%=rs.getString("category_name") %>>delete</a> -->
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