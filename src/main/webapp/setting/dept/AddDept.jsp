<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.pos.mywebapp.DbConnect" %>
<%@page import="java.io.*"%> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Dept</title>
        <style>
            div.addclass {
                width: 600px;
                padding: 10px;
                margin-top: 10%;
                box-sizing: border-box;
                background-color: green;
                opacity: 0.6;
            }
            #save{
                background: cornflowerblue;
                width:350px;
                margin:10px;
                color:#fff;
                padding:5px;
                text-align:center;
            }
              
        </style>
    </head>
    <body>
        <%!  private static Connection conn;  %>
        <%! String saveMsg;%>
        <%! String deptid,deptname; %>
    <center>   
        <div class="addclass" style="border:solid blue">
            <p style="border: solid;text-align: center;background-color: #f4fbff;color:red;width:200px;height:20px;">
                Add New Department</p>
            <form name='addClassForm' action="AddDept.jsp" method="post">
                <table border='0' height='200' style="color:white;font-weight: bold">



                    <tr>
                        <td>Dept ID:</td>
                        <td> <input type='text' size="10" name='deptID' style="font-weight: bold;">
                        </td>
                    </tr><!-- comment -->
                    <tr>
                        <td>Dept: Name:</td>
                        <td><input type='text' size="50" name='deptName' style="font-weight: bold;">
                        </td>
                    </tr>
                    <tr>
                    <br>
                    <td>
                        <input style="font-weight: bold;font-size:20px;height:30px;width:60px;" type='submit' value="Save" name='save'/>
                    </td>
                    </tr>
                </table>
            </form><!-- comment -->
        </div>
        <div class="toplinks" style="border:solid green;background-color: #f1f1f1;width: 100px">
            <a href="DeptList.jsp">Return</a>
        </div>
    </center>


    <%!
     public class SaveClass{
       // private Connection conn=null;
      Connection conn=null;
      PreparedStatement saveclass=null;
      public SaveClass()
        {
try {
    
         conn=DbConnect.getConnection();
       
        
     String mysql="insert into department(deptid,deptname) values(?,?)";
       // String mysql="insert into school(schoolid,schoolname,address,contactno,email) values (?,?,?,?,?)";
      saveclass=conn.prepareStatement(mysql);              
} catch(SQLException e){
                e.printStackTrace();
}//catch
            
} //constructor

 public int setClass(String did,String dname){
      int result=0;
try{
       saveclass.setString(1,did);
        saveclass.setString(2,dname);
         
        result=saveclass.executeUpdate();
       // conn.commit();
} catch(SQLException e)
{  e.printStackTrace(); } //catch



return result;
}//method setschool
 } //class
    %>

    <%
      
        int r=0;
        String deptId=new String();
        String deptName=new String();
        if(request.getParameter("deptID")!=null){
        deptId=request.getParameter("deptID");
        }
        if(request.getParameter("deptName")!=null){
        deptName=request.getParameter("deptName");
        }
             
        SaveClass sc=new SaveClass();
            
        r=sc.setClass(deptId,deptName);
          
        if(r==1){
             
        out.print("<center><div id='save'> <p> Department has been added..</p></div></center>");}
        else{
        out.print("<center><div id='save' style='background-color:red;'> <p>! Please input valid data..(duplicate/null) not allowed</p></div></center>");
       
        }
    %>

</body>
<script>
    function savealert()
    {
        alert('save');
    }
    </script>
<script src="hidemsg.js"></script>
</html>
