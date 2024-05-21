<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
 <%@ page import="com.pos.mywebapp.DbConnect" %>
<%   
String userid=request.getParameter("userid"); 
//session.putValue("userid",userid); 
String password=request.getParameter("password"); 
Connection con=DbConnect.getConnection();
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select userid,userpass from schoolusers where userid='"+userid+"' and userpass='"+password+"'"); 
try{
 rs.next();
 //out.println(userid);
// out.println(password);
      if(rs.getString("userpass").equals(password)&&rs.getString("userid").equals(userid)) 
	{ 
        response.sendRedirect("maintest2.jsp?user="+userid);
        %>
        <%--
<jsp:include page="maintest.jsp"></jsp:include> --%>
        <%
          // out.println("Welcome "  +userid); 
		} 
		else{
	 out.println("Invalid password or username.");
		    }
}
catch (Exception e) {
e.printStackTrace();
}
%>