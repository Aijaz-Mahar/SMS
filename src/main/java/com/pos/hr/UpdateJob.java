/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pos.hr;

import com.pos.mywebapp.*;
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
@WebServlet(name = "UpdateJob", urlPatterns = {"/hrm/UpdateJob"})
public class UpdateJob extends HttpServlet {

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
             String jobId=new String();
             String designation=new String();
             String bps=new String();
            String pjobid=new String();
             
             if(request.getParameter("parajobid")!=null){
             pjobid=request.getParameter("parajobid");}
             
             if(request.getParameter("edjobid")!=null){
             jobId=request.getParameter("edjobid");
             }
             if(request.getParameter("eddesignation")!=null){
             designation=request.getParameter("eddesignation");
             }            
             if(request.getParameter("edbps")!=null){
             bps=request.getParameter("edbps");
             }            
try{
    con = DbConnect.getConnection();
    
    PreparedStatement ps = con.prepareStatement("update jobs set jobid=?,designation=?,bps=? where jobid=?");
    
    ps.setString(1, jobId.toUpperCase());
    ps.setString(2, designation);
    ps.setString(3, bps);
     ps.setString(4, pjobid);
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
           out.println("<html><head><script>alert('JOB Updated...')");
           out.println("window.open('AddJob.jsp','_self');");
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
