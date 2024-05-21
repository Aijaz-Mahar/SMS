<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="com.pos.mywebapp.DbConnect" %>
<%@page import="java.io.*"%> 
 
<html lang="en">
    <head>
      
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">       
        <link rel="stylesheet" href="menu1.css"> 
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        
        <title>Menu</title>
           <%response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);%>
        
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Open+Sans&display=swap');
            .dropdown-container {
                display: none;
                background-color: #262626;
                padding-left: 8px;
            }

            .dropdown-student {
                display: none;
                background-color: #262626;
                padding-left: 8px;
            }
            .dropdown-teacher {
                display: none;
                background-color: #262626;
                padding-left: 8px;
            }
            .dropdown-dept {
                display: none;
                background-color: #262626;
                padding-left: 8px;
            }
            .dropdown-fees {
                display: none;
                background-color: captiontext;
                padding-left: 8px;
            }
             div.content2 {
                width: 1200px;
               
                padding: 10px;
                margin-top: 1%;
                margin-right: 0;
                box-sizing: border-box;
                background-color: blue;
                opacity: 0.6;
                font-size: 0;
                overflow: auto;
               
             }     
           div.row {
                width: 1000px;
                height: 120px;
                padding: 10px;
                padding-bottom:5px;
                margin-top: 1%;
                margin-right: 0;
                margin-left: 200px;
                box-sizing: border-box;
                background-color: white;
                opacity: 0.6;
                overflow: hidden;
              
                  
              
             }              
             .col-sm-3{
             
                 overflow: hidden;
                 background-color: white;

                 
             }
           /*  .well{
                 
               overflow-x: hidden;
               overflow-y: hidden;
               color: white;
               background-color: #138496;
             }
             */
.well {
position: relative; 
color:#fff;
font-size:115%;
font-weight:500;
height:80px;

text-align:center;
overflow-x: hidden;
overflow-y: hidden;

}
.s1
{ background-color: darkcyan; }
.s2 {background-color: darkseagreen;  }
.s3 {background-color: darkslategray; }
.s4 {background-color: darkturquoise; }
.s5 {background-color: darkolivegreen;   }
.s6 {background-color: darkslateblue;}
.s7 {background-color:  darkmagenta;}
.s8 {background-color:  darkorange; }

.well:hover {
  transform: scale(1.1); /* (150% zoom - Note: if the zoom is too large, it will go outside of the viewport) */
  color: white;
  background-color:green;
}
a:link {color: white;}
a:active{color: whitesmoke;}
a:hover { color: white;}
.rownotic{
    height: 300px;
    width: 1000px;
    margin-left: 200px;
    
}

.column1 {
  float: left;
  width: 50%;
  padding: 0px;
  height: 250px;
  overflow: auto;
}
.column2 {
  float: left;
  width: 50%;
  padding: 0px;
  height: 250px;
  overflow: auto;
}
.row:after {
  content: "";
  display: table;
  clear: both;
}
</style>
        
         <%!  private static Connection conn;  %>
         <%! String saveMsg;%>
        <%! String schoolid,schoolname,address,contactno,email; %>
        <%! int vtotalstd;%>
         <%
         try {
    
         conn=DbConnect.getConnection();
               Statement statement = conn.createStatement();
               
                 String sql = "SELECT schoolname,address FROM school where sid=1 ";
                 ResultSet result = statement.executeQuery(sql);
                 
                Statement ststd = conn.createStatement();
                String sqlstd = "SELECT count(*) as totalstd FROM student ";
                ResultSet resultstd = ststd.executeQuery(sqlstd);
             %>        
        
    </head>
        <div class="wrapper">          
            <div class="section">
              
                <div class="top_navbar">                        
                    <div class="hamburger">
                        <a href="#">
                            <i class="fas fa-bars"></i>
                        </a>
                          
                    </div>
                    <%
                    while (result.next()) {
        
        //schoolid=result.getString("schoolid");
         schoolname=result.getString("schoolname");
          address=result.getString("address");
           //contactno=result.getString("contactno");
            //email=result.getString("email");
            %>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <p style="color:white; font-size: 20px;"><%=schoolname%></p> 
               &nbsp;&nbsp;
            <p style="color:white;">(<%=address%>)</p> 
           
             <%
                 }

                 while (resultstd.next()) {
        
        //schoolid=result.getString("schoolid");
         vtotalstd=resultstd.getInt("totalstd");

            }
            
         } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
        %>
                 
                </div>

                  
                    
            </div>
            <div class="sidebar">
                  
                <div class="profile">
                       <%--
                    <img src="/images/apscLogo.png" alt="profile_picture">
                     --%>
                 
                    <img src="displayimg.jsp" alt="profile_picture" >
                   
                    <p>  <%=request.getParameter("user")%></p>
                </div>
                <ul>

                    <li>
                       
                       <a href="#" onClick="window.location.reload();return false;">
                            <%-- <a href="#" class="active"> --%>
                            <span class="icon"><i class="fas fa-home"></i></span>
                            <span class="item">Home</span>
                        </a><!-- comment -->
                        <%--      <div id ="content"> </div>  --%>

                    </li>
                    <li>

                        
                    </li>
                    <li>
                        <a href="#"  class="setting-link">
                            <span class="icon"><i class="fas fa-database"></i></span>
                            <span class="item">Admissions</span>

                        </a>
                        <div class="dropdown-student">
                            <a href="#" onclick="load_admissionform()">
                                Admission Form</a>
                            <a href="#" onclick="load_admissionrecord()">Admission Record</a>
                           <a href="#" >Admission Challan</a>
                        </div> 

                    </li>
                     <li>
                        <a href="#"  class="setting-link">
                            <span class="icon"><i class="fas fa-user-friends"></i></span>
                            <span class="item">Students</span>

                        </a>
                        <div class="dropdown-student">
                            <a href="#" onclick="load_studentlist()"> Students List </a>
                            <a href="#" onclick="load_studentidcards()">Student ID Cards</a>
                            
                            <a href="#" >Documents</a>
                            <a href="#" >History</a>
                           
                        </div> 

                    </li>
                    
                    <li>
                        <a href="#"  class="setting-link">
                            <span class="icon"><i class="fas fa-dollar-sign"></i></span>
                            <span class="item">Manage Fees</span>

                        </a>
                        <div class="dropdown-student">
                            <a href="#" onclick="load_GenerateChallan()"> Generate Challan </a>
                            <a href="#" onclick="load_CollectChallan()">Collect Challan</a>
                            <a href="#" onclick="load_ChallanList()">Challan List</a>
                           
                        </div> 

                    </li>
                    <li>
                        <a href="#" class="setting-link">
                            <span class="icon"><i class="fas fa-chalkboard-teacher"></i></span>
                            <span class="item">Teachers</span>
                        </a>
                         <div class="dropdown-teacher">
                            <a href="#" onclick="load_AttendanceEntry()">
                               Class Attendance</a>
                            

                        </div>
                    </li>
                    <li>
                        <a href="#" class="setting-link">
                            <span class="icon"><i class="fas fa-graduation-cap"></i></span>
                            <span class="item">Examination</span>
                        </a>
                        <div class="dropdown-dept">
                            <a href="#" onclick="load_MarksEntry()">Marks Entry</a>
                             <a href="#" onclick="load_ReportCard()">Report Card</a>
                             <a href="#" >Class Promotion</a>
                            
                           

                        </div>
                    </li>

                    <li>
                        <a href="#">
                            <span class="icon"><i class="fas fa-chart-line"></i></span>
                            <span class="item">Reports</span>
                        </a>
                    </li>
                    <%--
                    <li>
                        <a href="#">
                            <span class="icon"><i class="fas fa-user-shield"></i></span>
                            <span class="item">Admin</span>
                        </a>
                    </li>
                    --%>
                    <li>
                        <a href="#" class="setting-link">
                            <span class="icon"><i class="fas fa-cog"></i></span>
                            <span class="item">Settings</span>
                        </a>
                        <div class="dropdown-container">
                            <a href="#" onclick="loadUpdateSchool()">
                                 School Info:</a>
                              <a href="#" onclick="load_sessions()">
                                 Academic Sessions</a>
                            <a href="#" onclick="load_class()">Classes</a>
                            <a href="#" onclick="load_subject()">Subjects</a>
                            <a href="#" onclick="load_feesetup()">Fees Setup </a>
                            <a href="#" onclick="load_examtype()">Exams</a>
                            <a href="#" onclick="load_dept()">Departments</a>
                             <a href="#" onclick="load_bank()">Bank Info:</a>
                            <a href="#">Users</a>
                            
                        </div>
                    </li>
               
                    <li>
                        <a href="logout.jsp" >
                            <span class="icon"><i class="fa-sign-out-alt"></i></span>
                            <span class="item"> Logout</span>
                        </a>
                    </li>
                   </ul>
            </div>

        </div>
                    <center>
    <div id="content2" >
 
          
  <div class="row" id="row-1">
     <div class="col-sm-3">
        
          <div class="well s1">
               <a href="#" onclick="load_admissionrecord()">
              <p1 style="color: white;">Admission Record</p>
               </a>
            <p><%=vtotalstd%></p> 
             </div></div>
             
            <div class="col-sm-3">
           <div class="well s2" >
             <a href="#" onclick="load_studentlist()">
              <p1 style="color: white;">Students</p>
               </a>
            <p><%=vtotalstd%></p> 
          </div></div>
      <div class="col-sm-3">
          <div class="well s3">
              <a href="#" onclick="load_AttendanceEntry()">
              <p1 style="color: white;">Attendance</p>
               </a> 
          </div></div>
         <div class="col-sm-3">
          <div class="well s4">
              <a href="#" onclick="load_FeesRecord()">
              <p1 style="color: white;">Fees Record</p>
               </a>
          </div></div>
             
          
 </div>
 <div class="row" id="row-1">
     <div class="col-sm-3">
        
          <div class="well s5">
              
              <p1 style="color: white;">Employees</p>
              
            <p><%=vtotalstd%></p> 
             </div></div>
             
            <div class="col-sm-3">
           <div class="well s6" >
           <p1>Reports</p>
            <p></p> 
          </div></div>
      <div class="col-sm-3">
          <div class="well s7">
            <p>Teachers</p>
            <p></p> 
          </div></div>
         <div class="col-sm-3">
          <div class="well s8">
            <a href="#" onclick="load_GenerateChallan()">
              <p1 style="color: white;">Generate Challan</p>
               </a> 
            
          </div></div>
             
          
 </div>
            
     
<div class="rownotic">
  <div class="column1" style="background-color: white; border-style: solid;">
      <p style="width:480px; background-color: red; color: white;">Noticeboard</p>
    <marquee behavior="scroll" direction="up" scrollamount="1">
      <p>Attention All.</p>
      <p>School vacantion starts on 01.01.24</p>
      <p>Submit your all dues before the date.</p>
    </marquee>
   
    
  </div>
   <div class="column2" style="background-color: white; border-style: solid;">
       <center>
            <p style="width:480px; background-color:darkblue; color: white;">Time Table</p>
       </center>
    
  </div>
</div>
      
      
</div>
</center>
                  
<script>
    var hamburger = document.querySelector(".hamburger");
    hamburger.addEventListener("click", function () {
        document.querySelector("body").classList.toggle("active");
    });

    function load_home() {
       //var mydiv1= document.getElementById("content2").innerHTML;
       //var mydiv2= document.getElementById("row-1").innerHTML ;
      // mydiv1.innerHTML=mydiv2.innerHTML;
       // $('#row-1').show();
      
    }
    
    function load_admissionform() {
        document.getElementById("content2").innerHTML = '<object type="text/html" height="620" width="910" data="AdmissionForm.jsp" ></object>';
    }
function load_admissionrecord() {
        document.getElementById("content2").innerHTML = '<object type="text/html" height="600" width="1100" data="AdmissionRecord01.jsp" ></object>';
    }
function load_studentlist() {
        document.getElementById("content2").innerHTML = '<object type="text/html" height="600" width="1100" data="StudentList.jsp" ></object>';
    }
function load_studentidcards() {
        document.getElementById("content2").innerHTML = '<object type="text/html" height="600" width="1100" data="StudentIdCard.jsp" ></object>';
    }
  function load_GenerateChallan() {
        document.getElementById("content2").innerHTML = '<object type="text/html" height="600" width="1100" data="ChallanForm.jsp" ></object>';
    }
  function load_CollectChallan() {
        document.getElementById("content2").innerHTML = '<object type="text/html" height="600" width="1100" data="CollectChallan.jsp" ></object>';
    }
 function load_ChallanList() {
        document.getElementById("content2").innerHTML = '<object type="text/html" height="600" width="1100" data="ChallanList.jsp" ></object>';
    }
 function load_MarksEntry() {
        document.getElementById("content2").innerHTML = '<object type="text/html" height="600" width="1100" data="AddMarks.jsp" ></object>';
    }
 function load_ReportCard() {
        document.getElementById("content2").innerHTML = '<object type="text/html" height="600" width="1100" data="StudentReportCard.jsp" ></object>';
    }
    function loadUpdateSchool() {
        document.getElementById("content2").innerHTML = '<object type="text/html" height="600" width="800" data="updateSchool01.jsp" ></object>';
    }
function load_sessions() {
        document.getElementById("content2").innerHTML = '<object type="text/html" height="600" width="800" data="AddSession.jsp" ></object>';
    }
function load_class() {
        document.getElementById("content2").innerHTML = '<object type="text/html" height="600" width="800" data="classesList.jsp" ></object>';
    }
function load_dept() {
        document.getElementById("content2").innerHTML = '<object type="text/html" height="600" width="800" data="DeptList.jsp" ></object>';
    }
function load_subject() {
        document.getElementById("content2").innerHTML = '<object type="text/html" height="600" width="800" data="SubjectList.jsp" ></object>';
    }
    
    function load_feesetup() {
        document.getElementById("content2").innerHTML = '<object type="text/html" height="600" width="800" data="StudentCatList.jsp" ></object>';
    }
     function load_AttendanceEntry() {
        document.getElementById("content2").innerHTML = '<object type="text/html" height="600" width="800" data="AttendanceEntry.jsp" ></object>';
    }
    function load_examtype() {
        document.getElementById("content2").innerHTML = '<object type="text/html" height="600" width="800" data="AddExamType.jsp" ></object>';
    }
    function load_bank() {
        document.getElementById("content2").innerHTML = '<object type="text/html" height="600" width="1100" data="Bank.jsp" ></object>';
    }
     function load_FeesRecord() {
        document.getElementById("content2").innerHTML = '<object type="text/html" height="600" width="1100" data="FeesRecord.jsp" ></object>';
    }
    var dropdown = document.getElementsByClassName("setting-link");
    var i;

    for (i = 0; i < dropdown.length; i++) {
        dropdown[i].addEventListener("click", function () {
            this.classList.toggle("active");
            var dropdownContent = this.nextElementSibling;
            if (dropdownContent.style.display === "block") {
                dropdownContent.style.display = "none";
            } else {
                dropdownContent.style.display = "block";
            }
        });
    }
</script>


</body>
</html>