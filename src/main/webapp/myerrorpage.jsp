<%-- 
    Document   : myerrorpage
    Created on : May 13, 2023, 10:57:03 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
<body>  
  
<%@ page isErrorPage="true" %>  
  
 Sorry an exception occured!
 <br/>  
The exception is: <%= exception %>  
  
</body>  
</html>  