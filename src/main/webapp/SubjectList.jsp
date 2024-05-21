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
    <script  src="StudentCatListEdit.js"></script>
  
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
  <a class="active" href="SubjectList.jsp">Subjects</a>
  
  <a href="AddClassSubjects.jsp">Assign Subjects to Class</a>
 <a href="SelectClass.jsp">Class Subjects</a>
 <a href="\reports\PrintSubjectList.jsp" target="_blank">Print </a>
  
</div>

        <%@ page import="java.sql.*" %>
        <%@ page import="com.pos.mywebapp.DbConnect" %>

        <%-- Declare variable/filed databaseURL --%>
        <%!  private static Connection conn;  %>
        <%
         try {
    
         conn=DbConnect.getConnection();
               Statement statement = conn.createStatement();
                 String sql = "SELECT subjectid,subjectname,totalmarks FROM subjects";
                 ResultSet result = statement.executeQuery(sql);
        %>
           
    <center>
        <p style="color:white;background-color: green; width:280px; font-size: 20px;">List of Subjects</p>
        <div id="divsearch" class="divsearch" style=" height: 0px;">
         <table>
            <tr>
                <td>
        <input "center" type="text" id="myInput" onkeyup="courseFunction()" placeholder="Search    " title="Type Subject"
               style="height:20px;font-size: 20px;"></td></tr></table></div>
    </center>
    <br><br><br>
        <TABLE id="courseTable" cellpadding="10" border="1" style="background-color: white;color: black" align="center">

            <th style="color: black;background-color: aliceblue">Subject ID</th>
            <th style="color: black;background-color: aliceblue">Subject Name</th>
            <th style="color: black;background-color: aliceblue">Subject Marks</th>
            <th style="color: black;background-color: aliceblue;"> <button type="button" class="btn btn-info btn-lg" id="myBtn" style="width:60px;padding: 5px 0px; height: 40px; background-color: #31b131;font-size: 16px;">       
                    Add</button></th>
      
            <%  

          while (result.next()) {
            %>
            <TR>
                <TD class="tsubjectid"><%=result.getString("subjectid")%></TD>
                <TD class="tsubjectname"><%=result.getString("subjectname")%></TD>
                 <TD class="ttotalmarks"><%=result.getString("totalmarks")%></TD>
                 <td>
                    <% String r=result.getString("subjectid");             
                    %>
                    
                     <a href="#" onclick="toggleModal(this,'<%=r%>')">Edit</a>
                    <%--
                    <a data-target="#editModal" data-toggle="modal" class="edcat" id="edstdcat" 
                       href="#editModal?catid=<%=result.getString("categoryid")%>">Edit</a>
                    --%>
                </td>

            </TR>
          
         <%} %>
                  
            <%
            //   out.print(result.getString("cname"));
                           // out.print("<p>");
            
             } catch (SQLException ex) {
                        ex.printStackTrace();
                   out.print(ex);
                    }
             %>
  <div class="modal fade" tabindex="-1" id="myModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <%--
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            --%>
                            <p class="modal-title"> Adding Subject</p>
                        </div>
                        <div class="modal-body">
                            <p>
                            <form name="catform" id="catform1" class="catform" method="post" action="AddSubject">
                               Subject ID:<br>
                                <input type="text" id="vsubjecid" name="vsubjectid" size="40">
                                <br>
                                Subject Name:<br>
                                <input type="text" id="vsubjectname" name="vsubjectname" size="40">
                                <br>
                                Subject Marks:<br>
                                <input type="text" id="vsubjectmarks" name="vsubjectmarks" size="40">
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
         
     <!-- Modal//edit SUBJECTS -->
    <div class="modal fade" id="editModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <%--
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    --%>
                    <p class="modal-title"> Update Subjects</p>
                </div>
                <div class="modal-body">
                    <p>
                    <form name="catform" id="catform1" class="catform" method="post" action="UpdateSubject">
                        Subject ID:<br>
                        <input type="text" id="edsubjectid" name="edsubjectid" size="40">
                        <br>
                        Subject Name:<br>
                        <input type="text" id="edsubjectname" name="edsubjectname" size="40" >   
                         <br>
                        Subject Marks:<br>
                        <input type="text" id="edsubjectmarks" name="edsubjectmarks" size="40" >   
                        </p>
                     </div>
                     <div class="modal-footer" style=" height: 50px;">
                          <input type="hidden" id="parasubjectid" name="parasubjectid">   
                     <input type='submit' value="Save" name="save" class="btnsave"/>
                   
                         </form>
                    <button type="button" class="btnclose" data-dismiss="modal" onclick="closeModal()">Close</button> </div>
      
            </div>
             </div>
              </div>
<div class="modal-backdrop fade show" id="backdrop" style="display: none;"></div>
    
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


<script>
    let tableRowElement;
    function toggleModal(element) {
 
        tableRowElement = element.parentElement.parentElement;
        const sid = tableRowElement.getElementsByClassName('tsubjectid')[0].innerHTML;
        const sname = tableRowElement.getElementsByClassName('tsubjectname')[0].innerHTML;
        const psid=tableRowElement.getElementsByClassName('tsubjectid')[0].innerHTML;
        const psubjmarks=tableRowElement.getElementsByClassName('ttotalmarks')[0].innerHTML;
        document.getElementById('edsubjectid').value = sid;
        document.getElementById('edsubjectname').value = sname;
        document.getElementById('parasubjectid').value = psid;
        document.getElementById('edsubjectmarks').value = psubjmarks;
 
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

    </body>
</html>
