<%-- 
    Document   : testimage
    Created on : May 23, 2023, 11:04:24 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.pos.mywebapp.DbConnect" %>
<%@page import="java.io.*"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         
       
<%

try{
 Blob image = null;
Connection con = null;
byte[ ] imgData = null ;
Statement stmt = null;
ResultSet rs=null;
FileInputStream fis;
int s=0;
con=DbConnect.getConnection();
stmt = con.createStatement();

//File image=new File("d:/pc1.png");
rs = stmt.executeQuery("select logo from school");
if (rs.next()) {
image = rs.getBlob(1);
imgData = image.getBytes(1,(int)image.length());
} else {
out.println("Display Blob Example");
out.println("image not found for given id>");
return;
}
response.setContentType("image");
OutputStream o = response.getOutputStream();
o.write(imgData);
o.flush();
o.close();
} catch (Exception e) {
out.println("Unable To Display image");
out.println("Image Display Error=" + e.getMessage());
return;
    }
%>

    </body>
</html>
