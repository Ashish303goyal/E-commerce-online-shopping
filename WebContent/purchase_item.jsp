<%@page import="java.sql.*" %>
<!doctype html>
<head>
<style>
a
{
text-decoration:none;
color:green;
font-size:25px;
}
.f
{
position:relative;
float:right;
text-decoration:none;
}
.f a
{
text-decoration:none;
color:red;
}

table
{
position:relative;
left:30%;
}
input[type="number"]
{
width:100%;
height:27px;
border-radius:5px;
box-sizing:border-box;
}
input[type="submit"]
{
position:relative;
left:45%;
}
.ab1
{
color:red;
font-size:20px;
}
</style>
</head>
<body>
<center><h2><b>apni dukan</b></h2></center>
<%
String b=(String)session.getAttribute("b");
if(b==null){
%>
<jsp:include page="fblogin.jsp"/>
<a href="index.jsp">home</a>
<%
}else{
	%>
	<div class="f"><a href="logout1.jsp">logout</a></div>
	<a href="index.jsp">home</a>
<%}
%>
<br>
<hr>

<%
try
{
	String name2=request.getParameter("product_name");
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/ecommerce";
	Connection con=DriverManager.getConnection(url,"root","");
	PreparedStatement ps=con.prepareStatement("Select * from products where product_name=?");
	ps.setString(1, name2);
	ResultSet rs=ps.executeQuery();
	%>
	<p class="ab1">Item is available only on cash on delivery</p>
	<form action="pruchase_report.jsp" method="post">
	<table border="1px solid blue">
	<tr>
	<th><strong>product_name</strong></th>
	<th><strong>product_price</strong></th>
	<th><strong>Available product_qty</strong></th>
	<th><strong>add quantity product</strong></th>
	</tr>
	<%
	if(rs.next())
	{
		String name1;
		%>
		<tr>
		
		<%name1=rs.getString("category_name");		
		%>
		
		
		<td>
		<%
		out.println(name2);
		   session.setAttribute("product_name1",name2);
		%>
		</td>
		<td>
		<%=rs.getInt("product_price") %>
		</td>
		<td>
		<%=rs.getString("product_qty") %>
		</td>
		<td>
		<input type="number" name="quantity" min="1" max="<%=rs.getString("product_qty") %>" step="1" value="1">
		<!--<a href=<%= "\"delete_item_db.jsp?category_name=" + name1 + "\"" %> >delete</a>-->
		<!-- <a href="delete_item_db.jsp?category_name="+<%=rs.getString("category_name") %>>delete</a> -->
		</td>
		</tr>
		<%
	}
	%>
	</table>
	<br>
	<input type="submit" value="Submit">
	</form>
	<%
}catch(Exception e)
{
	System.out.print(e);
}
%>
</body>
</html>