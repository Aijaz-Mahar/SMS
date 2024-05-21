
package com.pos.mywebapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
//import com.pos.mywebapp.DbConnect;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import static java.lang.System.out;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
/**
 *
 * @author User
 */
@WebServlet(name = "UpdateSchool", urlPatterns = {"/UpdateSchool"})
@MultipartConfig(maxFileSize = 16177216)
public class UpdateSchool extends HttpServlet {

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
            out.println("<title>Servlet UpdateSchool</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateSchool at " + request.getContextPath() + "</h1>");
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
      //  processRequest(request, response);
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
       // processRequest(request, response);
       
              int result = 0;
             Connection con = null;
             String schoolId=new String();
             String schoolName=new String();
             String schoolAddress=new String();
             String schoolContact=new String();
             String schoolEmail=new String();
             if(request.getParameter("schoolID")!=null){
             schoolId=request.getParameter("schoolID");
             }
             if(request.getParameter("schoolName")!=null){
             schoolName=request.getParameter("schoolName");
             }
             if(request.getParameter("schoolAddress")!=null){
             schoolAddress=request.getParameter("schoolAddress");
             }
             if(request.getParameter("schoolPhone")!=null){
             schoolContact=request.getParameter("schoolPhone");
             
             }
             if(request.getParameter("schoolEmail")!=null){
             schoolEmail=request.getParameter("schoolEmail");
             }
   
Part part = request.getPart("logo");
 
if(part != null){
try{

    con = DbConnect.getConnection();
    
    PreparedStatement ps = con.prepareStatement("UPDATE school SET schoolid=?,schoolname=?,address=?,contactno=?,email=?,logo=?");
    InputStream is = part.getInputStream();
    ps.setString(1, schoolId);
    ps.setString(2, schoolName);
    ps.setString(3, schoolAddress);
    ps.setString(4, schoolContact);
    ps.setString(5, schoolEmail);
    ps.setBlob(6, is);
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
}
if(result > 0){
               
                
                
          // response.sendRedirect("updateSchool01.jsp");
           response.sendRedirect("result.jsp?message=image+uploaded");
            
             
       
     
    }
else{
response.sendRedirect("result.jsp?message=Some+Error+Occurred");
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
