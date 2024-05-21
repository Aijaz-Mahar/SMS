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
@WebServlet(name = "UpdateFeesType", urlPatterns = {"/UpdateFeesType"})
public class UpdateFeesType extends HttpServlet {

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
            out.println("<title>Servlet AddStudentCat</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddStudentCat at " + request.getContextPath() + "</h1>");
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
       // processRequest(request, response);
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
             String feesId=new String();
             String feesName=new String();
            String pfeesid=new String();
             
             if(request.getParameter("parafeesid")!=null){
             pfeesid=request.getParameter("parafeesid");}
             
             if(request.getParameter("edfeesid")!=null){
             feesId=request.getParameter("edfeesid");
             }
             if(request.getParameter("edfeesname")!=null){
             feesName=request.getParameter("edfeesname");
             }            
try{
    con = DbConnect.getConnection();
    
    PreparedStatement ps = con.prepareStatement("update feestype set feesid=?,feesname=? where feesid=?");
    
    ps.setString(1, feesId);
    ps.setString(2, feesName);
     ps.setString(3, pfeesid);
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
           out.println("<html><head><script>alert('Fees type updated..')");
           out.println("window.open('FeesType.jsp','_self');");
           out.println("</script></head</body>");       
           
           
           //response.sendRedirect("FeesType.jsp");
              
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
