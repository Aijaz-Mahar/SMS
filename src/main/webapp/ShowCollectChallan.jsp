<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%--
    <link rel="stylesheet" href="/localcss/tablecss.css">  
    --%>
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
  background-color: white;
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
        <%!  int vtotal,vlatefee,vsum;  %>
        <%
         try {
    
                conn=DbConnect.getConnection();
               Statement statement = conn.createStatement();
               String cid=request.getParameter("sid");
              
                 String sql = "select distinct a.fullname as name,a.fathername as fname,m.challanid as challanid,m.classid as classid,m.monthof||'-'||m.yearof as monthof,m.categoryid as catid,m.grno as grno,to_char(m.issuedate,'dd-MON-yyyy') as idate,to_char(m.duedate,'dd-MON-yy') as duedate, m.status as status "
                 + "from addmissionform a,masterchallan m where a.grno=m.grno and status='unpaid' and m.challanid='"+cid+"'";
                 
                 ResultSet result = statement.executeQuery(sql);
                 
                 Statement statementfees = conn.createStatement();           
                 String sqlfees = "select feesid,amount from masterchallan  where status='unpaid' and challanid='"+cid+"'";
                 ResultSet resultfees = statementfees.executeQuery(sqlfees);               

                 Statement statementlatefees = conn.createStatement();           
                 String sqllatefees ="select firstlatefees from latefees where classid in (select distinct classid from masterchallan where challanid='"+cid+"')";
                 ResultSet resultlatefees = statementlatefees.executeQuery(sqllatefees);      

                 Statement statementsumfees = conn.createStatement();           
                 String sqlsumfees ="select sum(amount) as totalfees from masterchallan  where status='unpaid' and challanid='"+cid+"'";
                 ResultSet resultsumfees = statementsumfees.executeQuery(sqlsumfees);      

                
        %>
    <center>
          <form id="chkform" name="chkform" method="post" action="CollectChallan">
        <table border='1'> 
            <tr>
                <td style="color: red;"> Deposit Date:<input type='date' name='depositdate' id='depositdate' required></td>
            </tr>
        </table>
        <TABLE id="courseTable" cellpadding="5" border="1" style="background-color: white;color: black" align="center">
            <th style="color: black;background-color: aliceblue">Challan ID</th>
            <th style="color: black;background-color: aliceblue">G.R#</th>
            <th style="color: black;background-color: aliceblue">Issue Date </th>
            <th style="color: black;background-color: aliceblue">Due Month </th>
            <input type="hidden" name="cid" value="<%=request.getParameter("sid")%>">
            
            <%  

          while (result.next()) {
        
            %>
            <TR>
                 <TD><%=result.getString("challanid")%></TD>
                <TD><%=result.getString("grno")%></TD>
                <TD><%=result.getString("idate")%></TD>
                <TD><%=result.getString("monthof")%></TD>
                <input type="hidden" name="challanid" value="<%=result.getString("challanid")%>">
                <input type="hidden" name="grno" value="<%=result.getString("grno")%>">
                <input type="hidden" name="monthof" value="<%=result.getString("monthof")%>"><!-- comment -->
                <input type="hidden" name="challanstatus" value="<%=result.getString("status")%>">
            
</script>
               
            </TR>
           <th style="color: black;background-color: aliceblue">Student Name</th>
            <th style="color: black;background-color: aliceblue">Father's Name</th>
            <th style="color: black;background-color: aliceblue">Class</th>
            <th style="color: black;background-color: aliceblue">Category </th>
            <TR>
                 <TD><%=result.getString("name")%></TD>
                <TD><%=result.getString("fname")%></TD>
                <TD><%=result.getString("classid")%></TD>
                <TD><%=result.getString("catid")%></TD>    
                
            </TR>
            <table border='1'><tr>
                    
                    <td style='color:red;'>Due Date: <%=result.getString("duedate")%></td> </tr>
         <%} %>
        </table>
        <TABLE id="feesTable" cellpadding="5" border="1" style="background-color: white;color: black" align="center">
            <th style="color: black;background-color: aliceblue; width: 250px;">Description</th>
            <th style="color: black;background-color: aliceblue">Amount</th>
            <%
          while (resultfees.next()) {
        
            %>
            <TR>
                 <TD><%=resultfees.getString("feesid")%></TD>
                 <TD><%=resultfees.getString("amount")%></TD>      
                 
            </TR>
           
         <%} %> 
         
           <%
          while (resultsumfees.next()) {
            %>
            <TR>
                 <TD style='background-color: #ddd;'>Total</TD>
                 <TD style=' background-color: #ddd;'><%=resultsumfees.getString("totalfees")%></TD>
                  <input type="hidden" name="totalfees" value="<%=resultsumfees.getString("totalfees")%>">             
            </TR>
           
         <%
             vsum=resultsumfees.getInt("totalfees");
            
                } %> 
         
          <%
          while (resultlatefees.next()) {
        
            %>
            <TR>
                 <TD>Late Fees</TD>
                 <TD><%=resultlatefees.getString("firstlatefees")%></TD>       
                 <input type="hidden" name="firstlatefees" value="<%=resultlatefees.getString("firstlatefees")%>">
            </TR>
           
         <%
             vlatefee=resultlatefees.getInt("firstlatefees");
             
                } %> 
         
            <%
            //   out.print(result.getString("cname"));
                           // out.print("<p>");
            
             } catch (SQLException ex) {
                        ex.printStackTrace();
               }
                vtotal=vsum+vlatefee;
%>
             <TR>
                 <TD style=' background-color: #f2f2f2'>Total</TD>
                 <TD style=' background-color: #f2f2f2'><%=vtotal%></TD>                               
            </TR>   
               
        </table>
            <br>
        <table>
             <tr>
                 <td><center>
                     <input type="submit" name="save" value= "Collect" class="btnsave" title="Click to Save" style="width:80px; font-weight: bold;">
             </center>
                 </td>
                 
                 <td>
                     <a href="ChallanList.jsp" style="background-color: red;color:white; padding: 15px;">Return</a></td>
             </tr>
             
        </table>
                    
       
                    </form>
        </center>
<script>
    function enableButton() {
        var duedate = document.getElementById('duedate').value;
        if (!duedate === "") {
            document.getElementById('btncollect').disabled = "false";
        } 
    }
});
    </script>
    
    

    </body>
</html>
