
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
import java.text.SimpleDateFormat;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CollectChallan", urlPatterns = {"/CollectChallan"})
public class CollectChallan extends HttpServlet {

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
            out.println("<title>Servlet AddSubject</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddSubject at " + request.getContextPath() + "</h1>");
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
      
            int result = 0,result2=0;
             Connection con = null;
             String varchallanId=new String();
             String vardepositDate =new String();
             String varGrNo=new String();
             String varTdate=new String();
             String varDescription=new String();
             String varRef=new String();
             String varDebit=new String();
             String varCredit=new String();
                                                   
             if(request.getParameter("challanid")!=null){
             varchallanId=request.getParameter("challanid");
             }
             if(request.getParameter("depositdate")!=null){
             vardepositDate=request.getParameter("depositdate");
             }     
             
             Date dpdate=Date.valueOf(vardepositDate);
    
    
    SimpleDateFormat formatter;
  formatter = new SimpleDateFormat("dd-MMM-yyyy");
String depositdate = formatter.format(dpdate);
int fr=0;
try{
    con = DbConnect.getConnection();
    
    PreparedStatement ps = con.prepareStatement("update masterchallan set depositdate=?,status='paid' where challanid=?");
    ps.setString(1, depositdate);
    ps.setString(2, varchallanId);  
    result = ps.executeUpdate();
    
    
     Statement stfeesrecord=con.createStatement();
    fr= stfeesrecord.executeUpdate("insert into feesrecord(tdate,challanid,grno,description,credit,yearof) select sysdate,challanid,grno,'Fees collected of '||monthof||'-'||yearof as monthof,sum(amount) as amount,yearof from masterchallan where challanid='"+varchallanId+"' and status='paid' group by challanid,grno,yearof,monthof");
   

/*if(result==1)
     {
    PreparedStatement pscr = con.prepareStatement("insert into feesrecord (tdate,challanid,grno,description,credit) "
            + "select sysdate,challanid,grno,'Fees collected of '||monthof||'-'||yearof as monthof,sum(amount) as amount from masterchallan "
                    + " where challanid=? and status=?  group by challanid,grno,monthof,yearof");
    pscr.setString(1, varchallanId);
    pscr.setString(2, "paid");  
    result2 = pscr.executeUpdate();
    con.commit();
}*/
}
catch(Exception e){
e.printStackTrace();
e.getMessage();
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

if(fr > 0){
                
           // response.sendRedirect("updateSchool01.jsp");
           out.print("Challan has been collected...");
           response.sendRedirect("CollectChallan.jsp");
              
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
