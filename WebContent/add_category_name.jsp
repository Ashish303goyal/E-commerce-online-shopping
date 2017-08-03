

<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int limit=1024*1024*1024;
MultipartRequest mpr=new MultipartRequest(request,application.getRealPath("/"),limit);
String cnam,cdes;
cnam=mpr.getParameter("category_name");
System.out.println(cnam);

cdes=mpr.getParameter("category_description");
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/ecommerce";
Connection cn=DriverManager.getConnection(url,"root","");


String saveDir = application.getRealPath("/");
File f = new File(saveDir);
f.mkdirs();
String w=mpr.getOriginalFileName("ImageFile");
Statement st=null;
ResultSet rs=null;
PreparedStatement ps=cn.prepareStatement("select category_name from category where category_name ='"+cnam+"'");
//int rs=st.executeUpdate("insert into category(category_name,description,picture) values('"+cnam+"','"+cdes+"','"+w+"')");
rs=ps.executeQuery();
if(rs.next())
{
	out.println("<center><h1>alresdy present</h1></center>");
	%>
	<a href="add_category.jsp">add category</a>
	<%
}else
{
	ps=cn.prepareStatement("insert into category(category_name,description,picture) values('"+cnam+"','"+cdes+"','"+w+"')");
	int k=ps.executeUpdate();
	if(k>0){   
		request.getRequestDispatcher("add_category.jsp").forward(request,response);
           }
	else{
        	  out.println("not uploaded");
        	  %><h1>not update</h1><%
    	}
}
/*if(k>0){   
	System.out.println("uploaded successfully");
	System.out.println("forwarded");
	System.out.println(request.getAttribute("email1"));
	request.getRequestDispatcher("add_category.jsp").forward(request,response);
	*/
%>
</body>
</html>


