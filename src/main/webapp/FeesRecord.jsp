<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
 <%@ page import="com.pos.mywebapp.DbConnect" %>
<!DOCTYPE html>
<html>
<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #04AA6D;
  color: white;
}
.btnview {
            background-color: green;
            border: none;
            color: green;
            padding: 15px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            color: white;
}
</style>
<body>
   <div class="topnav">
  <a class="active" href="SubjectList.jsp">Subjects</a>
  
  <a href="AddClassSubjects.jsp">Assign Subjects to Class</a>
  <a href="SelectClass.jsp">Class Subjects</a>
  <a href="#">Print List</a>
</div>
        <%-- Declare variable/filed databaseURL --%>
        <%!  private static Connection conn;  %>
        <%
         try {
    
         conn=DbConnect.getConnection();
               Statement statement = conn.createStatement();
                 String sql = "SELECT distinct yearof FROM MASTERCHALLAN";
                 ResultSet result = statement.executeQuery(sql);
        %>
    <center>
        
         <p style="color:white;background-color: green; width:280px; font-size: 20px;">Fees Record</p>
        <form method="post" action="PrintFeesRecord.jsp">   
            <table border="1">
                <td>
                    Enter GR.No.<br>
            <input type="text" id="grno" name="grno">
                <td>
                    Select Year:<br>
                    <select  style="font-size:15px;" name="yearof" > 
             <%  
String cn;
          while (result.next()) {
           %>        
           <option name="class1" value="<%=result.getString("yearof")%>" > <%=result.getString("yearof")%>  </option>
  
            <% } %>
             </select>      
                </td><!-- comment -->
            </table>
             <input type="submit" value="View" class="btnview">
              </form>
            <%
            //   out.print(result.getString("cname"));
                           // out.print("<p>");
            
             } catch (SQLException ex) {
                        ex.printStackTrace();
                    }

            %>
 
 
    </center>

</body>
</html>
