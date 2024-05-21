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

             <p style="color:white;background-color: green; width:280px; font-size: 20px;">Student ID Cards</p>
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
             <br><!-- comment -->
             <br><!-- comment -->
                <button type="button" class="btn btn-info btn-lg" id="myBtn" style="width:120px;padding: 5px 0px; height: 40px; background-color: #31b131;font-size: 16px;"
                        onclick='showStudentsCard()'> Generate Cards</button>

   
    
   </center>
            <%
            //   out.print(result.getString("cname"));
                           // out.print("<p>");
            
             } catch (SQLException ex) {
                        ex.printStackTrace();

out.println(ex.getMessage());
                    }

            %>
           
                
               

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
  function showStudentsCard() {
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
  var new_window = window.open("PrintStudentIdCards.jsp?sessionid="+vsessionid+"&classid="+vclassid,'_blank');
  new_window.document.write(xhr.responseText);
    //document.getElementById("stdinfo").innerHTML = this.responseText;
  };
 
  xhttp.open("GET", "PrintStudentIdCards.jsp?sessionid="+vsessionid+"&classid="+vclassid);
  xhttp.send();
}

 
</script>

</body>
</html>

