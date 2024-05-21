<%@page import="java.sql.*"%>
<%@ page import="com.pos.mywebapp.DbConnect" %>
<%@page import="java.io.*"%> 
<%
String choosesports="";
String sports[]=request.getParameterValues("sports");

    try{
       
        Connection con = DbConnect.getConnection();
        Statement st=con.createStatement();
    
for(int i=0;i<sports.length;i++)
{
out.println("bb:"+sports[i]);
    //choosesports+=sports[i]+" ";


        int r=st.executeUpdate("insert into sports_details(choosesports) values('"+sports[i]+"')");
     
    }
    
       out.println("Data is successfully inserted into database.");
        }
        catch(Exception e){
        System.out.println(e);
        }
%>