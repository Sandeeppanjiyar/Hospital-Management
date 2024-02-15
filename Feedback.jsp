<%@ page session="true" %>
<%@ page import="java.sql.*" errorPage="Error.html" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page language="java" %>

<html>
<head><title>Feedback</title></head>
<body background="Img1.GIF">
<a href="Home.html"><font size="2"><b><i>Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Feedback.html">Back</i></b></font></a>
<%
   String Name=request.getParameter("name");
   String Address=request.getParameter("address");
   String Phone=request.getParameter("phone");
   String Fax=request.getParameter("fax");
   String Mail=request.getParameter("mail");
   String Comments=request.getParameter("comments");
   String IPAddress=request.getRemoteHost();

   if(Fax.length()==0)
   Fax="Nil";    
   if(Mail.length()==0)
   Mail="Nil";           
           
   GregorianCalendar now=new GregorianCalendar();
           
   DateFormat fmtt=new SimpleDateFormat("dd/MM/yyyy");
   String Date=fmtt.format(now.getTime());
            
   DateFormat fmt=new SimpleDateFormat("hh:mm:ss aa");
   String Time=fmt.format(now.getTime());
                 
   Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
   Connection myConn=DriverManager.getConnection("jdbc:odbc:Hospital");
   Statement stmt=myConn.createStatement();
   int result=stmt.executeUpdate("Insert into Feedback values('"+Name+"','"+Address+"','"+Phone+"','"+Fax+"','"+Mail+"','"+Comments+"','"+IPAddress+"','"+Date+"','"+Time+"')");
%>
   <p align="Center"><font size="6" color="red"><b><u><i><br><br><br>Your Feedback has been sent Successfully</i></u></b></font></p>
<%
   stmt.close();
   myConn.close();
%> 
</body>
</html>