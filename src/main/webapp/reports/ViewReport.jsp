



<%@ page trimDirectiveWhitespaces="true"%>

  <%@ page import="com.pos.mywebapp.DbConnect" %>
 
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


//out.print(prin//Loading Jasper Report File from Local file system

        //String jrxmlFile = session.getServletContext().getRealPath(request.getContextPath())+"\\reports\\report1.jrxml";
        String jrxmlFile = "d:\report1.jrxml";        
        out.print(jrxmlFile);
       InputStream input = new FileInputStream(new File(jrxmlFile));

        //Generating the report

        JasperReport jasperReport = JasperCompileManager.compileReport(input);
       JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, conn);

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
        e.getMessage();
        e.getCause();
    } 
    
    finally {
        if(conn!=null){
            conn.close();
        }
    }
%>


