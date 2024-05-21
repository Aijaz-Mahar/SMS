<%@page import="java.sql.*"%>
<%@ page import="com.pos.mywebapp.DbConnect" %>
<%@page import="java.io.*"%> 
<%
String sid=request.getParameter("sessionid");
String cid=request.getParameter("classid");
String eid=request.getParameter("examid");
String subjid=request.getParameter("subjectid");
String grno[]=request.getParameterValues("grno");
String obtmarks[]=request.getParameterValues("obtmarks");

    try{
       
   Connection con = DbConnect.getConnection();
   Statement st=con.createStatement();
    int r=0;
for(int i=0;i<grno.length;i++)
{
//out.println("grno:"+grno[i] +cid+subjid+obtmarks[i]+sid+eid);
Double obmarks=Double.valueOf(obtmarks[i]);
out.println(obmarks);
//choosesports+=sports[i]+" ";
 r=st.executeUpdate("insert into marks(grno,classid,sessionyear,examid,subjectid,obtainmarks) values('"+grno[i]+"','"+cid+"','"+sid+"','"+eid+"','"+subjid+"','"+obmarks+"')");
    }
    out.print(r);
       if(r>0)    
       {out.println("Marks saved for:"+subjid);
        response.sendRedirect("AddMarks.jsp");
        }
       
        }
        catch(Exception e){
        e.getMessage();
        e.printStackTrace();
        
        }
%>