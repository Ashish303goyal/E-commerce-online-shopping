<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

		<%
		
		String email=(String)request.getParameter("email");
		String f1_name=(String)request.getParameter("first_name");
		String l1_name=(String)request.getParameter("last_name");
		
			 try
			 {
				    Class.forName("com.mysql.jdbc.Driver");
					String url="jdbc:mysql://localhost:3306/ecommerce";
					Connection con=DriverManager.getConnection(url,"root","");
					PreparedStatement ps=con.prepareStatement("insert into users(first_name,last_name,user_email) values(?,?,?)");
					ps.setString(1,f1_name);
					ps.setString(2,l1_name);
					ps.setString(3,email);
					ps.executeUpdate();
					System.out.println("execter update");
			 }catch(SQLException e)
			 {
				   System.out.println(e);
			}
		
			 System.out.println(email);
			 session.setAttribute("email1",email);
			 response.sendRedirect("index.jsp");
			%><br>

</body>
</html>