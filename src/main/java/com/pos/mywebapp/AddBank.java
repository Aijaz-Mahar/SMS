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

import java.sql.*;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddBank", urlPatterns = {"/AddBank"})
@MultipartConfig(maxFileSize = 16177216)
public class AddBank extends HttpServlet {

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
                       
                        
             if(request.getParameter("bankid")!=null){
             bankId=request.getParameter("bankid");
             }
             if(request.getParameter("bankname")!=null){
             bankName=request.getParameter("bankname");
             }            
             if(request.getParameter("branchname")!=null){
             branchName=request.getParameter("branchname");
             }            
             if(request.getParameter("bankaccount")!=null){
             bankAccount=request.getParameter("bankaccount");
              }            
             if(request.getParameter("bankaddress")!=null){
             bankAddress=request.getParameter("bankaddress");
             }            
             if(request.getParameter("bankcontact")!=null){
             bankContact=request.getParameter("bankcontact");
             }            
             Part bankLogo = request.getPart("banklogo");
             
             InputStream bLogo = bankLogo.getInputStream();
try{
    con = DbConnect.getConnection();
    
    PreparedStatement ps = con.prepareStatement("insert into bank(bankid,bankname,branchname,bankaccount,bankaddress,contactno,banklogo)"
            + " values(?,?,?,?,?,?,?)");
    
    ps.setString(1, bankId);
    ps.setString(2, bankName);
    ps.setString(3, branchName);
    ps.setString(4, bankAccount);
    ps.setString(5, bankAddress);
     ps.setString(6, bankContact);
    
     ps.setBlob(7, bLogo);
     
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
           out.println("<html><head><script>alert('Bank has been added')");
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
