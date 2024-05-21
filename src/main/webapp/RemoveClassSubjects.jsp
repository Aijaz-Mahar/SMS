<%@page import="java.sql.*"%>
<%@ page import="com.pos.mywebapp.DbConnect" %>
<%@page import="java.io.*"%> 
<%
String choosesports="";
String subjects[]=request.getParameterValues("chksubjectid");
String cid=request.getParameter("cid");
   // out.println(cid);
    try{
       
        Connection con = DbConnect.getConnection();
        Statement st=con.createStatement();
    int r=0;
for(int i=0;i<subjects.length;i++)
{
//out.println("bb:"+subjects[i]);
    //choosesports+=sports[i]+" ";


         r=st.executeUpdate("delete from classsubjects where subjectid='"+subjects[i]+"' and classid='"+cid+"'");
     
    }
       if(r>0)    
       {
        out.println("Subjects from class have been removed:"+cid);
        response.sendRedirect("SelectClass.jsp");
        }
       
        }
        catch(Exception e){
        System.out.println(e);
        }
%>
