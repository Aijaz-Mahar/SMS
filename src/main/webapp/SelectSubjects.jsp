<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
       <link rel="stylesheet" href="localcss/tablecss.css">  
 <style>
.btnsave {
 background-color: #31b131;
  border: none;
  color: white;
  padding: 15px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
  
}
.btncancel {
  background-color: #666;
  border: none;
  color: azure;
  padding: 15px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
}


a:hover, a:active {
  background-color: #0c7db1;
}

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
        <%@ page import="java.sql.*" %>
        <%@ page import="com.pos.mywebapp.DbConnect" %>
        <%-- Declare variable/filed databaseURL --%>
        <%!  private static Connection conn;  %>
        <%
         try {
    
         conn=DbConnect.getConnection();
               Statement statement = conn.createStatement();
                 String sql = "SELECT subjectid,subjectname FROM subjects";
                 ResultSet result = statement.executeQuery(sql);
        %>
    <center>
        <%--
        <input  type="text" id="myInput" onkeyup="courseFunction()" placeholder="Search    " title="Type Subject"
               style="height:20px;font-size: 20px;">
        --%>
    
      <form id="chkform" name="chkform" method="post" action="SubjectClassProcess.jsp">
        <TABLE id="courseTable" cellpadding="10" border="1" style="background-color: white;color: black" align="center">

            <th style="color: black;background-color: aliceblue">Subject ID</th>
            <th style="color: black;background-color: aliceblue">Subject Name</th>
            <th style="color: black;background-color: aliceblue">Select </th>
      
            <%  
String cn;
          while (result.next()) {
          
            %>
            <TR>
                <TD><%=result.getString("subjectid")%></TD>
                <TD><%=result.getString("subjectname")%></TD>
                <TD><input type="checkbox" name="chksubjectid" value="<%=result.getString("subjectid")%>"></TD>
                
            </TR>
            <br><!-- comment -->
            
         <%} %>
                  
            <%
            //   out.print(result.getString("cname"));
                           // out.print("<p>");
            
             } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
             %>   
             <tr>
                 <td><center>
                     
                     <input type="submit" name="save" value= "Save" class="btnsave" title="Click to Save" style="width:80px; font-weight: bold;">
                     
             </center>
             
                 </td>
                 <td><center>
                     <input type="reset" name="cancel" value= "Cancel" class="btncancel" title="Cancel Selection" style="width:80px;font-weight: bold;">
             </center>
                 </td>
                 <td>
                     <a href="SubjectList.jsp" style="background-color: red;color:white; padding: 15px;">Return</a></td>
             </tr>
        </table>
        <input type="hidden" name="cid" value="<%=request.getParameter("sid")%>">
      </form>
        </center>
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
