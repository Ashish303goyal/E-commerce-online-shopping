<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
body
{

background-image: url("../image/64147_1920_1200.jpg");
}
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
</style>
</head>
<body>
<center><h1>Add item</h1></center>
<form action="add_item_db.jsp" method="post">
<table>
<tr>
<td>
select category:&nbsp;&nbsp;&nbsp;</td>
<td><select name="cate" style="width:150px">
<option value="" selected>-------------------------</option>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","");
	PreparedStatement ps=con.prepareStatement("select category_name from category");
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
		%>
		<option><%=rs.getString("category_name") %></option>
		<%
	}
}catch(Exception e)
{
	out.println("data is not inserted");
}%>
</select>
</td>
<tr>
<td>
<strong>add product:</strong></td>
<td><input type="text" name="product_name"></td>
</tr>
<tr>
<td><strong>add quantity:</strong></td>
<td><input type="text" name="product_qty"></td>
</tr>
<tr>
<td><strong>cost:</strong></td>
<td><input type="text" name="product_cost"></td>
</tr>
<tr>
<td colspan="2">
<input type="submit" value="Submit">
</td>
</tr>
</table>
</form>
</body>
</html>