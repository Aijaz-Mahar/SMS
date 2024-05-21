<%-- 
    Document   : newjsp
    Created on : May 3, 2023, 10:12:13 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
    min-height: 100vh;
    max-width: 400px;
    background-color: papayawhip; 
    margin: 0 auto;
}
        </style>
    </head>
    <body>
        <% 
         String name=request.getParameter("uname");  
         out.print("welcome "+name); 
        %>  
        <br><!-- comment -->
        Current Time: <%= java.util.Calendar.getInstance().getTime() %>  
        <br><!-- comment -->
        <%! int data=50; %>  
<%= "Value of the variable is:"+data %>  
<br><!-- comment -->
method:<br><!-- comment -->
<%!   
int cube(int n){  
return n*n*n;  
}  
%>  
<%= "Cube of 3 is:"+cube(3) %>  
<hr><!-- comment -->
<% out.print("Today is:"+java.util.Calendar.getInstance().getTime()); %>  
<% out.print("Today is:"+java.util.Calendar.getInstance().getTime()); %>  
<% out.print("Today is:"+java.util.Calendar.getInstance().getTime()); %>  
<% out.print("Today is:"+java.util.Calendar.getInstance().getTime()); %>  
<% out.print("Today is:"+java.util.Calendar.getInstance().getTime()); %>  
<% out.print("Today is:"+java.util.Calendar.getInstance().getTime()); %>  
<% out.print("Today is:"+java.util.Calendar.getInstance().getTime()); %>  
</html>
