<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <link rel="stylesheet" href="localcss/tablecss.css">  
    <link rel="stylesheet" href="localcss/modelFormStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta charset="utf-8">     
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="localcss/bootstrap.min.css">
    <script src="localjs/jquery-3.7.0.min.js"></script>
    <script src="localjs/bootstrap.min.js"></script>
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
.btnsave {
            background-color: #04AA6D;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 80px;
            opacity: 0.9;
            float: left;

        }


        .btnclose {
            background-color:red;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 80px;
            opacity: 0.9;
        }
</style>
        
    <body>
<div class="topnav">
  <a class="active" href="LateFees.jsp">Late Fees</a>
   <a  href="FeesStructure.jsp">Fees Structure</a>
  
  <a href="\reports\PrintClassList.jsp" target="_blank">Print List</a>
</div>
        <%@ page import="java.sql.*" %>
        <%@ page import="com.pos.mywebapp.DbConnect" %>

        <%-- Declare variable/filed databaseURL --%>
        <%!  private static Connection conn;  %>
        <%
         try {
                conn=DbConnect.getConnection();
                  Statement statementclass = conn.createStatement();
                 String sqlclass = "SELECT CLASSID FROM MASTERCLASS";
                 ResultSet resultclass = statementclass.executeQuery(sqlclass);
                 
        
               Statement statement = conn.createStatement();
                 String sql = "SELECT classid,firstlatefees FROM latefees order by classid ";
                 ResultSet result = statement.executeQuery(sql);
        %>
    <center>
        <div id="divsearch" class="divsearch" style=" height: 0px;">
         <table>
            <tr>
                <td>
        <input type="text" id="myInput" onkeyup="courseFunction()" placeholder="Search    " title="Type course name"
               style="height:20px;font-size: 20px;">
                </td></tr></table></div>
    </center>
    <br><br><br>
        <TABLE id="courseTable" cellpadding="10" border="1" style="background-color: cornflowerblue;color: white" align="center">

            <th style="color: black;background-color: aliceblue"> Class ID</th>
            <th style="color: black;background-color: aliceblue">Late Fees</th>

             <th scope="col" style="color: black;background-color: aliceblue;"> <button type="button" class="btn btn-info btn-lg" id="myBtn" style="width:60px;padding: 5px 0px; height: 40px; background-color: #31b131;font-size: 16px;">       
                    Add</button></th>
            <%  
String cn;
          while (result.next()) {
            %>
            <TR>
                <TD class="tclassid"><%=result.getString("classid")%></TD>
                <TD class="tfirstlatefees"><%=result.getString("firstlatefees")%></TD>
                 <td>
                    <% String r=result.getString("classid");             
                    %>
                    
                     <a href="#" onclick="toggleModal(this,'<%=r%>')">Edit</a>
                    <%--
                    <a data-target="#editModal" data-toggle="modal" class="edcat" id="edstdcat" 
                       href="#editModal?catid=<%=result.getString("categoryid")%>">Edit</a>
                    --%>
                </td>
            </TR>
           
                   
            <% } %>
             </select>       
            <%
            //   out.print(result.getString("cname"));
                           // out.print("<p>");
            

            %>
            
            <!-- Modal//add class -->
            <div class="modal fade" tabindex="-1" id="myModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <%--
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            --%>
                            <p class="modal-title"> Adding Late Fees</p>
                        </div>
                        <div class="modal-body">
                            <p>
                            <form name="catform" id="catform1" class="catform" method="post" action="AddLateFee">
                                Select Class:<br>
            <select  style="font-size:15px;" name="vclassid" onchange="showClasses(this.value)"> 
             <%  

          while (resultclass.next()) {
           %>        
           <option name="classid" value="<%=resultclass.getString("CLASSID")%>" > <%=resultclass.getString("CLASSID")%>  </option>
  
            <% } %>
             </select> 
             
             <%
            //   out.print(result.getString("cname"));
                           // out.print("<p>");
            
             } catch (SQLException ex) {
                        ex.printStackTrace();
                    }

            %>
            <%--
                                <input type="text" id="vclassid" name="vclassid" size="40">
            --%>
                                <br>
                                Late Fees:<br>
                                <input type="text" id="vfirstlatefees" name="vfirstlatefees" size="40">
                                </p>

                                </div>
                                <div class="modal-footer" style=" height: 50px;">

                                    <input type='submit' value="Save" name="save" class="btnsave"/>

                            </form>
                            <button type="button" class="btnclose" data-dismiss="modal">Close</button>  
                        </div>

                    </div>

                </div>
            </div>

                                                 
    <script>
        $(document).ready(function () {
            $("#myBtn").click(function () {
                $("#myModal").modal();
            });
        });


    </script>
 
     <!-- Modal//edit class -->
    <div class="modal fade" id="editModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <%--
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    --%>
                    <p class="modal-title"> Update Late Fees</p>
                </div>
                <div class="modal-body">
                    <p>
                    <form name="catform" id="catform1" class="catform" method="post" action="UpdateLateFee">
                        Class ID:<br>
                        <input type="text" id="edclassid" name="edclassid" size="40" disabled>
                        <br>
                       Late Fees:<br>
                        <input type="text" id="edfirstlatefees" name="edfirstlatefees" size="40" >   
                        </p>

                        </div>
                        <div class="modal-footer" style=" height: 50px;">

                            <input type='submit' value="Save" name="save" class="btnsave"/>
                    <input type="hidden" id="paraclassid" name="paraclassid">   
                    </form>
                    <button type="button" class="btnclose" data-dismiss="modal" onclick="closeModal()">Close</button> </div>

            </div>

        </div>
       
    </div>

  
<div class="modal-backdrop fade show" id="backdrop" style="display: none;"></div>
  
<script>
    let tableRowElement;
    function toggleModal(element) {
 
        tableRowElement = element.parentElement.parentElement;
        const cid = tableRowElement.getElementsByClassName('tclassid')[0].innerHTML;
       const cname = tableRowElement.getElementsByClassName('tfirstlatefees')[0].innerHTML;
      const pcid=tableRowElement.getElementsByClassName('tclassid')[0].innerHTML;
      document.getElementById('edclassid').value = cid;
       document.getElementById('edfirstlatefees').value = cname;
       document.getElementById('paraclassid').value = pcid;
 
        openModal();
    }
 
   
 
    function openModal() {
        
        document.getElementById("backdrop").style.display = "block";
        document.getElementById("editModal").style.display = "block";
        document.getElementById("editModal").classList.add("show");
    }
 
 
    function closeModal() {
        document.getElementById("backdrop").style.display = "none";
        document.getElementById("editModal").style.display = "none";
        document.getElementById("editModal").classList.remove("show");
    }
    </script>

    
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
