<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <title>Admission Form</title>
        <style>
            div.form1 {
                width: 880px;
                padding: 10px;
                margin-top: 1%;
                box-sizing: border-box;
                background-color: white;
                opacity: 0.6;
                height: 620px;
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
                 String sql = "SELECT CLASSID FROM MASTERCLASS";
                 ResultSet result = statement.executeQuery(sql);
                  Statement statement2 = conn.createStatement();
                 String sql2 = "SELECT SECTIONID FROM SECTIONS";
                 ResultSet result2 = statement2.executeQuery(sql2);
                 Statement statement3 = conn.createStatement();
                 String sql3 = "select max(sessionyear) as sessionyear from sessionyears";
                 ResultSet resultsession = statement3.executeQuery(sql3);
                 
        %>
    <center>   
        <p style="border:solid green; font-size: 16px; width: 200px; font-weight: bold;">Admission Form Entry</p>
        <div class="form1" style="border:solid blue; font-weight: bold;">
            <form name="admissionform" id="admissionform" action="AdmissionForm" Method="post" enctype="multipart/form-data">
                <p style="font-weight: bold; ">Admission Form#<br>
                    <input type="text"  name="addmissionformno" style="width:120px; text-align:center; font-weight: bold;" required>
                </p>
                        
                <table border='0' id="formno" style="color:black; border-spacing: 15px 0;font-size: 16px;font-weight: bold;">
                    <center>      
                            <tr>
                            <td >Admission Date<br>
                                <input type="date" name="addmissiondate" style="width:120px; font-weight: bold;"></td>
                                <td>Session<br>
                                    <%
                                     while (resultsession.next()) {
                                    %>        
                                    <input type="text" name="sessionyear" value="<%=resultsession.getString("sessionyear")%>" style="width:120px; font-weight: bold;" required> </td>
                                 <% } %>
                            <td>Class:<br>
                                <select  name="admissionclass" style="width:120px;font-size: 16px;font-weight: bold;"> 
                                    <%  
                                String cn;
                                 while (result.next()) {
                                    %>        
                                    <option name="class1"  value="<%=result.getString("CLASSID")%>" > <%=result.getString("CLASSID")%>  </option>

                                    <% } %>
                                    </SELECT>
                            </td>
                            
                            <td>Section:<br>
                                <select  name="section" style="width:120px;font-size: 16px;font-weight: bold;"> 
                                    <%  
                                
                                 while (result2.next()) {
                                    %>        
                                    <option name="section"  value="<%=result2.getString("SECTIONID")%>" > <%=result2.getString("SECTIONID")%>  </option>

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
                            <td>Roll#</br>
                                <input type='text' name='rollno' style="width:120px;"></td>
                            <td>GR.No.</br>
                                <input type='text' name='grno' style="width:120px;" required></td>

                        </tr>
                </table>
                <hr>
                <table id="detail" border="0" style="color:black; border-spacing: 15px 0;font-size: 16px;font-weight: bold;">

                    <tr>
                        <td  >Full Name<br>
                            <input type="text" name="fullname" size="30" style="font-size: 14px; font-weight: bold;" required>
                        </td>


                        <td>Date of Birth<br>
                            <input type="date" name="birthdate" size="25" style="font-size: 14px; font-weight: bold; width: 273px;" required>
                        </td>
                        <td>Place of Birth<br>
                            <input type="text" name="birthplace" size="25" style="font-size: 14px; font-weight: bold;">
                        </td>

                    </tr>
                    <tr>
                        <td>Gender<br>
                            <select id="gender" name="gender" style="font-size: 14px; font-weight: bold; width: 273px;">
                                <option name="Male">Male</option>
                                <option name="Female">Female</option>
                            </select>
                        </td>
                        <td>Religion<br>
                            <input type="text" name="religion" size="30" style="font-size: 14px; font-weight: bold;">
                        </td>
                        <td>Nationality<br>
                            <input type="text" name="nationality" size="25" style="font-size: 14px; font-weight: bold;">
                        </td>
                    </tr>
                    <tr>

                        <td>Father's Name<br>
                            <input type="text" name="fname" size="30" style="font-size: 14px; font-weight: bold;" required>
                        </td>
                        <td>Father's CNIC<br>
                            <input type="text" name="fcnic" size="30" style="font-size: 14px; font-weight: bold;">
                        </td>
                        <td>Father's Profession<br>
                            <input type="text" name="fprofession" size="25" style="font-size: 14px; font-weight: bold;">
                        </td>
                    </tr>

                    <tr>

                        <td>Mother's Name<br>
                            <input type="text" name="mname" size="30" style="font-size: 14px; font-weight: bold;">
                        </td>
                        <td>Mother's Profession(if any)<br>
                            <input type="text" name="mprofession" size="30" style="font-size: 14px; font-weight: bold;">
                        </td>
                        <td>Father's Office#<br>
                            <input type="text" name="fofficeno" size="25" style="font-size: 14px; font-weight: bold;">
                        </td>
                    </tr>
                    <tr>
                        <td>Mother's Office#<br>
                            <input type="text" name="mofficeno" size="30" style="font-size: 14px; font-weight: bold;">
                        </td>
                        <td>Mobile#<br>
                            <input type="text" name="mobileno" size="30" style="font-size: 14px; font-weight: bold;">
                        </td>
                        <td>Emergency#<br>
                            <input type="text" name="emergencyno" size="25" style="font-size: 14px; font-weight: bold;">
                        </td>
                    </tr>



                    <tr>
                        <td>Home Address<br>
                            <textarea id="haddress" name="haddress" rows="3" cols="32" style="font-size: 14px; font-weight: bold;">
                            </textarea>
                        </td>

                        <td>Corresponding Address<br>
                            <textarea id="caddress" name="caddress"  rows="3" cols="32" style="font-size: 14px; font-weight: bold;">
                            </textarea>
                        </td>
                        <%--
                        <td>Any sibling studying in this school?<br>

                            <fieldset id="siblingradio">
                                <input type="radio" value="no"  name="siblingradio">No
                                <input type="radio" value="yes" name="siblingradio">Yes
                            </fieldset>
                        </td>
                        --%>
                        <td>Student Category<br><!-- comment -->

                            <%
                                      try {
    
                                   conn=DbConnect.getConnection();
                                   Statement statement = conn.createStatement();
                                    String sql2 = "SELECT CATEGORYID,CATEGORYNAME FROM STUDENTCATEGORY";
                                    ResultSet result2 = statement.executeQuery(sql2);
                            %>

                            <select  name="studentcategory" style="width:180px;font-size: 16px;font-weight: bold;"> 
                                <%  
                                
                             while (result2.next()) {
                                %>        
                                <option name="category"  value="<%=result2.getString("CATEGORYID")%>" > <%=result2.getString("CATEGORYNAME")%>  </option>

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



                    </tr>
                   <br>
                    <tr>
                        <td>Name of Last School Attended: <br>
                            <input type="text" name="lastschool" size="30" style="font-size: 14px; font-weight: bold;">
                        </td>

                        <td>Does child have any disability(detail) <br>
                            <input type="text" name="disability" size="30" style="font-size: 14px; font-weight: bold;">
                        </td>
                        <td>Student Pic</br>
                            <input type='file' name='photo'></td>
                    </tr>
                
                    
                    <tr>
                        <td style="border: solid thin;">School Leaving Certificate</td>
                       <td>
                            <input type="file" name="leavingcertificate">
                        </td>
                       
                    
                    <tr>
                        <td style="border: solid thin;">Birth Certificate</td>
                    
                    <td>
                            <input type="file" name="birthcertificate" ></td>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: solid thin;">Parent CNIC</td>
                     <td>
                            <input type="file" name="parentcnic" ></td>                                      
                        <td>
                             <input type="submit" value="Save" name="btnsave" style="font-size: 14px; background-color: green;color: white; padding: 15px 20px;">                    
                        </td>
                    </tr>    
    
                        
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
 <script>
  const form = document.getElementById('admissionform');
  form.addEventListener('keypress', function(e) {
  if (e.keyCode === 13) {
    e.preventDefault();
  }
});
   </script>

</body>
</html>
