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
</style>
    <body>
     <div class="topnav">
  <a href="AddMarks.jsp">Marks Entry</a>
  <a href="StudentReportCard.jsp">Student Progress Report</a>
  <a href="#">Students Report Class-Wise</a>

   
  
  
</div>
        <%-- Declare variable/filed databaseURL --%>
        <%!  private static Connection conn;  %>
        <%
         try {
    
         conn=DbConnect.getConnection();
               Statement statement = conn.createStatement();
             String sql = "SELECT CLASSID FROM MASTERCLASS order by classid";
             ResultSet result = statement.executeQuery(sql);
               Statement statement2 = conn.createStatement();
               String sql2 = "SELECT  max(sessionyear) as sessionyear FROM student";
               ResultSet resultsession = statement2.executeQuery(sql2);
               
              Statement statementsection = conn.createStatement();
              String sqlsection = "SELECT distinct section FROM student order by section";
              ResultSet resultsection = statementsection.executeQuery(sqlsection);                
        %>
    <center>
         <p style="color:white;background-color: green; width:280px; font-size: 20px;">Student Process Report</p>
         <%--
         <form action=""> 
         --%>
                <table border="1">   
                    <tr>
                        <td>
          Session:<br>
            <select  style="font-size:15px;" name="sessionyear" id="sessionyear"></div>                
             <%  
          while (resultsession.next()) {
           %>        
           <option name="year1" value="<%=resultsession.getString("sessionyear")%>" > <%=resultsession.getString("sessionyear")%>  </option>
              
         <% } %>
             </select>  
                        </td><!-- comment -->
                 
           <td>
           Class:<br>
            <select  style="font-size:15px;" name="classid" id="classid" onchange="showStudents()"></div>                
          <%  
          while (result.next()) {
           %>        
           <option name="classes" value="<%=result.getString("classid")%>" > <%=result.getString("classid")%>  </option>
              
         <% } %>
             </select>  
                        </td><!-- comment -->
                        
                </tr>   
                <tr>
               <td colspan="2">
           GR#:<br>
           <input type="text" style="font-size:15px;" name="grno" id="grno"></div>
              </td><!-- comment -->
            </tr>  
                </table>
            <%-- 
            </form>
            --%>
              <input type="button" id="btnsview" value="View" onclick="showStudents()">
              
            <%
             } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
            %>
          
 <div id="txtHint">
 </div>
    </center>
            
<script>
function showStudents() {

 const vsessionid=document.getElementById("sessionyear").value;
 const vclassid=document.getElementById("classid").value;
 const vgrno=document.getElementById("grno").value;
 
  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {
   var new_window = window.open("PrintStudentReportCard.jsp?sessionid="+vsessionid+"&classid="+vclassid+"&grno="+vgrno,'_blank');
new_window.document.write(xhr.responseText);
  };
  xhttp.open("GET", "PrintStudentReportCard.jsp?sessionid="+vsessionid+"&classid="+vclassid+"&grno="+vgrno);
  xhttp.send();
}

 
</script>

</body>
</html>
