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
                
        </style>
        
         <%!  private static Connection conn;  %>
         <%! String saveMsg;%>
        <%! String schoolid,schoolname,address,contactno,email; %>
         <%
         try {
    
         conn=DbConnect.getConnection();
               Statement statement = conn.createStatement();
               
                 String sql = "SELECT schoolname,address FROM school where sid=1 ";
                 ResultSet result = statement.executeQuery(sql);
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
                        <a href ="#"  onclick="load_home()"> 

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
                           <a href="#" onclick="load_admissionrecord()">Admission Challan</a>
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
                            <a href="#" onclick="load_admissionrecord()">Documents</a>
                            <a href="#" onclick="load_admissionrecord()">History</a>
                           
                        </div> 

                    </li>
                    
                    <li>
                        <a href="#"  class="setting-link">
                            <span class="icon"><i class="fas fa-dollar-sign"></i></span>
                            <span class="item">Manage Fees</span>

                        </a>
                        <div class="dropdown-student">
                            <a href="#" onclick="load_GenerateChallan()"> Generate Challan </a>
                            <a href="#" onclick="#">Collect Challan</a>
                            <a href="#" onclick="#">Search Challan</a>
                           
                        </div> 

                    </li>
                    <li>
                        <a href="#" class="setting-link">
                            <span class="icon"><i class="fas fa-chalkboard-teacher"></i></span>
                            <span class="item">Teachers</span>
                        </a>
                         <div class="dropdown-teacher">
                            <a href="#" onclick="loadUpdateSchool()">
                               Class Attendance</a>
                            

                        </div>
                    </li>
                    <li>
                        <a href="#" class="setting-link">
                            <span class="icon"><i class="fas fa-university"></i></span>
                            <span class="item">Departments</span>
                        </a>
                        <div class="dropdown-dept">
                            <a href="#" onclick="loadUpdateSchool()">
                                Examination</a>
                            <a href="#">Admin/HR</a>
                            <a href="#">Accounts</a>
                            <a href="#">Library</a>

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
                            <a href="#" onclick="load_class()">Classes</a>
                            <a href="#" onclick="load_subject()">Subjects</a>
                            <a href="#" onclick="load_feesetup()">Fees Setup </a>
                            <a href="#">Exams</a>
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
          
<p>
                <%=request.getParameter("user")%>
            </p>
            
            <br>
        <TABLE id="courseTable" cellpadding="10" border="0" style="background-color: white;color: black" align="center">

        
            <p>p1</p>

                       <div id="content3">
                <p>adasdasdas<p> </div>
</div>

                    </center>
<script>
    var hamburger = document.querySelector(".hamburger");
    hamburger.addEventListener("click", function () {
        document.querySelector("body").classList.toggle("active");
    });

    function load_home() {
        document.getElementById("content2").innerHTML = '<object type="text/html" height="600" width="800" data="modelForm.jsp" ></object>';
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
    function loadUpdateSchool() {
        document.getElementById("content2").innerHTML = '<object type="text/html" height="600" width="800" data="updateSchool01.jsp" ></object>';
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
    
    function load_bank() {
        document.getElementById("content2").innerHTML = '<object type="text/html" height="600" width="1100" data="Bank.jsp" ></object>';
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