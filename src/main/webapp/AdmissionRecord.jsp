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

        <%@ page import="java.sql.*" %>
        <%@ page import="com.pos.mywebapp.DbConnect" %>

        <%-- Declare variable/filed databaseURL --%>
        <%!  private static Connection conn;  %>
        <%! String picid;%>
        <%
         try {
     //    String sid=request.getParameter("sessionid");
       // String cid=request.getParameter("classid");
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
                String sql = "SELECT rownum as sno,dateofadmission,admissionformno,sessionyear,admissionclass,grno,rollnumber,fullname,birthdate,birthplace,gender,religion,nationality,"
                + "fathername,fathercnic,fatherprofession,mothername,motherprofession,"
                + "fatherofficeno,motherofficeno,residenceno,mobileno,homeaddress,corrspadddress,"
                + "siblingid,categoryid,anydisability,anyallergy,studentpic FROM addmissionForm order by admissionformno";
              ResultSet result = statement.executeQuery(sql);
        %>
    <center>
        

             <p style="color:white;background-color: green; width:280px; font-size: 20px;">Students Admission Record</p>
      <form action="">      
          <p style="color:white;background-color: #333; width:500px; height: 30px; font-size: 20px;">
            Select Session:
            <select  style="font-size:15px;" name="sessions" id="sessions" onchange="selectSession()"> 
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
           <th scope="col" style="color: black;background-color: aliceblue;height:20px;">S.No</th>
           <th scope="col" style="color: black;background-color: aliceblue;height:20px;">Form#</th>
           <th scope="col" style="color: black;background-color: aliceblue; height: 20px;">Full Name</th>
            <th scope="col" style="color: black;background-color: aliceblue;height:20px;">Session</th>
            <th scope="col" style="color: black;background-color: aliceblue; height: 20px;">Class</th>
            <th scope="col" style="color: black;background-color: aliceblue; height: 20px;">GR# </th>
            <th scope="col" style="color: black;background-color: aliceblue; height: 20px;">Roll#</th>
            
             <th scope="col" style="color: black;background-color: aliceblue; height: 20px;">Picture</th>
             
            <th scope="col" colspan="2" style="color: black;background-color: aliceblue; text-align: center;height: 20px;"> <button type="button" class="btn btn-info btn-lg" id="myBtn" style="width:60px;padding: 5px 0px; height: 35px; background-color: #31b131;font-size: 16px;">       
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
            
                <TD class="tsno"><center><%=result.getString("sno")%></center></TD>
                <TD class="tadmissionid"><%=result.getString("admissionformno")%></TD>
                
                 <TD class="tfullname"><%=result.getString("fullname")%></TD>
                <TD class="tsession"><%=result.getString("sessionyear")%></TD>
                <TD class="tclass"><%=result.getString("admissionclass")%></TD>
                <TD class="tgrno"><%=result.getString("grno")%></TD>
                <TD class="trollno"><%=result.getString("rollnumber")%></TD>
                <td class="tadmissiondate" hidden><%=result.getString("dateofadmission")%>
                <td class="tbirthdate" hidden><%=result.getString("birthdate")%> </td>
                <td class="tbirthplace" hidden><%=result.getString("birthplace")%> </td>
                <td class="tgender" hidden><%=result.getString("gender")%> </td>
                <td class="treligion" hidden><%=result.getString("religion")%> </td>
                <td class="tnationality" hidden><%=result.getString("nationality")%> </td>
                <td class="tfathername" hidden><%=result.getString("fathername")%> </td>
                <td class="tfathercnic" hidden><%=result.getString("fathercnic")%> </td>
                <td class="tfatherprofession" hidden><%=result.getString("fatherprofession")%> </td>
                <td class="tmothername" hidden><%=result.getString("mothername")%> </td>
                <td class="tmotherprofession" hidden><%=result.getString("motherprofession")%> </td>
                <td class="tfatherofficeno" hidden><%=result.getString("fatherofficeno")%> </td>
                <td class="tmotherofficeno" hidden><%=result.getString("motherofficeno")%> </td>
                <td class="temergencyno" hidden><%=result.getString("residenceno")%> </td>
                <td class="tmobileno" hidden><%=result.getString("mobileno")%> </td>
                <td class="thomeaddress" hidden><%=result.getString("homeaddress")%> </td>
                <td class="tmailingaddress" hidden><%=result.getString("corrspadddress")%> </td>
                <td class="tcategoryid" hidden><%=result.getString("categoryid")%> </td>
                <td class="tdisability" hidden><%=result.getString("anydisability")%> </td>
                <td class="tallergy" hidden><%=result.getString("anyallergy")%> </td>
                
                <td>  <img src="DisplayStdPic.jsp?admid=<%=result.getString("grno")%>" alt="Pic" width="50" height="40" >
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
                    
                     <a href="#" onclick="toggleModal(this,'<%=r%>')">Quick View</a>
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
                        td = tr[i].getElementsByTagName("td")[2];

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
                    
                    var input, filter, table, tr, td, i, txtValue;
                    input = document.getElementById("classes");
                    filter = input.value.toUpperCase();
                    table = document.getElementById("catTable");
                    tr = table.getElementsByTagName("tr");
                   
                    for (i = 0; i < tr.length; i++) {
                        td = tr[i].getElementsByTagName("td")[4];

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
                   
                       <form name="stdform" id="stdform" class="stdform" method="post" action="" enctype="multipart/form-data">
                        
                               <div class="row">
                                   &nbsp;&nbsp;&nbsp;
                                    <div class="column">
                                        
                                       <table>
                                           <tr>
                                               <td>
                           <input type="hidden" id="stdid" name="stdpicid" >
                           <img id="stdpic" src="DisplayStdPic.jsp?admid=1" alt="Pic" width="100" height="100" >
                                               </td>
                                           </tr>
                                       </table>
                                    </div>
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   <div class="column">
                               <table>
                                   <tr>
                                   <td>
                                       Admission Form#:<br>
                               <input type="text" id="vadmissionid" name="vadmissionid" size="15" disabled="true">
                                   </td>
                                   <td>
                                       Session:<br>
                                <input type="text" id="vsession" name="vsession" size="15" disabled>
                                </td>
                                <td>
                                    Class:<br>
                                <input type="text" id="vclass" name="vclass" size="15" disabled>
                                </td>
                                </tr>
                                <tr>
                                    <td>
                                        Date of Admission:<br>
                               <input type="text" id="vadmissiondate" name="vadmissiondate" size="15" disabled="true">
                                    </td>
                                    <td>
                                        Roll#<br>
                                <input type="text" id="vrollno" name="vrollno" size="15" disabled>
                                    </td>
                                    <td>
                                        GR#:<br>
                                <input type="text" id="vgrno" name="vgrno" size="15" disabled>
                                    </td>
                                </tr>
                               </table>
                                   </div>
                                  
                                   </div>
                                
                           <table>
                               <tr>
                                   <td>
                                       Full Name:<br>
                                <input type="text" id="vfullname" name="vfullname" size="40" disabled>
                                   </td>
                                   <td>
                                       Date of Birth:<br>
                                <input type="text" id="vbirthdate" name="vbirthdate" size="10" disabled><!-- comment -->
                                   </td>
                                   <td>
                                       Place of Birth:<br>
                                <input type="text" id="vbirthplace" name="vbirthplace" size="15" disabled>
                                   </td>
                               </tr>
                               <tr>
                                   <td>
                                       Gender:<br>
                                <input type="text" id="vgender" name="vgender" size="10" disabled>
                                   </td>
                                   <td>
                                       Religion:<br>
                                <input type="text" id="vreligion" name="vreligion" size="20" disabled>
                                   </td>
                                   <td>
                                       Nationality:<br>
                               <input type="text" id="vnationality" name="vnationality" size="15" disabled>
                                   </td>
                               </tr>
                               <tr>
                                   <td>
                                       Father's Name:<br>
                                        <input type="text" id="vfathername" name="vfathername" size="30" disabled>
                                   </td>
                                   <td>
                                   Father CNIC:<br>
                                        <input type="text" id="vfathercnic" name="vfathercnic" size="15" disabled>
                                   </td>
                                   <td>
                                   Father Occupation:<br>
                                        <input type="text" id="vfatheroccupation" name="vfatheroccupation" size="25" disabled>
                                   </td>
                               </tr>
                                   <tr>
                                   <td><!-- comment -->
                                       Mother Name:<br>
                                <input type="text" id="vmothername" name="vmothername" size="20" disabled>
                                </td>
                                <td><!-- comment -->
                                    Mother Occupation:<br>
                                <input type="text" id="vmotheroccupation" name="vmotheroccupation" size="20" disabled>
                                </td>
                                <td><!-- comment -->
                                    Father Office#:<br>
                                <input type="text" id="vfatherofficeno" name="vfatherofficeno" size="20" disabled>
                                </td>
                                </tr>
                                <tr>
                                <td><!-- comment -->
                                    Mother Office#:<br>
                                <input type="text" id="vmotherofficeno" name="vmotherofficeno" size="20" disabled>
                                </td>
                                <td><!-- comment -->
                                    Mobile#:<br>
                                <input type="text" id="vmobileno" name="vmobileno" size="20" disabled>
                                </td>
                                <td><!-- comment -->
                                    Emergency#:<br>
                                <input type="text" id="vemergencyno" name="vemergencyno" size="20" disabled>
                                </td>
                                </tr>
                                <tr>
                                <td><!-- comment -->
                                    Home Address:<br>
                                <input type="text" id="vhomeaddress" name="vhomeaddress" size="40" disabled>
                                </td>
                                <td><!-- comment -->
                                    Mailing Address:<br>
                                <input type="text" id="vmailingaddress" name="vmailingaddress" size="40" disabled>
                                </td>
                                 <td><!-- comment -->
                                    Student Category:<br>
                                <input type="text" id="vstudentcategory" name="vstudentcategory" size="15" disabled>
                                </td>
                                </tr>
                                <tr>
                                <td><!-- comment -->
                                    Any Disability:<br>
                                <input type="text" id="vdisability" name="vdisability" size="40" disabled>
                                </td>
                                <td><!-- comment -->
                                    Any Allergy:<br>
                                <input type="text" id="vallergy" name="vallergy" size="40" disabled>
                                </td>
                               
                           </table>
                             </p>

                        </div>
                        <div class="modal-footer" style=" height: 50px;">
                            <%--
                            <input type='submit' value="Save" name="save" class="btnsave"/>
                            --%>
                    <input type="hidden" id="parabankid" name="parabankid">   
                    </form>
                    <button type="button" class="btnclose" data-dismiss="modal" onclick="closeModal()">Close</button> </div>

            </div>

        </div>
       
    </div>
                              
<div class="modal-backdrop fade show" id="backdrop" style="display: none;"></div>
<%--                     
    <script>
        $(document).ready(function () {
            $("#myBtn").click(function () {
                window.location="AdmissionForm.jsp";
                //$("#myModal").modal();
            });
        });
   


    </script>
--%>

<script>
    let tableRowElement;
    function toggleModal(element) {
// alert('jj');
        tableRowElement = element.parentElement.parentElement;
        const admissionid = tableRowElement.getElementsByClassName('tadmissionid')[0].innerHTML;
        const fullname = tableRowElement.getElementsByClassName('tfullname')[0].innerHTML;
        const sessionyear = tableRowElement.getElementsByClassName('tsession')[0].innerHTML;
        const classid = tableRowElement.getElementsByClassName('tclass')[0].innerHTML;
        const grno = tableRowElement.getElementsByClassName('tgrno')[0].innerHTML;
        const rollno = tableRowElement.getElementsByClassName('trollno')[0].innerHTML;
        const birthdate=tableRowElement.getElementsByClassName('tbirthdate')[0].innerHTML;
        const birthplace=tableRowElement.getElementsByClassName('tbirthplace')[0].innerHTML;
        const gender=tableRowElement.getElementsByClassName('tgender')[0].innerHTML;
        const religion=tableRowElement.getElementsByClassName('treligion')[0].innerHTML;
        const nationality=tableRowElement.getElementsByClassName('tnationality')[0].innerHTML;
        const fathername=tableRowElement.getElementsByClassName('tfathername')[0].innerHTML;
        const fathercnic=tableRowElement.getElementsByClassName('tfathercnic')[0].innerHTML;
        const fatherprofession=tableRowElement.getElementsByClassName('tfatherprofession')[0].innerHTML;
        const mothername=tableRowElement.getElementsByClassName('tmothername')[0].innerHTML;
        const motherprofession=tableRowElement.getElementsByClassName('tmotherprofession')[0].innerHTML;
        const fatherofficeno=tableRowElement.getElementsByClassName('tfatherofficeno')[0].innerHTML;
        const motherofficeno=tableRowElement.getElementsByClassName('tmotherofficeno')[0].innerHTML;
        const emergencyno=tableRowElement.getElementsByClassName('temergencyno')[0].innerHTML;
        const mobileno=tableRowElement.getElementsByClassName('tmobileno')[0].innerHTML;
        const homeaddress=tableRowElement.getElementsByClassName('thomeaddress')[0].innerHTML;
        const mailingaddress=tableRowElement.getElementsByClassName('tmailingaddress')[0].innerHTML;
        const categoryid=tableRowElement.getElementsByClassName('tcategoryid')[0].innerHTML;
        const disability=tableRowElement.getElementsByClassName('tdisability')[0].innerHTML;
         const allergy=tableRowElement.getElementsByClassName('tallergy')[0].innerHTML;
         const admissiondate=tableRowElement.getElementsByClassName('tadmissiondate')[0].innerHTML;
        //    const mname=document.getElementById('mothername').value;
        
        document.getElementById('vadmissionid').value = admissionid;       
        document.getElementById('vsession').value = sessionyear;
        document.getElementById('vclass').value = classid;
         document.getElementById('vadmissiondate').value =admissiondate ;        
        document.getElementById('vrollno').value = rollno;
        document.getElementById('vgrno').value = grno;
        document.getElementById('vfullname').value = fullname;
        document.getElementById('vbirthdate').value = birthdate;
        document.getElementById('vbirthplace').value = birthplace;
        document.getElementById('vgender').value = gender;  
        document.getElementById('vreligion').value = religion;
        document.getElementById('vnationality').value = nationality;
        document.getElementById('vfathername').value = fathername;
        
        document.getElementById('vfathercnic').value = fathercnic;
        
        document.getElementById('vfatheroccupation').value = fatherprofession;
        document.getElementById('vmothername').value = mothername;
        document.getElementById('vmotheroccupation').value = motherprofession;
        document.getElementById('vfatherofficeno').value = fatherofficeno;
        document.getElementById('vmotherofficeno').value = motherofficeno;
        document.getElementById('vmobileno').value = mobileno;
        document.getElementById('vemergencyno').value = emergencyno;
        document.getElementById('vhomeaddress').value = homeaddress;
        document.getElementById('vmailingaddress').value = mailingaddress;
        document.getElementById('vstudentcategory').value = categoryid;
        document.getElementById('vdisability').value = disability;
         document.getElementById('vallergy').value = allergy;
         
      //  document.getElementById('stdid').value=admissionid;
      var imgloc='DisplayStdPic.jsp?admid='+grno;
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
  function printStudents() {
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

