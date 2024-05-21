<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update School</title>
        <style>
  div.form1 {
  width: 600px;
  padding: 20px;
  margin-top: 10%;
  box-sizing: border-box;
  background-color: green;
  opacity: 0.6; 
  
}
.btnupdate {
  background-color: white;
  border: none;
  color: green;
  padding: 15px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
}
</style>
    </head>
    <body>
        
         <%@ page import="java.sql.*" %>
        <%@ page import="com.pos.mywebapp.DbConnect" %>
         <%!  private static Connection conn;  %>
        <%! String schoolid,schoolname,address,contactno,email; %>
         <%
         try {
    
         conn=DbConnect.getConnection();
               Statement statement = conn.createStatement();
                 String sql = "SELECT schoolid,schoolname,address,contactno,email FROM school ";
                 ResultSet result = statement.executeQuery(sql);
                    
        while (result.next()) {
        
        schoolid=result.getString("schoolid");
         schoolname=result.getString("schoolname");
          address=result.getString("address");
           contactno=result.getString("contactno");
            email=result.getString("email");
          
            } 
         } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
        %>
    <center>   
        <div class="form1" style="border:solid blue">
         <p style="border: solid;text-align: center;background-color: #f4fbff;color:black;width:200px; ">Update School Information</p>
            <form name="updateSchool" action="UpdateSchool" Method="post" enctype="multipart/form-data">
<table border='0' height='300' style="color:white">
         
     <tr>
      <td>School ID:</td>
      <td> <input type='text' size="10" name='schoolID' value="<%=schoolid%>">
    </td>
  </tr><!-- comment -->
  <tr>
      <td>School Name:</td>
      <td><input type='text' size="50" name='schoolName' value="<%=schoolname%>">
    </td>
  </tr>
   <tr>
       <td>Address:</td>
       <td>
    <input type='text' size="50" name='schoolAddress' value="<%=address%>">
    </td>
  </tr> 
  <tr>
     <td>Contact#:</td>
       <td>
    <input type='text' size="12" name='schoolPhone' value="<%=contactno%>">
    </td>
  </tr>
  <tr>
     <td>Email#:</td>
       <td>
    <input type='email' size="30" name='schoolEmail' value="<%=email%>">
    </td>
  </tr>
  <tr>
     <td>School Logo:</td>
       </td>
       <td>
    <input type="file" name="logo">
    </td>
  </tr>

  <tr>
     <td>
         <input type='submit' value="Update" name='update' class="btnupdate">
    </td>
  </tr>
</table>
  
        </form><!-- comment -->
        </div>
    </center>
    
    </body>
</html>
