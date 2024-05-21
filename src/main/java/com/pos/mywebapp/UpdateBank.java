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
@WebServlet(name = "UpdateBank", urlPatterns = {"/UpdateBank"})
@MultipartConfig(maxFileSize = 16177216)
public class UpdateBank extends HttpServlet {

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
             String bankId=new String();
             String bankName=new String();
             String branchName=new String();
             String bankAccount=new String();
             String bankAddress=new String();
              String bankContact=new String();
              String varbankId=new String();
                        
             if(request.getParameter("edbankid")!=null){
             bankId=request.getParameter("edbankid");
             varbankId=request.getParameter("parabankid");
             }
             if(request.getParameter("edbankname")!=null){
             bankName=request.getParameter("edbankname");
             }            
             if(request.getParameter("edbranchname")!=null){
             branchName=request.getParameter("edbranchname");
             }            
             if(request.getParameter("edbankaccount")!=null){
             bankAccount=request.getParameter("edbankaccount");
              }            
             if(request.getParameter("edbankaddress")!=null){
             bankAddress=request.getParameter("edbankaddress");
             }            
             if(request.getParameter("edbankcontact")!=null){
             bankContact=request.getParameter("edbankcontact");
             }      
             

             Part bankLogo = request.getPart("banklogo");
               
             
             InputStream bLogo = bankLogo.getInputStream();
try{
    con = DbConnect.getConnection();
    
    PreparedStatement ps = con.prepareStatement("Update bank set bankid=?,bankname=?,branchname=?,bankaccount=?,bankaddress=?,"
            + "contactno=?,banklogo=? where bankid=?");
            
    
    ps.setString(1, bankId);
    ps.setString(2, bankName);
    ps.setString(3, branchName);
    ps.setString(4, bankAccount);
    ps.setString(5, bankAddress);
     ps.setString(6, bankContact);
    
     ps.setBlob(7, bLogo);
     ps.setString(8, varbankId);
    result = ps.executeUpdate();
}
catch(Exception e){
     out.print(e.getCause());
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

if(result > 0){
           out.println("<html><head><script>alert('Bank Info: Updated..')");
           out.println("window.open('Bank.jsp','_self');");
           out.println("</script></head></body>");  
           
           
           //response.sendRedirect("Bank.jsp");
              
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
