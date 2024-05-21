<%-- 
    Document   : pg2
    Created on : May 13, 2023, 12:22:08 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
<body>  
    kjkgjhgjhgjh<br>
<%   
  
String name=request.getParameter("uname");  
out.print("Welcome "+name);  
  
session.setAttribute("user",name);  
  %>
<a href="second.jsp">second jsp page</a>  
  

</body>  
</html>  