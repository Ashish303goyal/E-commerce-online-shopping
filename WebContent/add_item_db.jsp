<%@page import="java.sql.*" %>
<!doctype html>
<head>
</head>
<body>
<%
String cate,product_name,product_qty,product_cost;
cate=request.getParameter("cate");
product_name=request.getParameter("product_name");
product_qty=request.getParameter("product_qty");
product_cost=request.getParameter("product_cost");
Boolean status=false;
try
{
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/ecommerce";
	Connection con=DriverManager.getConnection(url,"root","");
	PreparedStatement ps=con.prepareStatement("Select * from products where category_name='"+cate+"' and product_name='"+product_name+"'");
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		
		out.println("<center>item is already available</center>");
	}else
	{
		out.println("asjso");
		ps=con.prepareStatement("insert into products(product_name,product_qty,product_price,category_name) values ('"+product_name +"','"+product_qty +"','"+product_cost +"','"+cate +"')");
		int k=ps.executeUpdate();
		if(k>0){   
			request.getRequestDispatcher("add_item.jsp").forward(request,response);
	            }
		else{
	        	  System.out.println("not uploaded");
	        	  %><h1>not update</h1><%
	        }
	}
}catch(Exception e)
{
	System.out.print(e);
}
%>
</body>
</html>