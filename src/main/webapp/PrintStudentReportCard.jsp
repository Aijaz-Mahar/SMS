
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page contentType="application/pdf" %>
<%-- 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
--%>

<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="net.sf.jasperreports.engine.export.*" %>



<%@ page import="java.text.SimpleDateFormat"%>
 <%@ page import="java.sql.*" %>
 <%@ page import="java.util.HashMap" %>
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

String vsession=request.getParameter("sessionid");
String vclass=request.getParameter("classid");
String vgrno=request.getParameter("grno");

//out.print(prin//Loading Jasper Report File from Local file system

      // String jrxmlFile = session.getServletContext().getRealPath(request.getContextPath())+"\report1.jrxml";
        String jrxmlFile = application.getRealPath("/reports/ReportCard.jrxml");        
       // out.print(jrxmlFile);
       InputStream input = new FileInputStream(new File(jrxmlFile));
       
       HashMap param=new HashMap();
       param.put("psession",vsession);
       param.put("pclass",vclass);
       param.put("pgrno",vgrno);
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



