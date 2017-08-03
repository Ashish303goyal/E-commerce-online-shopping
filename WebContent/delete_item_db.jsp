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
	String name=request.getParameter("category_name");
	out.println(name);
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/ecommerce";
	Connection con=DriverManager.getConnection(url,"root","");
	PreparedStatement ps=con.prepareStatement("delete from products where category_name=? ");
	ps.setString(1,name);
	ps.executeUpdate();
	out.println(name);
	response.sendRedirect("delete_item.jsp");
	con.commit();
}catch(Exception e)
{
	System.out.print(e);
}
%>
</body>
</html>