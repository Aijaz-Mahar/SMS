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
            <a class="active" href="StudentCatList.jsp">Student Category</a>
            <a href="FeesType.jsp">Fees Type</a>
            <a href="#">Fees Structure</a>
            <a href="LateFees.jsp">Late Fees</a>
            <a href="\reports\FeesStructureSession.jsp">Print</a>
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
                
                 String sql = " select categoryid,classid,feesid,amount from feesstructure order by classid";
                 ResultSet result = statement.executeQuery(sql);
        %>
    <center>

        <p style="color:white;background-color: green; width:250px; font-size: 20px;">Fees Structure Class Wise</p>

        <div id="divsearch" class="divsearch" style=" height: 0px;">
      <table>      
                <tr>
                    <td>
                        <input "center" type="text" id="myInput" onkeyup="courseFunction()" placeholder="Search Class   " title="Fees Type"
                               style="height:30px;font-size: 20px;"></td>
                </tr></table></div>
    </center>
    <br><br>
    <div class="container">

        <!-- Trigger the modal with a button -->



        <TABLE id="catTable" cellpadding="10" border="1" style="background-color: white;color: black" align="center">
  <thead>
      <tr>
           <th scope="col" style="color: black;background-color: aliceblue;height:30px;"> Category ID</th>
            <th scope="col" style="color: black;background-color: aliceblue;height:30px;"> Class ID</th>
            <th scope="col" style="color: black;background-color: aliceblue; height: 30px;">Fees ID</th>
             <th scope="col" style="color: black;background-color: aliceblue; height: 30px;">Fees Amount</th>
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
            
               <TD class="tcategoryid"><%=result.getString("categoryid")%></TD>
                <TD class="tclassid"><%=result.getString("classid")%></TD>
                <TD class="tfeesid"><%=result.getString("feesid")%></TD>
                <TD class="tfeesamount"><%=result.getString("amount")%></TD>
                    <%--
                 <td>       
                 
                     <button id="myBtned" style="width:60px;padding: 5px 0px;margin: 0px 0px; height: 30px;background-color: green;color:white;">
                         <i class="fa fa-edit"></i>
                         Edit</button></td>
                    --%>
                
                <td>
                    <% String r=result.getString("categoryid");             
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
              <%-- Declare variable/filed databaseURL --%>
        
        <%
         try {
    
            conn=DbConnect.getConnection();
               Statement statement = conn.createStatement();
                 String sql = "SELECT CLASSID FROM MASTERCLASS";
                   
                 
                
        %>
    
       
            
            <!-- Modal//add student category -->
            <div class="modal fade" tabindex="-1" id="myModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <%--
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            --%>
                           
                            <p class="modal-title" style="color:blue;"> Adding Fees Class Wise</p>
                            
                        </div>
                        <div class="modal-body">
                           
              <form name="catform" id="catform1" class="catform" method="post" action="AddFeesClasswise">                      
                    <table>
                        <tr> <td> Select Student Category</td>
                      <td> 
                <select  style="font-size:15px;" name="categories">  
                   
             <%  
            try{
           // Statement statement = conn.createStatement();
                 String sql3 = "SELECT categoryid FROM StudentCategory";
            ResultSet result3 = statement.executeQuery(sql3);
           
          while (result3.next()) {
           %>        
           
           <option name="optioncategoryid" SIZE="40" value="<%=result3.getString("categoryid")%>" > <%=result3.getString("categoryid")%>  </option>
  
            <% } %>
                </td> </tr>      
 </select>             
            <%
            //   out.print(result.getString("cname"));
                           // out.print("<p>");
            
             } catch (SQLException ex) {
                        ex.printStackTrace();
                    }

            %>
                        
                        
                  <tr> <td> Select Class</td>
                      <td> 
                <select  style="font-size:15px;" name="classes">  
                   
             <%  
            String cn;
            ResultSet result = statement.executeQuery(sql);
           
          while (result.next()) {
           %>        
           
           <option name="optionclassid" SIZE="40" value="<%=result.getString("CLASSID")%>" > <%=result.getString("CLASSID")%>  </option>
  
            <% } %>
                </td> </tr>      
 </select>             
            <%
            //   out.print(result.getString("cname"));
                           // out.print("<p>");
            
             } catch (SQLException ex) {
                        ex.printStackTrace();
                    }

            %>
            <br>    
          
            <tr> <td>
                Select Fees </td>
                 <td>
                <select  style="font-size:15px;" name="feeses">  
                   
             <% 
                 try{
                 
                 
                   Statement statement = conn.createStatement();
          String sql2 = "SELECT FEESID FROM FEESTYPE";
            ResultSet result2 = statement.executeQuery(sql2);
          while (result2.next()) {
           %>        
           <option name="optionfeesid"  value="<%=result2.getString("FEESID")%>" > <%=result2.getString("FEESID")%>  </option>
  
            <% } %>
                </td>    </tr>
 </select>             
            <%
            //   out.print(result.getString("cname"));
                           // out.print("<p>");
            
             } catch (SQLException ex) {
                        ex.printStackTrace();
                    }

            %>
            <tr>          
            <td>
                Fees Amount</td>
            <td> <input type="text" id="feesamount" name="feesamount" size="20"></td></tr></table>
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

    </div>
  <!-- Modal//edit student category fees -->
    <div class="modal fade" id="editModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <%--
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    --%>
                    <p class="modal-title"> Update Fees Amount</p>
                </div>
                <div class="modal-body">
                    <p>
                    <form name="catform" id="catform1" class="catform" method="post" action="UpdateFeesClasswise">
                        Category:<br>
                        <input type="text" id="edcategoryid" name="edcategoryid" size="40" readonly>
                        <br>
                        Class ID:<br>
                        <input type="text" id="edclassid" name="edclassid" size="40" readonly>
                        <br>
                        Fees ID:<br>
                        <input type="text" id="edfeesid" name="edfeesid" size="40" readonly>
                        <br>
                        Amount:<br>
                        <input type="text" id="edfeesamount" name="edamount" size="40">   
                        </p>

                        </div>
                        <div class="modal-footer" style=" height: 50px;">

                            <input type='submit' value="Save" name="save" class="btnsave"/>
                            <input type="hidden" id="paracategoryid" name="paracategoryid">   
                            <input type="hidden" id="paraclassid" name="paraclassid">   
                    <input type="hidden" id="parafeesid" name="parafeesid">   
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
        const catid = tableRowElement.getElementsByClassName('tcategoryid')[0].innerHTML;
        const cid = tableRowElement.getElementsByClassName('tclassid')[0].innerHTML;
        const fid = tableRowElement.getElementsByClassName('tfeesid')[0].innerHTML;
        const famt = tableRowElement.getElementsByClassName('tfeesamount')[0].innerHTML;
        const pfid=tableRowElement.getElementsByClassName('tfeesid')[0].innerHTML;
        document.getElementById('edcategoryid').value = catid;
        document.getElementById('edclassid').value = cid;
        document.getElementById('edfeesid').value = fid;
        document.getElementById('edfeesamount').value = famt;
        document.getElementById('parafeesid').value = pfid;
 
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

