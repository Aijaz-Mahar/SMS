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
    
  <a class="active" href="SectionList.jsp">Sections</a>
  <a  href="classesList.jsp">Classes</a>
  <a href="#" target="_blank">Print List</a>
</div>
        <%@ page import="java.sql.*" %>
        <%@ page import="com.pos.mywebapp.DbConnect" %>

        <%-- Declare variable/filed databaseURL --%>
        <%!  private static Connection conn;  %>
        <%
         try {
    
         conn=DbConnect.getConnection();
               Statement statement = conn.createStatement();
                 String sql = "SELECT sectionid,sectionname FROM sections  ";
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

            <th style="color: black;background-color: aliceblue"> Section ID</th>
            <th style="color: black;background-color: aliceblue">Section Name</th>

             <th scope="col" style="color: black;background-color: aliceblue;"> <button type="button" class="btn btn-info btn-lg" id="myBtn" style="width:60px;padding: 5px 0px; height: 40px; background-color: #31b131;font-size: 16px;">       
                    Add</button></th>
            <%  
String cn;
          while (result.next()) {
            %>
            <TR>
                <TD class="tsectionid"><%=result.getString("sectionid")%></TD>
                <TD class="tsectionname"><%=result.getString("sectionname")%></TD>
                 <td>
                    <% String r=result.getString("sectionid");             
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
            
             } catch (SQLException ex) {
                        ex.printStackTrace();
                    }

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
                            <p class="modal-title"> Adding Section</p>
                        </div>
                        <div class="modal-body">
                            <p>
                            <form name="catform" id="catform1" class="catform" method="post" action="AddSection">
                               Section ID:<br>
                                <input type="text" id="vsectionid" name="vsectionid" size="40">
                                <br>
                                Section Name:<br>
                                <input type="text" id="vsectionname" name="vsectionname" size="40">
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
                    <p class="modal-title"> Update Class</p>
                </div>
                <div class="modal-body">
                    <p>
                    <form name="catform" id="catform1" class="catform" method="post" action="UpdateSection">
                        Section ID:<br>
                        <input type="text" id="edsectionid" name="edsectionid" size="40">
                        <br>
                        Section Name:<br>
                        <input type="text" id="edsectionname" name="edsectionname" size="40" >   
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
        const cid = tableRowElement.getElementsByClassName('tsectionid')[0].innerHTML;
       const cname = tableRowElement.getElementsByClassName('tsectionname')[0].innerHTML;
      const pcid=tableRowElement.getElementsByClassName('tsectionid')[0].innerHTML;
      document.getElementById('edsectionid').value = cid;
       document.getElementById('edsectionname').value = cname;
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
