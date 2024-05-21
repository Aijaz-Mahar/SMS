/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pos.mywebapp;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
/**
 *
 * @author Admin
 */
@WebServlet(name = "AddSection", urlPatterns = {"/AddSection"})
public class AddSection extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddClass</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddClass at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //  processRequest(request, response);
      PrintWriter out = response.getWriter();
      
            int result = 0;
             Connection con = null;
             String sectionId=new String();
             String sectionName=new String();
             
                         
             if(request.getParameter("vsectionid")!=null){
             sectionId=request.getParameter("vsectionid");
             }
             if(request.getParameter("vsectionname")!=null){
             sectionName=request.getParameter("vsectionname");
             }            
try{
    con = DbConnect.getConnection();
    
    PreparedStatement ps = con.prepareStatement("insert into sections(sectionid,sectionname) values(?,?)");
    
    ps.setString(1, sectionId.toUpperCase());
    ps.setString(2, sectionName);
    
    result = ps.executeUpdate();
}
catch(Exception e){
e.printStackTrace();
}
finally{
if(con != null){
try{
con.close();
}
catch(Exception e){
e.printStackTrace();
}
}
}

if(result > 0){
                out.println("<html><head><script>alert('Section has been added')");
           out.println("window.open('SectionList.jsp','_self');");
           out.println("</script></head></body>");
            
            out.println("</html>"); 
           // response.sendRedirect("updateSchool01.jsp");
           
          // response.sendRedirect("SectionList.jsp");    
    }
    }


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}