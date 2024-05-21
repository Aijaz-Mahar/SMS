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
        <%
         try {
         
    String cid,sid,secid,atdate;
    cid=request.getParameter("classid");
    sid=request.getParameter("sessionid");
   secid=request.getParameter("sectionid");
   atdate=request.getParameter("attendancedate");
  
         conn=DbConnect.getConnection();
               Statement statement = conn.createStatement();
                 String sql = "select s.grno,a.fullname as fullname,a.fathername as fathername from Addmissionform a,student s where a.grno=s.grno "
                 + "and s.sessionyear='"+sid+"' and s.classid='"+cid+"' and s.section='"+secid+"' ";
                 ResultSet result = statement.executeQuery(sql);
        %>
    <center>
          
      <form id="inputattendance"  method="post" action="AttendanceProcess.jsp">
        <TABLE id="myTable" cellpadding="10" border="1" style="background-color: white;color: black" align="center">

            <th style="color: black;background-color: aliceblue">Student GR#</th>
            <th style="color: black;background-color: aliceblue">Name</th>
            <th style="color: black;background-color: aliceblue">Father's Name</th>
            <th style="color: black;background-color: aliceblue">Status</th>
            <th style="color: black;background-color: aliceblue">Remarks</th>
        <%  
          while (result.next()) {         
            %>
            <TR>
                <TD><%=result.getString("grno")%></TD>
                <td hidden><input type="hidden" name="grno" value="<%=result.getString("grno")%>"></input></td>
                <TD><%=result.getString("fullname")%></TD>
                <TD><%=result.getString("fathername")%></TD>
                <TD><select id="status" name="status">
                        <option id="p" value="P">Present</option>    
                        <option id="l" value="L">Leave</option>
                        <option id="a" value="A">Absent</option>
                    </select></td>
                    
                <TD><input type="text" name="remarks"></TD>
            </TR>
         <%} %>
                  
            <%
                       
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
                     <a href="AttendanceEntry.jsp" style="background-color: red;color:white; padding: 15px;">Return</a></td>
             </tr>
        </table>
             <%
                
                 %>
             <input type="hidden" name="classid"   value="<%=request.getParameter("classid")%>" >
             <input type="hidden" name="sessionid" value="<%=request.getParameter("sessionid")%>" ><!-- comment -->
             <input type="hidden" name="sectionid"    value="<%=request.getParameter("sectionid")%>" ><!-- comment -->
               <input type="hidden" name="attdate"    value="<%=request.getParameter("attendancedate")%>" ><!-- comment -->
               
      </form>
        </center>
<script>
  const form = document.getElementById('inputattendance');
  form.addEventListener('keypress', function(e) {
  if (e.keyCode === 13) {
    e.preventDefault();
  }
});
   </script>
 
    </body>
</html>
