<%@page import="java.sql.*"%>
<%@ page import="com.pos.mywebapp.DbConnect" %>
<%@page import="java.io.*"%> 
<%

String subjects[]=request.getParameterValues("chksubjectid");
String subjectmarks[]=request.getParameterValues("vsubjectmarks");
String cid=request.getParameter("cid");





    try{
       
        Connection con = DbConnect.getConnection();
        Statement st=con.createStatement();
    int r=0;
    
for(int i=0;i<subjects.length;i++)
{
   if(subjectmarks[i]!=null)
   out.println(subjectmarks[i]);  
    //choosesports+=sports[i]+" ";
    r=st.executeUpdate("insert into classsubjects(classid,subjectid,totalmarks) values('"+cid+"','"+subjects[i]+"','"+subjectmarks[i]+"')");
    }
  
       if(r>0)    
       {
        out.println("<html><head><script>alert('Subjects Assigned..')");
           out.println("window.open('AddClassSubjects.jsp','_self');");
            out.println("</script></head</body>");
            
       
       // response.sendRedirect("AddClassSubjects.jsp");
        }
       
        }
        catch(Exception e){
        System.out.println(e);
        out.print(e);
        }
%>