<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.pos.mywebapp.DbConnect" %>
<%@page import="java.io.*"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
     <form name='testimage' action="UploadImage" method="post" enctype="multipart/form-data">
    <input type="file" name="logo">    
   
    <input style="font-weight: bold;" type='submit' value="Update" name='update'/>
   </form><!-- comment -->   
   <%--
   <%

try{

Connection con=null;

ResultSet rs=null;

PreparedStatement psmt=null;

FileInputStream fis;

int s=0;
    con=DbConnect.getConnection();




psmt=con.prepareStatement("insert into image(image) values(?)");

//psmt.setString(1,"Barack Obama");

//psmt.setString(2,"Wasington D.C.");


String slogo=request.getParameter("logo");
File image=new File(slogo);

out.print(slogo);
 //InputStream in;
   //   in = new FileInputStream(image);
    //  psmt.setBlob(1, in);
    
    fis=new FileInputStream(image);
psmt.setBinaryStream(1, (InputStream)fis, (int)(image.length()));
      //Executing the statement
      s=psmt.executeUpdate();
if(s>0) {
 out.println(s);
 out.println("Image Uploaded successfully !"); 

}

else {

out.println("unsucessfull to upload image.");

}
con.close();

psmt.close();

}catch(Exception ex){

out.println("Error in connection : "+ex);

}
%>
   --%>
   
   
    </body>
</html>
