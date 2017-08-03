<%@page import="java.sql.*"%>

<html>
<style>
.error
{
position:relative;
left:40%;
color:red;
}
</style>
<body>
<%
String email,password;
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
		session.setAttribute("email1",email); 
		String redirectURL="adminaccess.jsp";
		response.sendRedirect(redirectURL);
	}else
	{
		%>
		<jsp:include page="adminlogin.jsp"/>
		<h2 class="error">invalid email or password</h2>
		<%
	}
}catch(Exception e)
{
	System.out.print(e);
}
%>
</body>
</html>