<%@page import="java.sql.*"%>

<html>
<body>
<%
String fname,lname,email,password,address,phone,confirm_password;
fname=request.getParameter("fname");
lname=request.getParameter("lname");
email=request.getParameter("email");
password=request.getParameter("pass");
confirm_password=request.getParameter("cun_pass");
address=request.getParameter("address");
phone=request.getParameter("phone");
 if(password.equals(confirm_password))
{
try
{
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/ecommerce";
	Connection con=DriverManager.getConnection(url,"root","");
	PreparedStatement ps=con.prepareStatement("insert into users(last_name,first_name,user_email,user_password,user_address,user_phone) values(?,?,?,?,?,?)");
	ps.setString(1,lname);
	ps.setString(2,fname);
	ps.setString(3,email);
	ps.setString(4,password);
	ps.setString(5,address);
	ps.setString(6,phone);
	ps.executeUpdate();
	session.setAttribute("email1",email);
	%>
	<jsp:forward page="index.jsp"></jsp:forward>
	<%
}
catch(SQLException e)
{
   out.println(e);
}
}else
{
	out.println("password missmatch proble!!!!!");
	%>
	<jsp:include page="register.html"></jsp:include>
	<%
}


%>
</body>
</html>