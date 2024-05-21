<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
       <link rel="stylesheet" href="localcss/tablecss.css">  
       <style>
 body {
  margin: 0;
  background-color: white;
  font-family: Arial, Helvetica, sans-serif;
}
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
        <%!  String vissuedate;  %>
          <%!  String vduedate;  %>
          <%!  String vbid;  %>
    <center>
           
        <%
         try {
    
         conn=DbConnect.getConnection();
               Statement statement = conn.createStatement();
               String cid=request.getParameter("classid");
               String sid=request.getParameter("sessionid");
               String mid=request.getParameter("months");
               String yid=request.getParameter("years");
              String idate=request.getParameter("idate");
          
             String ddate=request.getParameter("ddate");
                vbid=request.getParameter("bid");
                
                 String vmonth=null,vyear,vclassid; 
//out.println(vbid);
 Date myissuedate=Date.valueOf(idate);
 Date myduedate=Date.valueOf(ddate);
 SimpleDateFormat formatter;
 formatter = new SimpleDateFormat("dd-MMM-yyyy");
 vissuedate = formatter.format(myissuedate);
 vduedate = formatter.format(myduedate);
      
                 String sql = "SELECT distinct ft.feesid feesid,ft.feesname feesname FROM feestype ft,feesStructure fs"
                 + " where ft.feesid=fs.feesid and fs.classid='"+cid+"'  order by feesid";
                 ResultSet result = statement.executeQuery(sql);
                 
                Statement stverify = conn.createStatement();
                String sqlverify = "SELECT distinct monthof,yearof,classid FROM masterchallan "
                + " where classid='"+cid+"' and monthof='"+mid+"' and yearof='"+yid+"' ";
              
             
               ResultSet resultv = stverify.executeQuery(sqlverify);
              boolean flag=resultv.next();
               if(flag==true){
            out.println("<html><font color=red> Fees Challan for </html><b> "+mid+"-"+yid+" of Class "+cid+" </b> already created..");
            }
                   //while (resultv.next()) {
                 //vmonth=resultv.getString("monthof");
               //  out.println("sfsdfsd");
           // }
            
%>
        
   
        <form id="chkform" name="chkform" method="post" action="ChallanFeesProcess.jsp">

        <TABLE id="courseTable" cellpadding="10" border="1" style="background-color: white;color: black" align="center">

            <th style="color: black;background-color: aliceblue">Fees ID</th>
            <th style="color: black;background-color: aliceblue">Fees Name</th>
            <th style="color: black;background-color: aliceblue">Select </th>
      
            <%  

          while (result.next()) {
          
            %>
            <TR>
                <TD><%=result.getString("feesid")%></TD>
                <TD><%=result.getString("feesname")%></TD>
                <TD><input type="checkbox" name="chksubjectid" value="<%=result.getString("feesid")%>"></TD>
                
            </TR>
          
            
         <%} %>
                  
            <%
            //   out.print(result.getString("cname"));
                           // out.print("<p>");
            
             } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
               

             %>   
            <input type="hidden" name="cid" value="<%=request.getParameter("classid")%>"/>
            <input type="hidden" name="sid" value="<%=request.getParameter("sessionid")%>"/>
            <input type="hidden" name="mid" value="<%=request.getParameter("months")%>"/>
            <input type="hidden" name="yid" value="<%=request.getParameter("years")%>"/>
           
             <input type="hidden" name="issuedate" value="<%=vissuedate%>"/>
            <input type="hidden" name="duedate" value="<%=vduedate%>"/>
             <input type="hidden" name="bankid" value="<%=vbid%>"/>

             <tr>
                 <td><center>
                    <input type="submit" value="Generate" class="btnsave" style="width:100px; font-weight: bold;"/>
             </center>
                 </td>
                 <td><center>
                     <input type="reset" name="cancel" value= "Cancel" class="btncancel" title="Cancel Selection" style="width:80px;font-weight: bold;"/>
             </center>
                 </td>
                 <td>
                     <a href="ChallanForm.jsp" style="background-color: red;color:white; padding: 15px;">Return</a></td>
             </tr>
               </table>
            
         </form>

  
        </center>


    </body>
</html>
