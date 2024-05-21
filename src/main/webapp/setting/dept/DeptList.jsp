<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="/localcss/tablecss.css">  
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
</style>
        
    <body>
<div class="topnav">
  <a class="active" href="AddDept.jsp">Add Department</a>
  <a href="EditDept.jsp">Update Department</a>
  <a href="#contact">Print Dept List</a>
</div>

         <%@ page import="java.sql.*" %>
        <%@ page import="com.pos.mywebapp.DbConnect" %>

        <%-- Declare variable/filed databaseURL --%>
        <%!  private static Connection conn;  %>
        <%
         try {
    
         conn=DbConnect.getConnection();
               Statement statement = conn.createStatement();
                 String sql = "SELECT deptid,deptname FROM department";
                 ResultSet result = statement.executeQuery(sql);
        %>
    <center>
        <div id="divsearch" class="divsearch" style=" height: 0px;">
         <table>
            <tr>
                <td>
        <input "center" type="text" id="myInput" onkeyup="courseFunction()" placeholder="Search    " title="Type department"
               style="height:20px;font-size: 20px;">
                </td></tr></table></div>
    </center>
    <br><br><br>
        <TABLE id="courseTable" cellpadding="10" border="1" style="background-color: white;color: black" align="center">

            <th style="color: black;background-color: aliceblue"> Dept ID</th>
            <th style="color: black;background-color: aliceblue">Dept Name</th>
      
            <%  
String cn;
          while (result.next()) {
            %>
            <TR>
                <TD><%=result.getString("deptid")%></TD>
                <TD><%=result.getString("deptname")%></TD>
            </TR>
           
               
         <%} %>
                  
            <%
            //   out.print(result.getString("cname"));
                           // out.print("<p>");
            
             } catch (SQLException ex) {
                        ex.printStackTrace();
                    }

            %>
        
 <script>
function courseFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("courseTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>
    </body>
</html>
