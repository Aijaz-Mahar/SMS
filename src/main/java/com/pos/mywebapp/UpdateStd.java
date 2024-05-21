/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pos.mywebapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
//import com.pos.mywebapp.DbConnect;
import jakarta.servlet.http.Part;
import java.io.InputStream;

import java.io.PrintWriter;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateStd", urlPatterns = {"/UpdateStd"})
public class UpdateStd extends HttpServlet {

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
            out.println("<title>Servlet UpdateStd</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateStd at " + request.getContextPath() + "</h1>");
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
     //   processRequest(request, response);
      PrintWriter out = response.getWriter();
      
            int result = 0;
             Connection con = null;
             String sessionYear=new String();
             String rollNo=new String();
             String grNo=new String();
              String paragrNo=new String();
             String classId=new String();
             String section=new String();
              String fullName=new String();
              String fatherName=new String();
              String mobileNo=new String();
              String status=new String();
              String remarks=new String();          
              
                if(request.getParameter("vgrno")!=null){
             grNo=request.getParameter("vgrno");
             paragrNo=request.getParameter("paragrno");
                }
             if(request.getParameter("vsession")!=null){
             sessionYear=request.getParameter("vsession");
             
             }
             if(request.getParameter("vrollno")!=null){
             rollNo=request.getParameter("vrollno");
             }            
             if(request.getParameter("vclass")!=null){
             classId=request.getParameter("vclass");
             }            
             if(request.getParameter("vsection")!=null){
             section=request.getParameter("vsection");
              }            
             if(request.getParameter("vfullname")!=null){
             fullName=request.getParameter("vfullname");
             }            
               if(request.getParameter("vfathername")!=null){
             fatherName=request.getParameter("vfathername");
             }            
             if(request.getParameter("vmobileno")!=null){
             mobileNo=request.getParameter("vmobileno");
             }          
            if(request.getParameter("vstatus")!=null){
            status=request.getParameter("vstatus");
             }          
             if(request.getParameter("vremarks")!=null){
             remarks=request.getParameter("vremarks");
             }      
             

            // Part bankLogo = request.getPart("banklogo");
               
             
            // InputStream bLogo = bankLogo.getInputStream();
try{
    con = DbConnect.getConnection();
     PreparedStatement ps1 = con.prepareStatement("Update addmissionform set grno=?,fullname=?,fathername=?,mobileno=? where grno=?");
            
    
    ps1.setString(1, grNo);
    ps1.setString(2, fullName);
    ps1.setString(3, fatherName);
    ps1.setString(4, mobileNo);
    ps1.setString(5, paragrNo);
    
     
    
     //ps.setBlob(7, bLogo);
    // ps.setString(8, varbankId);
    result = ps1.executeUpdate();
    
    PreparedStatement ps = con.prepareStatement("Update student set grno=?,rollnumber=?,sessionyear=?,classid=?,section=?,status=?,remarks=?"
            + "where grno=?");
            
    
    ps.setString(1, grNo);
    ps.setString(2, rollNo);
    ps.setString(3, sessionYear);
    ps.setString(4, classId);
    ps.setString(5, section);
     ps.setString(6, status);
     ps.setString(7, remarks);
     ps.setString(8, paragrNo);
    
     //ps.setBlob(7, bLogo);
    // ps.setString(8, varbankId);
    result = ps.executeUpdate();
}
catch(SQLException e){
     
     out.print(e.getMessage());
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
out.print(result);
if(result > 0){
                
           // response.sendRedirect("updateSchool01.jsp");
           out.print("Student Info has been updated..");
          response.sendRedirect("StudentList.jsp");
              
    }
//else{
//response.sendRedirect("result.jsp?message=Some+Error+Occurred");
//}
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
