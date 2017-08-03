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
<center><b>Purchase report</b></center>
<%
int c,k,q,qty;
String abc;
String name=request.getParameter("quantity");
String pro_name=(String)session.getAttribute("product_name1");
q=Integer.parseInt(name);

try
{
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/ecommerce";
	Connection con=DriverManager.getConnection(url,"root","");
	PreparedStatement ps=con.prepareStatement("Select * from products where product_name=? ");
	ps.setString(1,pro_name);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		String name1;
		
		
		name1=rs.getString("category_name");		
		
		c=rs.getInt("product_price");
		k=c*q;
		qty=rs.getInt("product_qty");
		out.println(q);
		qty=qty-q; 
		Statement ps1=con.createStatement();
		ps1.executeUpdate("update products set product_qty='"+qty+"' where product_name='"+pro_name+"' ");
		abc=(String)session.getAttribute("email1");
		PreparedStatement ps2=con.prepareStatement("insert into order1 (product_qty, total_cost, product_name, user_email) values (?,?,?,?)");
		ps2.setInt(1,q);
		ps2.setInt(2,k);
		ps2.setString(3,pro_name);
		ps2.setString(4,abc);
		ps2.executeUpdate();
		
	}
	response.sendRedirect("last.jsp");
	
}catch(Exception e)
{
	System.out.print(e);
}

%>
</body>
</html>