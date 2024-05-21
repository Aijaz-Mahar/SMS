<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*"%>
 <%@ page import="com.pos.mywebapp.DbConnect"%>
<!DOCTYPE html>
<html>

    <body>

       

        <%-- Declare variable/filed databaseURL --%>
        <%!  private static Connection conn;  %>
        <%
         try {
    
         conn=DbConnect.getConnection();
               Statement statement = conn.createStatement();
                 String sql = "SELECT coursename,fees FROM course ";
                 ResultSet result = statement.executeQuery(sql);
        %>
    <center>
        <input "center" type="text" id="myInput" onkeyup="courseFunction()" placeholder="Search course" title="Type course name">
    </center>
        <TABLE id="courseTable" cellpadding="10" border="1" style="background-color: cornflowerblue;color: white" align="center">

            <th style="color: black;background-color: aliceblue"> COURSE</th>
            <th style="color: black;background-color: aliceblue">FEES</th>
Select course:
        <select id="subject" name="subject">
      
            <%  
String cn;
          while (result.next()) {
            %>
            
            <br><!-- comment -->
                   
           <option value="<%=result.getString("coursename")%>" >abc  </option>
   
  
            <% } %>
             </select>       
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
