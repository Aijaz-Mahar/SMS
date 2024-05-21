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
 a:hover {
  color: white;
  background-color: transparent;
  text-decoration: underline;
}
    </style>

    <body>
        <div class="topnav">
           
            <a href="#contact">Print List</a>
        </div>

    <body>

        <%@ page import="java.sql.*" %>
        <%@ page import="com.pos.mywebapp.DbConnect" %>

        <%-- Declare variable/filed databaseURL --%>
        <%!  private static Connection conn;  %>
        <%
         try {
    
         conn=DbConnect.getConnection();
               Statement statement = conn.createStatement();
                 String sql = "SELECT bankid,bankname,branchname,bankaccount,bankaddress,contactno,banklogo FROM bank";
                 ResultSet result = statement.executeQuery(sql);
        %>
    <center>

        <p style="color:white;background-color: green; width:200px; font-size: 20px;">Bank Info:</p>

        <div id="divsearch" class="divsearch" style=" height: 0px;">
      <table>      
                <tr>
                    <td>
                        <input "center" type="text" id="myInput" onkeyup="courseFunction()" placeholder="Type Bank Code  " title="Fees Type"
                               style="height:30px;font-size: 20px;"></td>
                </tr></table></div>
   
    <br><br>
    <div class="container">

        <!-- Trigger the modal with a button -->



        <TABLE id="catTable" cellpadding="10" border="1" style="background-color: white;color: black" align="center">
  <thead>
      <tr>
           <th scope="col" style="color: black;background-color: aliceblue;height:30px;"></th>
            <th scope="col" style="color: black;background-color: aliceblue;height:30px;">Bank Code</th>
            <th scope="col" style="color: black;background-color: aliceblue; height: 30px;">Bank Name</th>
            <th scope="col" style="color: black;background-color: aliceblue; height: 30px;">Branch </th>
            <th scope="col" style="color: black;background-color: aliceblue; height: 30px;">Account#</th>
            <th scope="col" style="color: black;background-color: aliceblue; height: 30px;">Address</th>
             <th scope="col" style="color: black;background-color: aliceblue; height: 30px;">Contact#</th>
            <th scope="col" style="color: black;background-color: aliceblue;"> <button type="button" class="btn btn-info btn-lg" id="myBtn" style="width:60px;padding: 5px 0px; height: 40px; background-color: #31b131;font-size: 16px;">       
                    Add</button></th>
                   
</tr>
        </thead>
         <tbody>  
        <%  
           
String cn;
  int row=1;
          while (result.next()) {
            %>
            <tr>
            
                <td> <img src="displaybanklogo.jsp?bid=<%=result.getString("bankid")%>" alt="Bank Logo" width="50" height="50"></td>
                <TD class="tbankid"><%=result.getString("bankid")%></TD>
                <TD class="tbankname"><%=result.getString("bankname")%></TD>
                <TD class="tbranchname"><%=result.getString("branchname")%></TD>
                <TD class="tbankaccount"><%=result.getString("bankaccount")%></TD>
                <TD class="tbankadress"><%=result.getString("bankaddress")%></TD>
                 <TD class="tbankcontact"><%=result.getString("contactno")%></TD>
                
                
                    <%--
                 <td>       
                 
                     <button id="myBtned" style="width:60px;padding: 5px 0px;margin: 0px 0px; height: 30px;background-color: green;color:white;">
                         <i class="fa fa-edit"></i>
                         Edit</button></td>
                    --%>
                
                <td>
                    <% String r=result.getString("bankid");             
                    %>
                    
                     <a href="#" onclick="toggleModal(this,'<%=r%>')">Edit</a>
                    <%--
                    <a data-target="#editModal" data-toggle="modal" class="edcat" id="edstdcat" 
                       href="#editModal?catid=<%=result.getString("categoryid")%>">Edit</a>
                    --%>
                </td>

            </TR>
           

            <%} %>
  </tbody>
        </table>
   </center>
            <%
            //   out.print(result.getString("cname"));
                           // out.print("<p>");
            
             } catch (SQLException ex) {
                        ex.printStackTrace();
                    }

            %>
            <script>
                function courseFunction() {
                    var input, filter, table, tr, td, i, txtValue;
                    input = document.getElementById("myInput");
                    filter = input.value.toUpperCase();
                    table = document.getElementById("catTable");
                    tr = table.getElementsByTagName("tr");
                    for (i = 0; i < tr.length; i++) {
                        td = tr[i].getElementsByTagName("td")[1];

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
            <!-- Modal//add student category -->
            <div class="modal fade" tabindex="-1" id="myModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <%--
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            --%>
                            <p class="modal-title"> Adding Bank Detail</p>
                        </div>
                        <div class="modal-body">
                            
                            <form name="bankform" id="bankform1" class="bankform" method="post" action="AddBank" enctype="multipart/form-data">
                               Bank Code:<br>
                               <input type="text" id="bankid" name="bankid" size="40" required>
                                <br>
                                Bank Name:<br>
                                <input type="text" id="bankname" name="bankname" size="40" required>
                                <br>
                                Branch Name:<br>
                                <input type="text" id="branchname" name="branchname" size="40" required>
                                <br>
                                Bank Account:<br>
                                <input type="text" id="bankaccount" name="bankaccount" size="40" required><!-- comment -->
                                <br>
                                Bank Address:<br>
                                <input type="text" id="bankaddress" name="bankaddress" size="40" required>
                                <br>
                                 Bank Contact#:<br>
                                <input type="text" id="bankcontact" name="bankcontact" size="40" required>
                                <br>
                                Bank Logo:<br>
                                <input type="file"  name="banklogo" >
                               

                                </div>
                                <div class="modal-footer" style=" height: 50px;">

                                    <input type='submit' value="Save" name="save" class="btnsave"/>

                            </form>
                            <button type="button" class="btnclose" data-dismiss="modal">Close</button>  
                        </div>

                    </div>

                </div>
            </div>

    </div>
  <!-- Modal//edit student category -->
    <div class="modal fade" id="editModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <%--
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    --%>
                    <p class="modal-title"> Updating Bank Info</p>
                </div>
                <div class="modal-body">
                    <p>
                   
                       <form name="bankform2" id="bankform2" class="bankform2" method="post" action="UpdateBank" enctype="multipart/form-data">
                               Bank Code:<br>
                               <input type="text" id="edbankid" name="edbankid" size="40" required>
                                <br>
                                Bank Name:<br>
                                <input type="text" id="edbankname" name="edbankname" size="40" required>
                                <br>
                                Branch Name:<br>
                                <input type="text" id="edbranchname" name="edbranchname" size="40" required>
                                <br>
                                Bank Account:<br>
                                <input type="text" id="edbankaccount" name="edbankaccount" size="40" required><!-- comment -->
                                <br>
                                Bank Address:<br>
                                <input type="text" id="edbankaddress" name="edbankaddress" size="40" required>
                                <br>
                                 Bank Contact#:<br>
                                <input type="text" id="edbankcontact" name="edbankcontact" size="40" required>
                                <br>
                                Bank Logo:<br>
                                <input type="file"  name="banklogo" >
                             </p>

                        </div>
                        <div class="modal-footer" style=" height: 50px;">

                            <input type='submit' value="Save" name="save" class="btnsave"/>
                    <input type="hidden" id="parabankid" name="parabankid">   
                    </form>
                    <button type="button" class="btnclose" data-dismiss="modal" onclick="closeModal()">Close</button> </div>

            </div>

        </div>
       
    </div>

  
<div class="modal-backdrop fade show" id="backdrop" style="display: none;"></div>
                       
    <script>
        $(document).ready(function () {
            $("#myBtn").click(function () {
                $("#myModal").modal();
            });
        });


    </script>


<script>
    let tableRowElement;
    function toggleModal(element) {
 
        tableRowElement = element.parentElement.parentElement;
        const bid = tableRowElement.getElementsByClassName('tbankid')[0].innerHTML;
        const bname = tableRowElement.getElementsByClassName('tbankname')[0].innerHTML;
        const brname = tableRowElement.getElementsByClassName('tbranchname')[0].innerHTML;
        const baccount = tableRowElement.getElementsByClassName('tbankaccount')[0].innerHTML;
        const baddress = tableRowElement.getElementsByClassName('tbankadress')[0].innerHTML;
        const bcontact = tableRowElement.getElementsByClassName('tbankcontact')[0].innerHTML;
        const pbid=tableRowElement.getElementsByClassName('tbankid')[0].innerHTML;
        document.getElementById('edbankid').value = bid;
        document.getElementById('edbankname').value = bname;
        document.getElementById('edbranchname').value = brname;
         document.getElementById('edbankaccount').value = baccount;
        document.getElementById('edbankaddress').value = baddress;
        document.getElementById('edbankcontact').value = bcontact;
        document.getElementById('parabankid').value = pbid;
 
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

