
<%@ page contentType = "application/pdf" %>



<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="net.sf.jasperreports.engine.design.*"%>
<%@ page import="net.sf.jasperreports.view.*"%>
<%@ page import="com.pos.mywebapp.DbConnect" %>
<%@ page import = "java.io.FileInputStream" %>
<%@ page import = "java.io.FileNotFoundException" %>
<%@ page import = "java.io.InputStream" %>
<%@ page trimDirectiveWhitespaces = "true" %>
<%@ page import="com.pos.mywebapp.DbConnect" %>
 <%!  private static Connection conn;  %>

<%



try
{
 conn=DbConnect.getConnection();
// Loading the Jasper Report file from local file system\
JasperReport jasperReport;
    JasperPrint jasperPrint;
    Map<String, Object> param = new HashMap<String, Object>();
    try{
        String sourceFileName = "report1.jrxml";
        jasperReport = JasperCompileManager.compileReport(sourceFileName);
        jasperPrint = JasperFillManager.fillReport(jasperReport,null,conn);
        JasperExportManager.exportReportToPdfFile(jasperPrint, "report1.pdf");
    
}
catch (FileNotFoundExcecption ex)
{
System.out.println(ex.getMessage());
ex.printStakeTrace();
}
catch (JRException ex)
{
System.out.println(ex.getMessage());
ex.printStakeTrace();
}
catch (ClassNotFoundException ex)
{
System.out.println(ex.getMessage());
ex.printStakeTrace();
}
catch (SQLException ex)
{
System.out.println(ex.getMessage());
ex.printStakeTrace();
}
finally
{
if (conn != null)
{
conn.close();
}
}

%>
