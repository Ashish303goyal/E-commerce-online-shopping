<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@page import="javax.servlet.* " %>
      <%
        Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/ecommerce";
	Connection cn=DriverManager.getConnection(url,"root","");
        Statement st=cn.createStatement();
        ResultSet rs=st.executeQuery("select picture from category");
        rs.next(); 
        String directoryname=application.getRealPath("/");
        String imagename=rs.getString("picture");
        String path=directoryname+"\\"+imagename;
        File f=new File(path);
    byte b[]=new byte[(int)f.length()];
    FileInputStream isr = new  FileInputStream(f);   // dont use read statement 
    OutputStream ops=response.getOutputStream();
    int nread=0;
    while( (nread=isr.read(b)) != -1 ) {
        ops.write(b, 0, nread);
    }
    ops.flush();
    ops.close();
%>