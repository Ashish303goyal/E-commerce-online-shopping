<%@page import="java.sql.*" %>
<!doctype html>
<head>
<style>
.red
{
color:red;
font-size:25px;
}
.lo
{
font-size:150%;
position:relative;
left:90%;
}
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
</style>
</head>
<body>
<p class="red">you must login first</p>
<p class="lo">
<a href="login.jsp">login</a>|    
<a href="register.html">signup</a>
</p>
<hr>
<h1><center>apni dukan</center></h1>
<h3>select category for purchase</h3>
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
	</tr>
	<%
	while(rs.next())
	{
		String name1;
		%>
		<tr>
		<td>
		<%name1=rs.getString("category_name");
		%>
		<a href=<%= "\"item_purchase.jsp?category_name=" + name1 + "\"" %> ><%out.println(name1); %></a>
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

