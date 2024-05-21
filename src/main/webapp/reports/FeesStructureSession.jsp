<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
 <%@ page import="com.pos.mywebapp.DbConnect" %>
<!DOCTYPE html>
<html>
     <link rel="stylesheet" href="/localcss/tablecss.css">  
    <link rel="stylesheet" href="/localcss/modelFormStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta charset="utf-8">     
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="\localcss\bootstrap.min.css">
    <script src="\localjs\jquery-3.7.0.min.js"></script>
    <script src="\localjs\bootstrap.min.js"></script>
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
  
  
</div>
        <%-- Declare variable/filed databaseURL --%>
        <%!  private static Connection conn;  %>
        <%
         try {
    
         conn=DbConnect.getConnection();
               Statement statement = conn.createStatement();
                 String sql = "SELECT distinct sessionyear FROM feesStructure order by sessionyear desc";
                 ResultSet result = statement.executeQuery(sql);
                   Statement statement2 = conn.createStatement();
                 String sql2 = "SELECT distinct classid FROM feesStructure order by classid ";
                 ResultSet result2 = statement2.executeQuery(sql2);
        %>
    <center>
         <p style="color:white;background-color: green; width:280px; font-size: 20px;">Print Fees Structure</p>
      <form action="">      
          <p style="color:white;background-color: #333; width:500px; height: 30px; font-size: 20px;">
            Select Session:
            <select  style="font-size:15px;" name="sessions" id="sessions" onchange="showClasses(this.value)"  > 
             <%  
String cn;
          while (result.next()) {
           %>        
           <option  value="<%=result.getString("sessionyear")%>" > <%=result.getString("sessionyear")%>  </option>
  
            <% } %>
             </select>       
  Select Class:           
  <select  style="font-size:15px;" name="classes" id="classes" onchange="showClasses(this.value)"> 
             <%  
          while(result2.next()) {
           %>        
           <option value="<%=result2.getString("classid")%>" > <%=result2.getString("classid")%>  </option>
  
            <% } %>
             </select>       
          </p>
              </form>
            <%
            //   out.print(result.getString("cname"));
                           // out.print("<p>");
            
             } catch (SQLException ex) {
                        ex.printStackTrace();

                    }

            %>
 
 <div id="stdinfo">
    
 </div>
    </center>
<script>
function showClasses(str) {
  if (str == "") {
    document.getElementById("stdinfo").innerHTML = "";
    return;
  }

//selectElement=document.querySelector("#sessions");
 //sid=selectElement.value;
const vsessionid=document.getElementById("sessions").value;
const vclassid=document.getElementById("classes").value;

//selectElement2=document.querySelector("#classes");
 //cid=selectElement2.value;
//document.write(sid+"  "+cid);
  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {
 var new_window = window.open("PrintFeesStructure.jsp?sessionid="+vsessionid+"&classid="+vclassid,'_blank');
new_window.document.write(xhr.responseText);
    //document.getElementById("stdinfo").innerHTML = this.responseText;
  };
 
  xhttp.open("GET", "PrintFeesStructure.jsp?sessionid="+vsessionid+"&classid="+vclassid);
  xhttp.send();
}

 
</script>
</body>
</html>
