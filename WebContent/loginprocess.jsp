<%@page import="java.sql.*"%>

<html>
<style>
.error
{
color:red;
}
</style>
<body>
<%
String email,password,b;
email=request.getParameter("email");
password=request.getParameter("password");
Boolean status=false;
try
{
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/ecommerce";
	Connection con=DriverManager.getConnection(url,"root","");
	PreparedStatement ps=con.prepareStatement("Select * from users where user_email=? and user_password=?");
	ps.setString(1,email);
	ps.setString(2,password);
	ResultSet rs=ps.executeQuery();
	status=rs.next();
	if(status)
	{
		b="cus";
		session.setAttribute("email1",email);
		session.setAttribute("b",b);
		%>
		<jsp:forward page="index.jsp"></jsp:forward>
		<%
		
	}else
	{
		%>
		<h2 class="error">invalid email or password</h2>
		<jsp:include page="login.jsp"/>
		<%
	}
}catch(Exception e)
{
	System.out.print(e);
}
%>
</body>
</html>