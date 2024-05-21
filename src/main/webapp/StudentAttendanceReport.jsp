
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
String pdatefrom,pdateto;
String sessionid=request.getParameter("sessionid");
String classid=request.getParameter("classid");
String sectionid=request.getParameter("sectionid");
String grno=request.getParameter("grno");
String datefrom=request.getParameter("datefromp");
String dateto=request.getParameter("datetop");
//out.print(prin//Loading Jasper Report File from Local file system


Date vdatefrom=Date.valueOf(datefrom);
 Date vdateto=Date.valueOf(dateto);
 SimpleDateFormat formatter;
 formatter = new SimpleDateFormat("dd-MMM-yyyy");
 pdatefrom = formatter.format(vdatefrom);
 pdateto = formatter.format(vdateto);
      // String jrxmlFile = session.getServletContext().getRealPath(request.getContextPath())+"\report1.jrxml";
        String jrxmlFile = application.getRealPath("/reports/StudentAttendance.jrxml");        
       // out.print(jrxmlFile);
       InputStream input = new FileInputStream(new File(jrxmlFile));
       
       HashMap param=new HashMap();
       param.put("psession",sessionid);
       param.put("pclass",classid);
       param.put("psection",sectionid);
       param.put("pgrno",grno);
       param.put("pdatefrom",pdatefrom);
       param.put("pdateto",pdateto);
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


