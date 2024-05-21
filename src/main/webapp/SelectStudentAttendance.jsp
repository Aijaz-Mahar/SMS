<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
 <%@ page import="com.pos.mywebapp.DbConnect" %>
 <%@ page import="java.text.SimpleDateFormat"%>
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
  <a class="active" href="AttendanceEntry.jsp">Attendance Entry</a>
  <a href="StudentAttendanceReport.jsp">Student Attendance Report</a>
  <a href="AttendanceSheet.jsp">Class Attendance Report</a>
   
  
  
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
         <p style="color:white;background-color: green; width:280px; font-size: 20px;">Student Attendance Report</p>
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
            <select  style="font-size:15px;" name="classid" id="classid" ></div>                
          <%  
          while (result.next()) {
           %>        
           <option name="classes" value="<%=result.getString("classid")%>" > <%=result.getString("classid")%>  </option>
              
         <% } %>
             </select>  
           </td></tr>
           
               <td>
           Section:<br>
           <select  style="font-size:15px;" name="section" id="section" ></div>                
             <%  
          while (resultsection.next()) {
           %>        
            <option value="" selected="selected" hidden="hidden">Select Section</option>
           <option name="section" value="<%=resultsection.getString("section")%>" > <%=resultsection.getString("section")%>  </option>
              
         <% } %>
             </select>  
              </td><!-- comment -->
              <td>
                  GR.No.<br>
                  <input type="text" name="grno" id="grno"></td>
                    </tr>  
                                   </td><!-- comment -->
            <tr>
                      <td>
                      From:<br>
                      <input type="date" id="datefrom" name="datefrom" required><!-- comment -->
                      </td>
                       <td>
                      To:<br>
                      <input type="date" id="dateto" name="dateto" required><!-- comment -->
                      </td>
            </tr>
                    
                    
                </table>
            <%-- 
            </form>
            --%><br>
            <input type="button" name="btnshow" id="btnshow" class="btnshow" value="Show" onclick="showStudents()">
              
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
/*
    if (str == "") {
    document.getElementById("txtHint").innerHTML = "";
    return;
  }
*/

 const vsessionid=document.getElementById("sessionyear").value;
 const vclassid=document.getElementById("classid").value;
 const vsection=document.getElementById("section").value;
 const vdatefrom=document.getElementById("datefrom").value;
 const vdateto=document.getElementById("dateto").value;
 const vgrno=document.getElementById("grno").value;
  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {
 var new_window = window.open("StudentAttendanceReport.jsp?sessionid="+vsessionid+"&classid="+vclassid+"&sectionid="+vsection+"&datefromp="+vdatefrom+"&datetop="+vdateto+"&grno="+vgrno,'_blank');
 new_window.document.write(xhr.responseText);  };

  xhttp.open("GET", "StudentAttendanceReport.jsp?sessionid="+vsessionid+"&classid="+vclassid+"&sectionid="+vsection+"&datefromp="+vdatefrom+"&datetop="+vdateto+"&grno="+vgrno);
  xhttp.send();
}

 
</script>
<script>
  document.getElementById("datefrom").valueAsDate = new Date();
  document.getElementById("dateto").valueAsDate = new Date();
 </script>

</body>
</html>