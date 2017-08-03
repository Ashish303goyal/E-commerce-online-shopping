<%@page import="java.sql.*" %>
<!doctype html>
<head>
<style>
table,tr,td
{
border-collapse:collapse;
}
</style>
</head>
<body>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/ecommerce";
	Connection con=DriverManager.getConnection(url,"root","");
	PreparedStatement ps=con.prepareStatement("Select * from products ");
	ResultSet rs=ps.executeQuery();
	%>
	<table border="1px solid blue">
	<tr>
	<th><strong>category_name</strong></th>
	<th><strong>product_name</strong></th>
	<th><strong>product_price</strong></th>
	<th><strong>Available product_qty</strong></th>
	<th><strong>delete product</strong></th>
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
		</td>
		
		<td>
		<%=rs.getString("product_name") %>
		</td>
		<td>
		<%=rs.getInt("product_price") %>
		</td>
		<td>
		<%=rs.getString("product_qty") %>
		</td>
		<td>
		<a href=<%= "\"delete_item_db.jsp?category_name=" + name1 + "\"" %> >delete</a>
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