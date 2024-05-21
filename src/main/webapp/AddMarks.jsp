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
<a href="#">Result</a>
  <a href="StudentReportCard.jsp">Student Report Card</a>
  
  
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
               String sql2 = "SELECT distinct sessionyear FROM student order by sessionyear desc";
               ResultSet resultsession = statement2.executeQuery(sql2);
               Statement statementexam = conn.createStatement();
               String sqlexam = "SELECT  examid FROM examtype order by examid";
               ResultSet resultexam = statementexam.executeQuery(sqlexam);
             
              Statement statementsubject = conn.createStatement();
              String sqlsubject = "SELECT subjectid,subjectname FROM subjects order by subjectid";
              ResultSet resultsubject = statementsubject.executeQuery(sqlsubject);                
        %>
    <center>
         <p style="color:white;background-color: green; width:280px; font-size: 20px;">Result Entry</p>
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
            <select  style="font-size:15px;" name="classid" id="classid"></div>                
          <%  
          while (result.next()) {
           %>        
           <option name="classes" value="<%=result.getString("classid")%>" > <%=result.getString("classid")%>  </option>
              
         <% } %>
             </select>  
                        </td><!-- comment -->
                        
                    </tr>
           <tr>
               <td>
           Exam:<br>
            <select  style="font-size:15px;" name="examid" id="examid"></div>                
             <%  
          while (resultexam.next()) {
           %>        
           <option name="exams" value="<%=resultexam.getString("examid")%>" > <%=resultexam.getString("examid")%>  </option>
              
         <% } %>
             </select>  
              </td><!-- comment -->
            
               <td>
           Subject:<br>
           <select  style="font-size:15px;" name="subjectid" id="subjectid" onchange="showClasses()"></div>                
             <%  
          while (resultsubject.next()) {
           %>        
           <option value="" selected="selected" hidden="hidden">Select Subject</option>
           <option name="subjects" value="<%=resultsubject.getString("subjectid")%>" > <%=resultsubject.getString("subjectname")%>  </option>
              
         <% } %>
             </select>  
                        </td><!-- comment -->
                        
                    </tr>  
                </table>
            <%-- 
            </form>
            --%>
            
              
            <%
             } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
            %>
 <div id="txtHint">
 </div>
    </center>
<script>
function showClasses() {
/*
    if (str == "") {
    document.getElementById("txtHint").innerHTML = "";
    return;
  }
*/
 const vsessionid=document.getElementById("sessionyear").value;
 const vclassid=document.getElementById("classid").value;
 const vexamid=document.getElementById("examid").value;
 const vsubjectid=document.getElementById("subjectid").value;
 
  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {
    document.getElementById("txtHint").innerHTML = this.responseText;
  }
  xhttp.open("GET", "StudentForMarks.jsp?sessionid="+vsessionid+"&classid="+vclassid+"&examid="+vexamid+"&subjectid="+vsubjectid);
  xhttp.send();
}

 
</script>


</body>
</html>