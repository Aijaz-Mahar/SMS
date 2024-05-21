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
  <a class="active" href="ChallanForm.jsp">Generate Challan</a>

  <a href="ChallanList.jsp">Challan List</a>
  <a href="#">Search Challan</a>
  <a href="#>Print List"></a> 
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
                 ResultSet result2 = statement2.executeQuery(sql2);
                  Statement statementmonths = conn.createStatement();
                 String sqlmonths = "SELECT  months FROM months ORDER by sno";
                 ResultSet resultmonths = statementmonths.executeQuery(sqlmonths);
                  Statement statementbank = conn.createStatement();
                 String sqlbank = "SELECT * FROM bank ORDER by bankid";
                 ResultSet resultbank = statementbank.executeQuery(sqlbank);
                 

                 
        %>
    <center>
         <p style="color:white;background-color: green; width:280px; font-size: 20px;">Creating Challan</p>
         <%--
         <form action=""> 
         --%>
         Select Bank:
            <select  style="font-size:15px;" name="bank" id="bank"></div>                
             <%  
          while (resultbank.next()) {
           %>        
           <option name="bank1" value="<%=resultbank.getString("bankid")%>" > <%=resultbank.getString("bankid")%>-<%=resultbank.getString("bankname")%>  </option>
          <% } %>
             </select>      
             <hr>
                <table border="1">
                     </tr><!-- comment -->
                <tr>
                    <td>Issue Date:<br><!-- comment -->
                        <input type="date" name="issuedate" id="issuedate" required></td>
                     <td>Due Date:<br><!-- comment -->
                         <input type="date" name="duedate" id="duedate" required></td>
                </tr>
                    <tr>
                        <td>
                            Month:<br>
            <select  style="font-size:15px;" name="months" id="months"></div>                
             <%  
          while (resultmonths.next()) {
           %>        
           <option name="months1" value="<%=resultmonths.getString("months")%>" > <%=resultmonths.getString("months")%>  </option>
          <% } %>
             </select>      
                        </td>
                        <td>
                            Year:<br>
            <select  style="font-size:15px;" name="years" id="years"></div>                
             <%  
          while (result2.next()) {
           %>        
           <option name="year1" value="<%=result2.getString("sessionyear")%>" > <%=result2.getString("sessionyear")%>  </option>
  
            
             </select>      
                        </td>
                
                <tr><td>
                        Select Session:<br>
            <select  style="font-size:15px;" name="sessions" id="sessions"></div>
                
           

         
           <option name="session1" value="<%=result2.getString("sessionyear")%>" > <%=result2.getString("sessionyear")%>  </option>
  
         <% } %>
             </select>       
                    </td>
                    <td>
                        Select Class:<br>
            <select  style="font-size:15px;" name="classes" id="classes" onchange="showClasses(this.value)"></div>
 
                
             <%  
String cn;
          while (result.next()) {
           %>        
           <option name="class1" value="<%=result.getString("CLASSID")%>" > <%=result.getString("CLASSID")%>  </option>
  
            <% } %>
             </select>  
                    </td>
               
                </table>
            <%-- 
            </form>
            --%>
            
              
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

  const vsessionid=document.getElementById("sessions").value;
const vclassid=document.getElementById("classes").value;
 const vmonths=document.getElementById("months").value;
const vyears=document.getElementById("years").value;
 const vissuedate=document.getElementById("issuedate").value;
const vduedate=document.getElementById("duedate").value;
const vbankid=document.getElementById("bank").value;


  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {
    document.getElementById("txtHint").innerHTML = this.responseText;
  }
  xhttp.open("GET", "SelectChallanFees.jsp?sessionid="+vsessionid+"&classid="+vclassid+"&months="+vmonths+"&years="+vyears+"&idate="+vissuedate+"&ddate="+vduedate+"&bid="+vbankid);
  xhttp.send();
}

 
</script>

 <script>
  document.getElementById("issuedate").valueAsDate = new Date();
  document.getElementById("duedate").valueAsDate = new Date();
 </script>
</body>
</html>