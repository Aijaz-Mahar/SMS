<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="/localcss/tablecss.css">  
    <link rel="stylesheet" href="/localcss/studentModel.css">
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

        <%@ page import="java.sql.*" %>
        <%@ page import="com.pos.mywebapp.DbConnect" %>

        <%-- Declare variable/filed databaseURL --%>
        <%!  private static Connection conn;  %>
        <%! String picid;%>
        <%
         try {
        // String sid=request.getParameter("sessionid");
         //String cid=request.getParameter("classid");
        String sid,cid;
                 conn=DbConnect.getConnection();
                 
                  Statement statementsession = conn.createStatement();
                 String sqlsession = "SELECT distinct sessionyear FROM addmissionform order by sessionyear desc";
                 ResultSet resultsession = statementsession.executeQuery(sqlsession);
                   Statement statementclass = conn.createStatement();
                 String sqlclass = "SELECT distinct admissionclass FROM addmissionform";
                 ResultSet resultclass = statementclass.executeQuery(sqlclass);
                 
               Statement statement = conn.createStatement();
              //   String sql = "SELECT admissionformno,sessionyear,admissionclass,grno,rollnumber,fullname,studentpic FROM addmissionForm  where sessionyear='"+sid+"' and admissionclass='"+cid+"'";
                String sql = "select rownum as sno,a.admissionformno as admissionformno,a.fullname as fullname,a.fathername as fathername,s.grno as grno,"
                + "s.rollnumber as rollnumber,s.classid as classid,s.section as section,a.mobileno as mobileno,s.status as status,"
                + "s.sessionyear as sessionyear,s.remarks as remarks from student s,addmissionform a where a.grno=s.grno order by s.sessionyear desc";
                
              ResultSet result = statement.executeQuery(sql);
        %>
    <center>

             <p style="color:white;background-color: green; width:280px; font-size: 20px;">Students List</p>
      <form action="">      
          <p style="color:white;background-color: #333; width:500px; height: 30px; font-size: 20px;">
            Select Session:
            <select  style="font-size:15px;" name="sessions" id="sessions" onchange="classFunction()"> 
             <%  

          while (resultsession.next()) {
           %>        
           <option  value="<%=resultsession.getString("sessionyear")%>" > <%=resultsession.getString("sessionyear")%>  </option>
  
            <% } %>
             </select>       
  Select Class:           
  <select  style="font-size:15px;" name="classes" id="classes" onchange="classFunction()"> 
             <%  
          while(resultclass.next()) {
           %>        
           <option value="<%=resultclass.getString("admissionclass")%>" > <%=resultclass.getString("admissionclass")%>  </option>
  
            <% } %>
             </select>       
          </p>
          
              </form>
           

        <div id="divsearch" class="divsearch" style=" height: 0px;">
      <table>      
                <tr>
                    <td>
                       
                        <input "center" type="text" id="myInput" onkeyup="studentFunction()" placeholder="Type Student Name  " title="Students Record"
                               style="height:30px;font-size: 20px;">
                       
                        </td>
                </tr></table></div>
   
    <br><br>
    <div class="container">

        <!-- Trigger the modal with a button -->



        <TABLE id="catTable" cellpadding="10" border="1" style="background-color: white;color: black" align="center">
  <thead>
      <tr>
           <th scope="col" style="color: black;background-color: aliceblue;height:30px;">S.No</th>
           <th scope="col" style="color: black;background-color: aliceblue;height:30px;">Name</th>
           <th scope="col" style="color: black;background-color: aliceblue; height: 30px;">Father's Name</th>
            <th scope="col" style="color: black;background-color: aliceblue;height:30px;">G.R#</th>
            <th scope="col" style="color: black;background-color: aliceblue; height: 30px;">Roll#</th>
            <th scope="col" style="color: black;background-color: aliceblue; height: 30px;">Class </th>
            <th scope="col" style="color: black;background-color: aliceblue; height: 30px;">Section</th>
            <th scope="col" style="color: black;background-color: aliceblue; height: 30px;">Contact#</th>
             <th scope="col" style="color: black;background-color: aliceblue; height: 30px;">Picture</th>
             
            <th scope="col" colspan="2" style="color: black;background-color: aliceblue; text-align: center;"> 
                <button type="button" class="btn btn-info btn-lg" id="myBtn" style="width:100px;padding: 5px 0px; height: 40px; background-color: #31b131;font-size: 16px;"
                        onclick='showStudents()'> Print List</button></th>
                   
</tr>
        </thead>
         <tbody>  
        <%  
           
String cn;
  int row=1;
          while (result.next()) {
            %>
            <tr>
            
                <TD class="tsno"><center><%=result.getString("sno")%></center></TD>
                <TD class="tfullname"><%=result.getString("fullname")%> </TD>
                <TD class="tfathername"><%=result.getString("fathername")%></TD>
                <TD class="tgrno"><%=result.getString("grno")%></TD>
                <TD class="trollno"><%=result.getString("rollnumber")%></TD>
                <TD class="tclassid"><%=result.getString("classid")%></TD>
                <TD class="tsection"><%=result.getString("section")%></TD>
                <TD class="tmobileno"><%=result.getString("mobileno")%></TD>
                <td class="tsessions" hidden><%=result.getString("sessionyear")%></TD>
                <td class="tremarks" hidden><%=result.getString("remarks")%></TD>
                  <td class="tadmissionformno" hidden><%=result.getString("admissionformno")%></TD>
                    <td class="tstatus" hidden><%=result.getString("status")%></TD>
                <td>  <img src="StudentPic.jsp?admid=<%=result.getString("admissionformno")%>" alt="Pic" width="50" height="50" >
                </td>
                <%--
                 <td>       
                 
                     <button id="myBtned" style="width:60px;padding: 5px 0px;margin: 0px 0px; height: 30px;background-color: green;color:white;">
                         <i class="fa fa-edit"></i>
                         Edit</button></td>
                    --%>
                
                <td>
                    <% String r=result.getString("grno");             
                    %>
                    
                     <a href="#" onclick="toggleModal(this,'<%=r%>')">Edit</a>
                </td><!-- comment -->
                <td>
                      <% String formno=result.getString("grno");             
                    %>
                    <a href="PrintForm.jsp?admid=<%=formno%>" target="_blank">Print View</a>
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

out.println(ex.getMessage());
                    }

            %>
            <script>
                function studentFunction() {
                    
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
                
                  function sessionFunction() {
                    
                    var input, filter, table, tr, td, i, txtValue;
                    input = document.getElementById("sessions");
                    filter = input.value.toUpperCase();
                    table = document.getElementById("catTable");
                    tr = table.getElementsByTagName("tr");
                   
                    for (i = 0; i < tr.length; i++) {
                        td = tr[i].getElementsByTagName("td")[3];

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
                
                   function classFunction() {
                    
                    var input, filter, table, tr, td, i, txtValue,txtValue2;
                    input = document.getElementById("classes");
                    filter = input.value.toUpperCase();
                    input2 = document.getElementById("sessions");
                    filter2 = input2.value.toUpperCase();
                    table = document.getElementById("catTable");
                    tr = table.getElementsByTagName("tr");
                   
                    for (i = 0; i < tr.length; i++) {
                        td = tr[i].getElementsByTagName("td")[5];
                        td2 = tr[i].getElementsByTagName("td")[8];
                        if (td) {
                            txtValue = td.textContent || td.innerText;
                            txtValue2 = td2.textContent || td2.innerText;
                            if (txtValue.toUpperCase()===filter && txtValue2.toUpperCase()===filter2) {
                                tr[i].style.display = "";
                            } else {
                                tr[i].style.display = "none";
                            }
                        }
                    }
                }
            </script>
         
  <!-- Modal//quick view -->
    <div class="modal fade modal-fullscreen" id="editModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <%--
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    --%>
                    <p class="modal-title"> Student's Data</p>
                </div>
                <div class="modal-body">
                    <p>
                   
                       <form name="stdform" id="stdform" class="stdform" method="post" action="UpdateStudent" enctype="multipart/form-data">
                        
                               <div class="row">
                                   &nbsp;&nbsp;&nbsp;
                                    <div class="column">
                                        
                                       <table>
                                           <tr>
                                               <td>
                           <input type="hidden" id="stdid" name="stdpicid" >
                           <img id="stdpic" src="/reports/StudentPic.jsp?admid=001" alt="Pic" width="100" height="100" >
                                               </td>
                                           </tr>
                                       </table>
                                    </div>
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   <div class="column">
                               <table>
                                   <tr>
                                       <td>
                                         Session:<br>
                                <input type="text" id="vsession" name="vsession" size="15" >
                                    </td>
                                   </tr>
                                   <tr>
                                    <td>
                                        Roll#<br>
                                <input type="text" id="vrollno" name="vrollno" size="15" >
                                    </td>
                                    <td>
                                        GR#:<br>
                                <input type="text" id="vgrno" name="vgrno" size="15" >
                                    </td>
                                     <td>
                                        Class:<br>
                                <input type="text" id="vclass" name="vclass" size="15" >
                                    </td>
                                    <td>
                                     Section:<br>
                                <input type="text" id="vsection" name="vsection" size="15" >
                                    </td>   
                                </tr>
                               </table>
                                   </div>
                                 
                                   </div>
                                
                           <table>
                               <tr>
                                   <td>
                                       Full Name:<br>
                                <input type="text" id="vfullname" name="vfullname" size="40" >
                                   </td>
                                   <td>
                                       Father's Name:<br>
                                        <input type="text" id="vfathername" name="vfathername" size="32" >
                                   </td>
                                   <td>
                                       Mobile#:<br>
                                        <input type="text" id="vmobileno" name="vmobileno" size="15" >
                                   </td>
                               </tr>
                               <tr>
                                   <td>
                                       Status:
                                       <label id="currentstatus" style="color: red;"  >dfsd </label>
                                   </td>
                                   <td>
                                       Action:<br>
                                         <select  id="vstatus" name="vstatus">
                                             <option  value="A">Active</option>
                                             <option  value="I">Inactive</option>
                                       </select>
                                   </td>
                                    
                               </tr>
                                    
                                 <tr>
                                  
                                   <td>
                                       Remarks:<br>
                                        <input type="text" id="vremarks" name="vremarks" size="40" >
                                   </td>
                               </tr>
                           </table>
                             </p>

                        </div>
                        <div class="modal-footer" style=" height: 50px;">
                            <%--
                            <input type='submit' value="Save" name="save" class="btnsave"/>
                            --%>
                    <input type="hidden" id="paragrno" name="paragrno">   
                     <input type='submit' value="Save" name="save" class="btnsave"/>
                     <button type="button" class="btnclose" data-dismiss="modal" onclick="closeModal()">Close</button> </div>
                      </div>
                    </form>
                 

           

        </div>
       
    </div>
                              
<div class="modal-backdrop fade show" id="backdrop" style="display: none;"></div>
<%--                  
    <script>
        $(document).ready(function () {
            $("#myBtn").click(function () {
                window.location="PrintStudentList.jsp";
                //$("#myModal").modal();
            });
        });
   


    </script>
--%>

<script>
    let tableRowElement;
    function toggleModal(element) {

        tableRowElement = element.parentElement.parentElement;
          
        const grno = tableRowElement.getElementsByClassName('tgrno')[0].innerHTML;
       
        const fullname = tableRowElement.getElementsByClassName('tfullname')[0].innerHTML;
        
         const fathername = tableRowElement.getElementsByClassName('tfathername')[0].innerHTML;
        const sessionyear = tableRowElement.getElementsByClassName('tsessions')[0].innerHTML;

        const classid = tableRowElement.getElementsByClassName('tclassid')[0].innerHTML;
        const section = tableRowElement.getElementsByClassName('tsection')[0].innerHTML;
              
        const rollno = tableRowElement.getElementsByClassName('trollno')[0].innerHTML;
        const mobileno=tableRowElement.getElementsByClassName('tmobileno')[0].innerHTML;
                
        const remarks=tableRowElement.getElementsByClassName('tremarks')[0].innerHTML;

         const admissionid=tableRowElement.getElementsByClassName('tadmissionformno')[0].innerHTML;
          const status=tableRowElement.getElementsByClassName('tstatus')[0].innerHTML;
        //    const mname=document.getElementById('mothername').value;
  var st=status;
  if(st==='A')
  {
      st="Active";}
      else{
          st="Inactive";
  }
      
  
        document.getElementById('vrollno').value = rollno;       
        document.getElementById('vgrno').value = grno;
         document.getElementById('paragrno').value = grno;
        document.getElementById('vsession').value = sessionyear;
        document.getElementById('vclass').value = classid;
        document.getElementById('vsection').value = section;
             
        document.getElementById('vfullname').value = fullname;
                
        document.getElementById('vfathername').value = fathername;
        
        document.getElementById('vmobileno').value = mobileno;
  //alert('jj');
        document.getElementById('vremarks').value = remarks;
         document.getElementById('vstatus').value = status;
       document.getElementById('currentstatus').innerHTML=st;
      //  document.getElementById('stdid').value=admissionid;
      var imgloc='StudentPic.jsp?admid='+admissionid;
      document.getElementById('stdpic').setAttribute('src',imgloc);
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
    function selectSession()
    {
        
        var vsession=document.getElementById("sessions").value;
        <%String s="asd";%>
                  alert(vsession);
        var a="<%=s%>";
      
        alert(a);
       
    }
    </script>
  <script>
  function showStudents() {
  //if (str == "") {
    //document.getElementById("stdinfo").innerHTML = "";
    //return;
  //}

//selectElement=document.querySelector("#sessions");
 //sid=selectElement.value;
const vsessionid=document.getElementById("sessions").value;
const vclassid=document.getElementById("classes").value;

//selectElement2=document.querySelector("#classes");
 //cid=selectElement2.value;
//document.write(sid+"  "+cid);
  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {
 var new_window = window.open("PrintStudentList.jsp?sessionid="+vsessionid+"&classid="+vclassid,'_blank');
new_window.document.write(xhr.responseText);
    //document.getElementById("stdinfo").innerHTML = this.responseText;
  };
 
  xhttp.open("GET", "PrintStudentList.jsp?sessionid="+vsessionid+"&classid="+vclassid);
  xhttp.send();
}

 
</script>

</body>
</html>

