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
                 String sql = "SELECT CLASSID FROM MASTERCLASS";
                 ResultSet result = statement.executeQuery(sql);
        %>
    <center>
         <p style="color:white;background-color: green; width:280px; font-size: 20px;">Class-Wise Subjects List</p>
        <form action="">      
            Select Class:
            <select  style="font-size:15px;" name="classes" onchange="showClasses(this.value)"> 
             <%  
String cn;
          while (result.next()) {
           %>        
            <option value="" selected="selected" hidden="hidden">Select Class</option>
           <option name="class1" value="<%=result.getString("CLASSID")%>" > <%=result.getString("CLASSID")%>  </option>
  
            <% } %>
             </select>       
              </form>
            <%
            //   out.print(result.getString("cname"));
                           // out.print("<p>");
            
             } catch (SQLException ex) {
                        ex.printStackTrace();
                    }

            %>
 
 <div id="txtHint">
    
 </div>
    </center>
<script>
function showClasses(str) {
  if (str == "") {
    document.getElementById("txtHint").innerHTML = "";
    return;
  }
  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {
    document.getElementById("txtHint").innerHTML = this.responseText;
  }
  xhttp.open("GET", "ClassSubjects.jsp?sid="+str);
  xhttp.send();
}

 
</script>
</body>
</html>
