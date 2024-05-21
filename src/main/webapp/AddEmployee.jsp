<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <title>New Employee</title>
        <style>
            div.form1 {
                width: 880px;
                padding: 10px;
                margin-top: 1%;
                box-sizing: border-box;
                background-color: white;
                opacity: 0.6;
                height: 600px;
            }

            .btnsave {
                background-color: white;
                border: none;
                color: green;
                padding: 15px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
            }
            #detail {
                position:absolute;
                float:left;
            }
        </style>
    </head>
    <body>
        <%@ page import="java.sql.*" %>
        <%@ page import="com.pos.mywebapp.DbConnect" %>
        <%!  private static Connection conn;  %>
        <%
         try {
    
         conn=DbConnect.getConnection();
               Statement statement = conn.createStatement();
               
                 String sql = "SELECT DEPTID FROM DEPARTMENT";
                 ResultSet result = statement.executeQuery(sql);
                 String sql2 = "SELECT jobid FROM jobs";
                  Statement statement2 = conn.createStatement();
                 ResultSet result2 = statement2.executeQuery(sql2);
        %>
    <center>   
        <p style="border:solid green; font-size: 16px; width: 200px; font-weight: bold;">Add Employee</p>
        <div class="form1" style="border:solid blue">
            <form name="admissionform" action="AdmissionForm" Method="post" enctype="multipart/form-data">
                <table border='0' id="formno" style="color:black; border-spacing: 15px 0;font-size: 16px;font-weight: bold;">
                    <center>     
                        <tr>
                            
                            <td >Employee ID<br>
                                <input type="text" name="employeeid" style="width:120px;"></td>
                                <td>Department<br>
                                <select  name="deptlist" style="width:120px;font-size: 16px;font-weight: bold;"> 
                                    <%  
                                
                                 while (result.next()) {
                                    %>        
                                    <option name="dept"  value="<%=result.getString("DEPTID")%>" > <%=result.getString("DEPTID")%>  </option>

                                    <% } %>
                            </td>
                              <td>Designation<br>
                                <select  name="joblist" style="width:120px;font-size: 16px;font-weight: bold;"> 
                                    <%  
                                String cn;
                                 while (result2.next()) {
                                    %>        
                                    <option name="job"  value="<%=result2.getString("jobid")%>" > <%=result2.getString("jobid")%>  </option>

                                    <% } %>
                            </td>
                            <%
                //   out.print(result.getString("cname"));
                               // out.print("<p>");
            
                 } catch (SQLException ex) {
                            ex.printStackTrace();
                        }

                            %>
                            </select>  
                             <td>Date of Appointment<br>
                            <input type="date" name="appointdate" size="25" style="font-size: 14px; font-weight: bold;">
                        </td>
                            </tr> 
                        
                </table>
                                            
                
                <hr>
                <table id="detail" border="0" style="color:black; border-spacing: 15px 0;font-size: 16px;font-weight: bold;">

                    <tr>
                        <td  >Name<br>
                            <input type="text" name="empname" size="30" style="font-size: 14px; font-weight: bold;">
                        </td>
                        <td  >Father/Spouse Name<br>
                            <input type="text" name="empfname" size="30" style="font-size: 14px; font-weight: bold;">
                        </td>


                        <td> Employee CNIC#<br>
                            <input type="text" name="empcnic" size="25" style="font-size: 14px; font-weight: bold;">
                        </td>
                       

                    </tr>
                    <tr>
                        <td>Gender<br>
                            <select id="gender" name="gender" style="font-size: 14px; font-weight: bold; width: 273px;">
                                <option name="Male">Male</option>
                                <option name="Female">Female</option>
                            </select>
                        </td>
                     <td>Date of Birth<br>
                            <input type="date" name="birthdate" size="25" style="font-size: 14px; font-weight: bold;width: 273px;">
                        </td>
                          <td>Qualification<br>
                            <input type="text" name="qualification" size="25" style="font-size: 14px; font-weight: bold;">
                        </td>  
                     <tr>
                      
                        <td>Contact#<br>
                            <input type="text" name="contactno" size="30" style="font-size: 14px; font-weight: bold;">
                        </td>
                         <td>Email ID<br>
                            <input type="text" name="emailid" size="30" style="font-size: 14px; font-weight: bold;">
                        </td>
                     </tr>
                     <tr>
                        <td> Address<br>
                            <textarea id="caddress" name="caddress"  rows="3" cols="32" style="font-size: 14px; font-weight: bold;">
                            </textarea>
                        </td>
                        <td>Employee Picture</br>
                            <input type='file' name='empphoto'></td>
                     </tr>
                    
                    <TR><td>
                            <input type="submit" value="Save" name="btnsave" style="font-size: 14px; background-color: green;color: white; padding: 15px 20px;"></td>
                    </TR>
                </table>
            </form>
        </div>
    </center>



    <%--        
<table id="footer">                 
    <tr>
        <td>School Logo:</td>
        <td>
            <input type="file" name="logo">
        </td>
    </tr>
    <tr>
        <td>
            <input type='submit' value="Update" name='update' class="btnupdate">
        </td>
    </tr>
</table>
    --%>

   

</body>
</html>
