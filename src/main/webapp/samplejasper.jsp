
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page contentType="application/pdf" %>
<%-- 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
--%>

<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="net.sf.jasperreports.engine.export.*" %>

<%@ page import="java.util.*" %>
 <%@ page import="java.sql.*" %>
 
 <%@ page import="java.io.InputStream" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="com.pos.mywebapp.DbConnect" %>
<html>
 <%! private static Connection conn;  %>
<%
try{

  conn=DbConnect.getConnection();

String cid=request.getParameter("cid");
String mid=request.getParameter("mid");
String yid=request.getParameter("yid");
String grid=request.getParameter("admid");
//String cid="I";
//out.print(prin//Loading Jasper Report File from Local file system
//out.println(cid);
//out.println(mid);
//out.println(yid);
      // String jrxmlFile = session.getServletContext().getRealPath(request.getContextPath())+"\report1.jrxml";
        String jrxmlFile = application.getRealPath("/reports/PrintChallan1.jrxml");
       String jrxmlFile2 = application.getRealPath("/reports/PrintChallan1.jasper");
       // out.print(jrxmlFile);
       
       InputStream input = new FileInputStream(new File(jrxmlFile));
       
     
       
       //HashMap param=new HashMap();
        Map<String, Object> param = new HashMap<String, Object>();
       param.put("pclass",cid);
       param.put("pmonth",mid);
       param.put("pyear",yid);
       
     
   
        //Generating the report
        JasperReport jasperReport = JasperCompileManager.compileReport(input);
      JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,param, conn);

        
        //Exporting the report as a PDF

       JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
       response.getOutputStream().flush();
       response.getOutputStream().close();

    } catch (FileNotFoundException e) {
        e.printStackTrace();
        e.getMessage();
    }
    catch (JRException e) {
        e.printStackTrace();
        
    } 
    
    finally {
        if(conn!=null){
            conn.close();
        }
    }
%>


