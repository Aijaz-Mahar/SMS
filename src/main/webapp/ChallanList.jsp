<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="localcss/tablecss.css">  
    <link rel="stylesheet" href="localcss/studentModel2.css">
    <%--
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    --%>
     <link rel="stylesheet" href="localcss/fontawesome.min.css">
    <meta charset="utf-8">     
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="localcss\bootstrap.min.css">
    <script src="localjs\jquery-3.7.0.min.js"></script>
    <script src="localjs\bootstrap.min.js"></script>
  
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
  <a class="active" href="ChallanList.jsp">Challan List</a>
  <a href="CollectChallan.jsp">Collect Challan</a>
  <a href="ChallanForm.jsp">Generate Challan</a>
  </div>
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
                 String sqlsession = "SELECT distinct sessionyear FROM masterchallan order by sessionyear desc";
                 ResultSet resultsession = statementsession.executeQuery(sqlsession);
                 
                 Statement statementclass = conn.createStatement();
                 String sqlclass = "SELECT distinct classid FROM masterchallan";
                 ResultSet resultclass = statementclass.executeQuery(sqlclass);
                 
                 Statement statementmonth = conn.createStatement();
                 String sqlmonth = "SELECT distinct monthof FROM masterchallan";
                 ResultSet resultmonth = statementmonth.executeQuery(sqlmonth);
                 
                 Statement statementyear = conn.createStatement();
                 String sqlyear = "SELECT distinct yearof FROM masterchallan";
                 ResultSet resultyear = statementyear.executeQuery(sqlyear);
                 
               Statement statement = conn.createStatement();
              //   String sql = "SELECT admissionformno,sessionyear,admissionclass,grno,rollnumber,fullname,studentpic FROM addmissionForm  where sessionyear='"+sid+"' and admissionclass='"+cid+"'";
                String sql = "select distinct grno,CLASSID,sessionyear,yearof,monthof,to_char(issuedate,'dd-MON-yy') as issuedate,to_char(duedate,'dd-MON-yy') as duedate,monthof||'-'||yearof as month,challanid,status from "
                + "masterchallan order by challanid";
                
              ResultSet result = statement.executeQuery(sql);
        %>
    <center>
          <p style="color:white;background-color: green; width:280px; font-size: 20px;">Challan List</p>
          <table border="1">
      <form action="">      
         
       <tr>
           <td>
            Session:
            <select  style="font-size:15px;" name="sessions" id="sessions" onchange="classFunction()"> 
             <%  

          while (resultsession.next()) {
          
           %>        
           <option  value="<%=resultsession.getString("sessionyear")%>" > <%=resultsession.getString("sessionyear")%>  </option>
           
            <% } %>
             </select>       
              </td>
           <td>
   Class:           
  <select  style="font-size:15px;" name="classes" id="classes" onchange="classFunction()"> 
             <%  
          while(resultclass.next()) {
           %>        
           <option value="<%=resultclass.getString("classid")%>" > <%=resultclass.getString("classid")%>  </option>
           
            <% 
               
               } %>
             </select>  
              </td>
       </tr>           
       <tr>
           <td>
   Month:           
  <select  style="font-size:15px;" name="month" id="month" onchange="classFunction()"> 
     <%  
          while(resultmonth.next()) {
           %>        
           <option value="<%=resultmonth.getString("monthof")%>" > <%=resultmonth.getString("monthof")%>  </option>
  
            <% 
              
               } %>
             </select>    
           </td>
           <td>
  Year:           
  <select  style="font-size:15px;" name="year" id="year" onchange="classFunction()"> 
     <%  
          while(resultyear.next()) {
           %>        
           <option value="<%=resultyear.getString("yearof")%>" > <%=resultyear.getString("yearof")%>  </option>
  
            <% } %>
             </select>    
           </td>
           </tr>
              </form>
             </table>

        <div id="divsearch" class="divsearch" style=" height: 0px;">
      <table>      
                <tr>
                    <td>
                       
                        <input "center" type="text" id="myInput" onkeyup="ShowChallan()" placeholder="Type GR.No.  " title="Challan Record"
                               style="height:25px;font-size: 18px;">
                       
                        </td>
                        
                </tr></table></div>
   
    <br><br>
    <div class="container">

        <!-- Trigger the modal with a button -->



        <TABLE id="catTable" cellpadding="10" border="1" style="background-color: white;color: black" align="center">
  <thead>
      <tr>
           <th scope="col" style="color: black;background-color: aliceblue;height:30px;">GR.No</th>
            <th scope="col" style="color: black;background-color: aliceblue;height:30px;">Session</th>
           <th scope="col" style="color: black;background-color: aliceblue;height:30px;">Class</th>
           <th scope="col" style="color: black;background-color: aliceblue; height: 30px;">Issue Date</th>
            <th scope="col" style="color: black;background-color: aliceblue;height:30px;">Due Date</th>
            <th scope="col" style="color: black;background-color: aliceblue; height: 30px;">Month</th>
            <th scope="col" style="color: black;background-color: aliceblue; height: 30px;">Challan ID </th>
            <th scope="col" style="color: black;background-color: aliceblue; height: 30px;">Status</th>
             
            <th scope="col" colspan="2" style="color: black;background-color: aliceblue; text-align: center;"> 
                <button type="button" class="btn btn-info btn-lg" id="myBtn" style="width:110px;padding: 5px 0px; height: 40px; background-color: #31b131;font-size: 16px;"
                        onclick='showChallanList()'> View Challans</button></th>
                   
</tr>
        </thead>
         <tbody>  
        <%  
           
String cn;
  int row=1;
          while (result.next()) {
            %>
            <tr>
            
                <TD class="tgrno"><center><%=result.getString("grno")%></center></TD>
        <TD class="tsession"><%=result.getString("sessionyear")%> </TD>
                <TD class="tclassid"><%=result.getString("classid")%> </TD>
                <TD class="tissuedate"><%=result.getString("IssueDate")%></TD>
                <TD class="tduedate"><%=result.getString("duedate")%></TD>
                <TD class="tmonth"><%=result.getString("month")%></TD>
                <TD class="tchallanid"><%=result.getString("challanid")%></TD>
                <TD class="tstatus"><%=result.getString("status")%></TD>
                <TD class="tmonth" hidden><%=result.getString("monthof")%></TD>
                <TD class="tyear" hidden><%=result.getString("yearof")%></TD>
                
                <%--
                 <td>       
                 
                     <button id="myBtned" style="width:60px;padding: 5px 0px;margin: 0px 0px; height: 30px;background-color: green;color:white;">
                         <i class="fa fa-edit"></i>
                         Edit</button></td>
                    --%>
                
                <td>
                    <% String r=result.getString("challanid");             
                    %>
                    
                    <button "btnchallancollect" onclick="showChallan('<%=r%>')" style="width:50px;height:50px; padding: 5px 0px;">Collect Challan</a>
                </td><!-- comment -->
                <td>
                      <% String sgrno=result.getString("grno");             
                    %>
                   
                        
                    <a href="" id="challanview" onclick="findChallanPrint()"  target="_blank">Print View</a>
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
                function ShowChallan() {
                     var input0,input,input2,input8,input9, filter0,filter,filter2,filter8,filter9;
                    var table,tr,td0,td,td2,td8,td9,i,txtValue0,txtValue,txtValue2,txtmonth,txtyear;
                   
                   input0 = document.getElementById("myInput");
                    filter0 = input0.value.toUpperCase();
                    
                    input = document.getElementById("classes");
                    filter = input.value.toUpperCase();
                    
                    input2 = document.getElementById("sessions");
                    filter2 = input2.value.toUpperCase();
                     
                    input8 = document.getElementById("month");
                     filter8 = input8.value.toUpperCase();
                   
                       input9 = document.getElementById("year");
                       filter9 = input9.value.toUpperCase();
                      
                    table = document.getElementById("catTable");
                    tr = table.getElementsByTagName("tr");
                    
                    for (i = 0; i < tr.length; i++) {
                         td0 = tr[i].getElementsByTagName("td")[0];
                        td = tr[i].getElementsByTagName("td")[1];
                        td2 = tr[i].getElementsByTagName("td")[2];
                        td8=tr[i].getElementsByTagName("td")[8];
                        td9=tr[i].getElementsByTagName("td")[9];
                        if (td) {
                             txtValue0 = td0.textContent || td.innerText;
                            txtValue = td.textContent || td.innerText;
                            txtValue2 = td2.textContent || td2.innerText;
                            
                             txtmonth = td8.textContent || td8.innerText;
                             txtyear = td9.textContent || td9.innerText;
                             
                              t1=txtValue.trim();
                              t2=txtValue2.trim();
                              tmonth=txtmonth.trim();
                              tyear=txtyear.trim();
                                                                               
                            if (txtValue0.toUpperCase().indexOf(filter0) > -1 && t1===filter2 && t2===filter && tmonth===filter8 && tyear===filter9)
                            {
                                tr[i].style.display = "";
                            } else {
                                tr[i].style.display = "none";
                            }
                        }
                    }
                }                 
                
                
                   function classFunction() {
               
                    var input,input2,input8,input9, filter,filter2,filter8,filter9;
                    var table,tr,td,td2,td8,td9,i,txtValue,txtValue2,txtmonth,txtyear;
                    input = document.getElementById("classes");
                    filter = input.value.toUpperCase();
                    
                    input2 = document.getElementById("sessions");
                    filter2 = input2.value.toUpperCase();
                     
                    input8 = document.getElementById("month");
                     filter8 = input8.value.toUpperCase();
                   
                       input9 = document.getElementById("year");
                       filter9 = input9.value.toUpperCase();
                      
                    table = document.getElementById("catTable");
                    tr = table.getElementsByTagName("tr");
                    
                    for (i = 0; i < tr.length; i++) {
                        td = tr[i].getElementsByTagName("td")[1];
                        td2 = tr[i].getElementsByTagName("td")[2];
                        td8=tr[i].getElementsByTagName("td")[8];
                        td9=tr[i].getElementsByTagName("td")[9];
                        if (td) {
                            txtValue = td.textContent || td.innerText;
                            txtValue2 = td2.textContent || td2.innerText;
                            
                             txtmonth = td8.textContent || td8.innerText;
                             txtyear = td9.textContent || td9.innerText;
                             
                              t1=txtValue.trim();
                              t2=txtValue2.trim();
                              tmonth=txtmonth.trim();
                              tyear=txtyear.trim();
                            if (t1===filter2 && t2===filter && tmonth===filter8 && tyear===filter9) {
                                  
                                tr[i].style.display="";
                              
                            } else {
                                tr[i].style.display = "none";
                            }
                        }
                    }
                }
            </script>
                <script><!-- comment -->
                    let tableRowElement;
                    function findChallanPrint()
                    {
                    var cid=document.getElementById("classes").value;
                    var mid=document.getElementById("month").value;
                    var yid=document.getElementById("year").value;
                     
            tableRowElement = element.parentElement.parentElement;
        
           const grno = tableRowElement.getElementsByClassName('tgrno')[0].innerHTML;
           var newURL="PrintChallan.jsp?admid="+grno+"&cid="+cid+"&mid="+mid+"&yid="+yid;
           
            document.getElementById("challanview").href = newURL;
                                  
        
      //var imgloc='DisplayStdPic.jsp?admid='+grno;
      //document.getElementById('challanview').setAttribute('href',fileloc);
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
                    <p class="modal-title"> Student</p>
                </div>
                <div class="modal-body">
                    <p>
                   
                       <form name="stdform" id="stdform" class="stdform" method="post" action="UpdateStd">
                        
                               <div class="row">
                                   &nbsp;&nbsp;&nbsp;
                                    <div class="column">
                                        
                                       <table>
                                           <tr>
                                               <td>
                           <input type="hidden" id="stdid" name="stdpicid" >
                           <img id="stdpic" src="DisplayStdPic.jsp?admid=001" alt="Pic" width="100" height="100" >
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
  function showChallanList() {
  //if (str == "") {
    //document.getElementById("stdinfo").innerHTML = "";
    //return;
  //}

//selectElement=document.querySelector("#sessions");
 //sid=selectElement.value;
const cid=document.getElementById("classes").value;
const mid=document.getElementById("month").value;
const yid=document.getElementById("year").value;

//selectElement2=document.querySelector("#classes");
 //cid=selectElement2.value;
//document.write(sid+"  "+cid);
  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {
 var new_window = window.open("PrintChallan.jsp?cid="+cid+"&mid="+mid+"&yid="+yid,'_blank');
new_window.document.write(xhr.responseText);
    //document.getElementById("stdinfo").innerHTML = this.responseText;
  };
 
  xhttp.open("GET", "PrintChallan.jsp?cid="+cid+"&mid="+mid+"&yid="+yid);
  xhttp.send();
}

 
</script>
<script>
function showChallan(str) {
  if (str == "") {
    document.getElementById("txtHint").innerHTML = "";
    return;
  }
  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {
      var new_window = window.open("ShowCollectChallan.jsp?sid="+str,'_blank');
       new_window.document.write(xhr.responseText);
    //document.getElementById("txtHint").innerHTML = this.responseText;
  }
  xhttp.open("GET", "ShowCollectChallan.jsp?sid="+str);
  xhttp.send();
}
</script>
</body>
</html>

