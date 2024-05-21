
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
@WebServlet(name = "UpdateSubject", urlPatterns = {"/UpdateSubject"})
public class UpdateSubject extends HttpServlet {

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
            out.println("<title>Servlet UpdateSubject</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateSubject at " + request.getContextPath() + "</h1>");
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
             String subjectId=new String();
             String subjectName=new String();
            String psubjectid=new String();
             String subjectMarks=new String();
             
             if(request.getParameter("parasubjectid")!=null){
             psubjectid=request.getParameter("parasubjectid");}
             
             if(request.getParameter("edsubjectid")!=null){
             subjectId=request.getParameter("edsubjectid");
             }
             if(request.getParameter("edsubjectname")!=null){
             subjectName=request.getParameter("edsubjectname");
             }            
               if(request.getParameter("edsubjectmarks")!=null){
             subjectMarks=request.getParameter("edsubjectmarks");
             }            
try{
    con = DbConnect.getConnection();
    
    PreparedStatement ps = con.prepareStatement("update subjects set subjectid=?,subjectname=?,totalmarks=? where subjectid=?");
    
    ps.setString(1, subjectId);
    ps.setString(2, subjectName);
    ps.setString(3, subjectMarks);
     ps.setString(4, psubjectid);
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
           out.println("<html><head><script>alert('Subject Updated...')");
           out.println("window.open('SubjectList.jsp','_self');");
           out.println("</script></head></body>");   
           
           
           //response.sendRedirect("SubjectList.jsp");
              
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
