/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pos.mywebapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.JasperCompileManager;
import java.sql.*;
//import com.pos.mywebapp.DbConnect;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;

import java.io.PrintWriter;
import java.io.StringWriter;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.*;

import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
//import com.pos.mywebapp.DbConnect;

@WebServlet(name = "myReport", urlPatterns = {"/myReport"})
@MultipartConfig(maxFileSize = 16177216)
public class myReport extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // response.setContentType("text/html;charset=UTF-8");
      
    
             
                  
Connection conn = DbConnect.getConnection();
 ServletOutputStream servletOutputStream = response.getOutputStream();
 
   String reportFileName ="d://report1.jasper";
   // PrintWriter out = response.getWriter();
  // out.println(reportFileName);
   File reportFile = new File(reportFileName);
 
   //String idAnagRicevuto= request.getParameter("comboId");
   // Long idAnagParam=Long.parseLong(idAnagRicevuto);
 
   Map parameters = new HashMap();
  /* Long param = xxx
   parameters.put("paramName", new Long(param));*/
 
 
    byte[] bytes = null;
 
    try
    {
      bytes = JasperRunManager.runReportToPdf(reportFile.getPath(),null,conn);
 
      response.setContentType("application/pdf");
      response.setContentLength(bytes.length);
 
      servletOutputStream.write(bytes, 0, bytes.length);
      servletOutputStream.flush();
      servletOutputStream.close();
    }catch (JRException e)
    {
      // display stack trace in the browser
      StringWriter stringWriter = new StringWriter();
      PrintWriter printWriter = new PrintWriter(stringWriter);
      e.printStackTrace(printWriter);
      response.setContentType("text/plain");
      response.getOutputStream().print(stringWriter.toString());
    }
        // TODO Auto-generated catch block
        // TODO Auto-generated catch block

      }
   

    
    
    
   @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
}