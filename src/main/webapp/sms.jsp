
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="com.pos.mywebapp.DbConnect" %>
<%@page import="java.io.*"%> 
<html>
    <head>
        
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">       
        <link rel="stylesheet" href="menu1.css"> 
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SMS</title>
    </head>
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
             div.content1 {
                width: 800px;
               
                padding: 5px;
                margin-top: 1%;
                margin-right: 0;
            
                box-sizing: border-box;
                background-color: blue;
                opacity: 0.6;
                font-size: 0;
                overflow: auto;
               
             }     
           div.row {
                width: 380px;
                height: 410px;
                padding: 10px;
                padding-bottom:5px;
                margin-top: 1%;
                margin-right: 0;
               
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
.s2 {background-color: darkseagreen;}
.s3 {background-color: darkslategray; }
.s4 {background-color: darkturquoise;}

.well:hover {
  /*
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
        %>
        
    <body>
        <div id="title" >
             <%
                    while (result.next()) {
        
        //schoolid=result.getString("schoolid");
         schoolname=result.getString("schoolname");
          address=result.getString("address");
           //contactno=result.getString("contactno");
            //email=result.getString("email");
                   %>
                   <center>
            <p style="background-color: green;color:white; font-size:25px;"><%=schoolname%></p> 
            <p style="color:black; font-size:16px;"><%=address%></p> </center>
            <% }
                 } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
        %>
        </div>
  <div id="content1" style="background-color: #D5DDE5; height: 550px;">      
      <center>
  <div class="row" id="row-1" >
     <div class="col-sm">
        
          <div class="well s1">
               <a href="#" onclick="load_academics()">
              <p1 style="color: white; font-size: 20px;">Academics</p>
               </a>
             
             </div></div>
             
            <div class="col-sm">
           <div class="well s2" >
             <a href="#" onclick="load_hrm()">
              <p1 style="color: white; font-size: 20px;">HRM</p>
               </a>
           
          </div></div>
  
      <div class="col-sm">
          <div class="well s3">
              <a href="#" onclick="load_AttendanceEntry()">
              <p1 style="color: white; font-size: 20px;">Accounting</p>
               </a> 
          </div></div>
         <div class="col-sm">
          <div class="well s4">
              <a href="#" onclick="load_FeesRecord()">
              <p1 style="color: white; font-size: 20px;">Settings</p>
               </a>
          </div></div>
       </div>
          
      </center>
 </div>
    
    </body>
    
                      
<script>
    
    function load_academics() {
        window.open("index.html","_self")
        //document.getElementById("content1").innerHTML = '<object type="text/html" height="620" width="910" data="index.html" ></object>';
    }
function load_hrm() {
     window.open("hrMenu.jsp","_self")
        document.getElementById("content1").innerHTML = '<object type="text/html" height="600" width="1100" data="AdmissionRecord01.jsp" ></object>';
    }
</script>


</html>
