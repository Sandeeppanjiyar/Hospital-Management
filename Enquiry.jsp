<%@ page session="true" %>
<%@ page import="java.sql.*" errorPage="Error.html" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page language="java" %>

<html>
<head><title>Enquiry</title></head>
<body background="Img1.GIF">
    <a href="Home.html"><font size="2"><b><i>Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Enquiry.html">Back</i></b></font></a>

<%
  String Name=request.getParameter("name");
  String Address=request.getParameter("address");
  String Phone=request.getParameter("phone");
  String Fax=request.getParameter("fax");
  String Mail=request.getParameter("mail");
  String Problem=request.getParameter("problem");
  String Investigation=request.getParameter("investigation");
  String Category=request.getParameter("category"); 
  String Date1=request.getParameter("date1");
  String Month1=request.getParameter("month1");
  String Year1=request.getParameter("year1");
  String Date2=request.getParameter("date2");
  String Month2=request.getParameter("month2");
  String Year2=request.getParameter("year2");
  String Specific=request.getParameter("specific");
  String IPAddress=request.getRemoteHost();
 
  

if(Fax.length()==0)
  Fax="Nil";    
  
if(Mail.length()==0)
  Mail="Nil";
 
 if(Problem.length()==0)
  Problem="Nil";    

  if(Investigation.length()==0)
  Investigation="Nil";    
  if(Category.length()==0)
  Category="Nil";    
  if(Date1.length()==0)
  Date1="Nil";
  if(Month1.length()==0)
  Month1="Nil";    
  if(Year1.length()==0)
  Year1="Nil";    
  if(Date2.length()==0)
  Date2="Nil";    
  if(Month2.length()==0)
  Month2="Nil";    
  if(Year2.length()==0)
  Year2="Nil";
  
if(Specific.length()==0)
  Specific="Nil";
                                
     
  GregorianCalendar now=new GregorianCalendar();
           
  DateFormat fmtt=new SimpleDateFormat("dd/MM/yyyy");
  String Date=fmtt.format(now.getTime());
            
  DateFormat fmt=new SimpleDateFormat("hh:mm:ss aa");
  String Time=fmt.format(now.getTime());
        
 
 Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  
Connection myConn=DriverManager.getConnection("jdbc:odbc:Hospital");
  
Statement stmt=myConn.createStatement();
 
 int result=stmt.executeUpdate("Insert into Enquiry values('"+Name+"','"+Address+"','"+Phone+"','"+Fax+"','"+Mail+"','"+Problem+"','"+Investigation+"','"+Category+"','"+Date1+"','"+Month1+"','"+Year1+"','"+Date2+"','"+Month2+"','"+Year2+"','"+Specific+"','"+IPAddress+"','"+Date+"','"+Time+"')");
    
  %>
   
<p align="Center"><font size="6" color="red"><b><u><i><br><br><br>Your Enquiry has been sent Successfully</i></u></b></font></p>
  <%
 
   stmt.close();
  myConn.close();
%> 
</body>
</html>