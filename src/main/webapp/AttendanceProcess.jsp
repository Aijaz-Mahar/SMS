<%@page import="java.sql.*"%>
<%@ page import="com.pos.mywebapp.DbConnect" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.*"%> 
 <%!  String vattendancedate;  %>
<%
    
String adate=request.getParameter("attdate");
String sid=request.getParameter("sessionid");
String cid=request.getParameter("classid");
String section=request.getParameter("sectionid");
Date atdate=Date.valueOf(adate);
 SimpleDateFormat formatter;
 formatter = new SimpleDateFormat("dd-MMM-yy");
 vattendancedate = formatter.format(atdate);
 out.println(vattendancedate);
String grno[]=request.getParameterValues("grno");
String status[]=request.getParameterValues("status");
String remarks[]=request.getParameterValues("remarks");
    try{
       
   Connection con = DbConnect.getConnection();
   Statement st=con.createStatement();
    int r=0;
for(int i=0;i<grno.length;i++)
{
out.println(vattendancedate+" "+grno[i]+" " +cid+" "+section+" "+sid+" "+status[i]+" "+remarks[i]);

//choosesports+=sports[i]+" ";
 r=st.executeUpdate("insert into attendance(attendancedate,grno,classid,section,sessionyear,status,remarks) values('"+vattendancedate+"','"+grno[i]+"','"+cid+"','"+section+"','"+sid+"','"+status[i]+"','"+remarks[i]+"')");
    }
    out.print(r);
       if(r>0)    
       {out.println("Attendance saved for:"+cid+" "+section);
        //response.sendRedirect("AddMarks.jsp");
        }
       
        }
        catch(Exception e){
        e.getMessage();
        e.printStackTrace();
        
        }
%>