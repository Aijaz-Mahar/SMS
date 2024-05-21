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
@WebServlet(name = "UpdateDept", urlPatterns = {"/UpdateDept"})
public class UpdateDept extends HttpServlet {

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
            out.println("<title>Servlet UpdateDept</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateDept at " + request.getContextPath() + "</h1>");
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
             String deptId=new String();
             String deptName=new String();
            String pdeptid=new String();
             
             if(request.getParameter("paradeptid")!=null){
             pdeptid=request.getParameter("paradeptid");}
             
             if(request.getParameter("eddeptid")!=null){
             deptId=request.getParameter("eddeptid");
             }
             if(request.getParameter("eddeptname")!=null){
             deptName=request.getParameter("eddeptname");
             }            
try{
    con = DbConnect.getConnection();
    
    PreparedStatement ps = con.prepareStatement("update department set deptid=?,deptname=? where deptid=?");
    
    ps.setString(1, deptId.toUpperCase());
    ps.setString(2, deptName);
     ps.setString(3, pdeptid);
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
//out.print(result);

if(result > 0){
           out.println("<html><head><script>alert('Dept Updated...')");
           out.println("window.open('DeptList.jsp','_self');");
            out.println("</script></head</body>");
            
            out.println("</html>");

           // response.sendRedirect("updateSchool01.jsp");
        //   out.print("Department Updated..");
           //response.sendRedirect("DeptList.jsp");
              
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
