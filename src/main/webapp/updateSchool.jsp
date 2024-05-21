<%-- 
    Document   : updateSchool
    Created on : May 18, 2023, 11:00:19 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.pos.mywebapp.DbConnect" %>
<%@page import="java.io.*"%> 

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update School</title>
        <style>
  div.form1 {
  width: 600px;
  padding: 10px;
  margin-top: 10%;
  box-sizing: border-box;
  background-color: green;
  opacity: 0.6; 
  
}
#save{background:red; width:400px; margin:0 auto; color:#fff; padding:10px; text-align:center;}
</style>
    </head>
    <body>
       
        
         <%!  private static Connection conn;  %>
         <%! String saveMsg;%>
        <%! String schoolid,schoolname,address,contactno,email; %>
         <%
         try {
    
         conn=DbConnect.getConnection();
               Statement statement = conn.createStatement();
               
                 String sql = "SELECT schoolid,schoolname,address,contactno,email FROM school ";
                 ResultSet result = statement.executeQuery(sql);
                    
        while (result.next()) {
        
        schoolid=result.getString("schoolid");
         schoolname=result.getString("schoolname");
          address=result.getString("address");
           contactno=result.getString("contactno");
            email=result.getString("email");
          
            } 
         } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
        %>
    <center>   
       
        <div class="form1" style="border:solid blue">
        
            <form name='updateSchool' action="updateSchool.jsp" method="post">
<table border='0' height='300' style="color:white;font-weight: bold">
    <tr>
        <td></td>
        <td style="border: solid;text-align: center;background-color: #f4fbff;color:red;">Update School Information</td>
    </tr>
  <tr>
      <td>School ID:</td>
      <td> <input type='text' size="10" name='schoolID' style="font-weight: bold;" value="<%=schoolid%>">
    </td>
  </tr><!-- comment -->
  <tr>
      <td>School Name:</td>
      <td><input type='text' size="50" name='schoolName' style="font-weight: bold;" value="<%=schoolname%>">
    </td>
  </tr>
   <tr>
       <td>Address:</td>
       <td>
    <input type='text' size="50" name='schoolAddress' style="font-weight: bold;" value="<%=address%>">
    </td>
  </tr> 
  <tr>
     <td>Contact#:</td>
       <td>
    <input type='text' size="12" name='schoolPhone' style="font-weight: bold;" value="<%=contactno%>">
    </td>
  </tr>
  <tr>
     <td>Email#:</td>
       <td>
    <input type='email' size="30" name='schoolEmail' style="font-weight: bold;" value="<%=email%>">
    </td>
  </tr>
  <tr>
     <td>School Logo:</td>
       </td>
       <td>
    <input style="font-weight: bold;" type='file' id="logo" name="logo">
    </td>
  </tr>
  <tr>
     <td>
  
    <input style="font-weight: bold;" type='submit' value="Update" name='update'/>
    </td>
  </tr>
</table>
        </form><!-- comment -->
        </div>
    
    </center>
  
                
    <%!
     public class UpdateSchool{
       // private Connection conn=null;
        
    
     Connection conn=null;
      PreparedStatement updateschool=null;
      public UpdateSchool()
        {
try {
    
         conn=DbConnect.getConnection();
       
        
     String mysql="UPDATE school SET schoolid=?,schoolname=?,address=?,contactno=?,email=?";
       // String mysql="insert into school(schoolid,schoolname,address,contactno,email) values (?,?,?,?,?)";
      updateschool=conn.prepareStatement(mysql);              
} catch(SQLException e){
                e.printStackTrace();
}//catch
            
} //constructor

 public int setSchool(String sid,String sname,String saddress,String scontact,String semail){
      int result=0;
try{
       updateschool.setString(1,sid);
        updateschool.setString(2,sname);
         updateschool.setString(3,saddress);
          updateschool.setString(4,scontact);
           updateschool.setString(5,semail);
        result=updateschool.executeUpdate();
       // conn.commit();
} catch(SQLException e)
{  e.printStackTrace(); } //catch



return result;
}//method setschool
 } //class
        %>
    
         <%
             int r=0;
             String schoolId=new String();
             String schoolName=new String();
             String schoolAddress=new String();
             String schoolContact=new String();
             String schoolEmail=new String();
             if(request.getParameter("schoolID")!=null){
             schoolId=request.getParameter("schoolID");
             }
             if(request.getParameter("schoolName")!=null){
             schoolName=request.getParameter("schoolName");
             }
             if(request.getParameter("schoolAddress")!=null){
             schoolAddress=request.getParameter("schoolAddress");
             }
             if(request.getParameter("schoolPhone")!=null){
             schoolContact=request.getParameter("schoolPhone");
             
             }
             if(request.getParameter("schoolEmail")!=null){
             schoolEmail=request.getParameter("schoolEmail");
             }
             
             UpdateSchool us=new UpdateSchool();
             
             r=us.setSchool(schoolId,schoolName,schoolAddress,schoolContact,schoolEmail);
             
             if(r==1){
             out.print("<center><div id='ssve' style='background-color:green;color:white;width:300px'><p>Information Updated..!</p></div></center>");
             }
            %>        
    </body>
          
</html>
