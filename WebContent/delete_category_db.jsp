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
	Statement stmt=con.createStatement();
	stmt.executeUpdate("delete from products,category where products.category_name=? or category.category_name=? ");
	out.println(name);
	response.sendRedirect("delete_category.jsp");
	con.commit();
}catch(Exception e)
{
	System.out.print(e);
}
%>
</body>
</html>