
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

import java.text.SimpleDateFormat;


/**
 *
 * @author User
 */
@WebServlet(name = "AdmissionForm", urlPatterns = {"/AdmissionForm"})
@MultipartConfig(maxFileSize = 16177216)
public class AdmissionForm extends HttpServlet {

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
       PrintWriter out = response.getWriter();
              int result = 0;
             Connection con = null;
             String varAdmissionDate=new String();
             String varAdmissionFormNo=new String();
             String varSessionYear=new String();
             String varRollNo=new String();
             String varGrNo=new String();
             String varSection=new String();
             String varAdmissionClass=new String();
             String varFullName=new String();
             String varBirthDate=new String();
             String varBirthPlace=new String();
             String varGender=new String();
             String varReligion=new String();
             String varNationality=new String();
             String varFatherName=new String();
             String varFatherCnic=new String();
             String varFatherProfession=new String();
             String varMotherName=new String();
             String varMotherProfession=new String();
             String varFatherOfficeNo=new String();
             String varMotherOfficeNo=new String();
             String varMobileNo=new String();
             String varEmergencyNo=new String();
             String varHouseAddress=new String();
             String varCorrespAddress=new String();
             String varStudentCategory=new String();
             String varSibilingId=new String();
             String varLastSchool=new String();
             String varDisability=new String();
             String varPhoto=new String();
             String varLeavingCertificate=new String();
             String varBirthCertificate=new String();
             String varParentCnic=new String();
              String varAllergy=new String();            
             
             
             
            
            if(request.getParameter("addmissiondate")!=null){
             varAdmissionDate=request.getParameter("addmissiondate");
             }
              
        
   
             if(request.getParameter("addmissionformno")!=null){
             varAdmissionFormNo=request.getParameter("addmissionformno");
             }
             if(request.getParameter("sessionyear")!=null){
             varSessionYear=request.getParameter("sessionyear");
             }
             if(request.getParameter("admissionclass")!=null){
             varAdmissionClass=request.getParameter("admissionclass");
             
             }
             if(request.getParameter("rollno")!=null){
             varRollNo=request.getParameter("rollno");
             }
             if(request.getParameter("grno")!=null){
             varGrNo=request.getParameter("grno");
             }
             if(request.getParameter("fullname")!=null){
             varFullName=request.getParameter("fullname");
             }
             if(request.getParameter("birthdate")!=null){
             varBirthDate=request.getParameter("birthdate");
             
             }
   if(request.getParameter("birthplace")!=null){
             varBirthPlace=request.getParameter("birthplace");
              }
   if(request.getParameter("gender")!=null){
             varGender=request.getParameter("gender");
              }
   if(request.getParameter("religion")!=null){
             varReligion=request.getParameter("religion");         
             }
   if(request.getParameter("nationality")!=null){
             varNationality=request.getParameter("nationality");         
             }
   if(request.getParameter("fname")!=null){
             varFatherName=request.getParameter("fname");         
             }
   if(request.getParameter("fcnic")!=null){
             varFatherCnic=request.getParameter("fcnic");         
             }
   if(request.getParameter("fprofession")!=null){
             varFatherProfession=request.getParameter("fprofession");         
             }
   if(request.getParameter("mname")!=null){
             varMotherName=request.getParameter("mname");         
             }
   if(request.getParameter("mprofession")!=null){
             varMotherProfession=request.getParameter("mprofession");         
             }
   if(request.getParameter("fofficeno")!=null){
             varFatherOfficeNo=request.getParameter("fofficeno");         
             }
   if(request.getParameter("mofficeno")!=null){
             varMotherOfficeNo=request.getParameter("mofficeno");         
             }
   if(request.getParameter("mobileno")!=null){
             varMobileNo=request.getParameter("mobileno");         
             }
   if(request.getParameter("emergencyno")!=null){
             varEmergencyNo=request.getParameter("emergencyno");         
             }
   if(request.getParameter("haddress")!=null){
             varHouseAddress=request.getParameter("haddress");         
             }
   if(request.getParameter("caddress")!=null){
             varCorrespAddress=request.getParameter("caddress");         
             }
   if(request.getParameter("studentcategory")!=null){
             varStudentCategory=request.getParameter("studentcategory");         
             }
    if(request.getParameter("lastschool")!=null){
             varLastSchool=request.getParameter("lastschool");         
             }
     if(request.getParameter("disability")!=null){
             varDisability=request.getParameter("disability");         
             }
       if(request.getParameter("section")!=null){
             varSection=request.getParameter("section");
             }
      /* if(request.getParameter("allergy")!=null){
             varAllergy=request.getParameter("allergy");         
             }*/
Part StudentPhoto = request.getPart("photo");
Part LeavingCertificate = request.getPart("leavingcertificate");
Part BirthCertificate = request.getPart("birthcertificate");
Part ParentCnic = request.getPart("parentcnic");
  
        
//if(part != null){
try{

    con = DbConnect.getConnection();
    
    PreparedStatement ps = con.prepareStatement("insert into AddmissionForm(dateofadmission,admissionformno,sessionyear,"
            + "admissionclass,rollnumber,grno,fullname,birthdate,birthplace,gender,religion,nationality,fathername,fathercnic,"
            + "fatherprofession,mothername,motherprofession,fatherofficeno,motherofficeno,residenceno,mobileno,"
            + "homeaddress,corrspadddress,lastschool,categoryid,anydisability,"
            + "schoolleavecert,birthcertificate,parentcnic,studentpic)"
            + " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
  
    InputStream studentPhoto = StudentPhoto.getInputStream();
    InputStream leavingCertificate = LeavingCertificate.getInputStream();
     InputStream birthCertificate = BirthCertificate.getInputStream();
    InputStream parentCnic = ParentCnic.getInputStream();
   
    Date admdate=Date.valueOf(varAdmissionDate);
    Date brthdate=Date.valueOf(varBirthDate);
    //Date date1=(Date) new SimpleDateFormat("yyyy-mm-dd").parse(varAdmissionDate);  
  //  out.println(date);
    SimpleDateFormat formatter;
  formatter = new SimpleDateFormat("dd-MMM-yyyy");
String admissiondate = formatter.format(admdate);
String birthdate = formatter.format(brthdate);
 //Date date1=(Date) new SimpleDateFormat("dd-MMM-YYYY").parse(fd);  
    
   
    // ps.setString(1, schoolId);
             ps.setString(1,admissiondate);
             ps.setInt(2, Integer.parseInt(varAdmissionFormNo));
             ps.setString(3, varSessionYear);
             ps.setString(4,varAdmissionClass);
             ps.setInt(5,  Integer.parseInt(varRollNo));
             ps.setString(6, varGrNo);
             ps.setString(7, varFullName);
             ps.setString(8,birthdate);
             ps.setString(9, varBirthPlace);
             ps.setString(10, varGender);
             ps.setString(11, varReligion);
             ps.setString(12, varNationality);
             ps.setString(13, varFatherName);
             ps.setString(14, varFatherCnic);
             ps.setString(15, varFatherProfession);
             ps.setString(16, varMotherName);
             ps.setString(17, varMotherProfession);
             ps.setString(18, varFatherOfficeNo);
             ps.setString(19, varMotherOfficeNo);
             ps.setString(20,varEmergencyNo);
             ps.setString(21, varMobileNo);
             ps.setString(22, varHouseAddress);
             ps.setString(23, varCorrespAddress);
             ps.setString(24, varLastSchool);
             ps.setString(25, varStudentCategory);
             ps.setString(26, varDisability);
          //   ps.setString(27, varAllergy);
             ps.setBlob(27, leavingCertificate);
             
                      
                  ps.setBlob(28, birthCertificate);
                  ps.setBlob(29, parentCnic);
                  ps.setBlob(30,   studentPhoto);
              
              
              
             
   
   // ps.setString(2, schoolName);
  //  ps.setString(3, schoolAddress);
  //  ps.setString(4, schoolContact);
  //  ps.setString(5, schoolEmail);
  //  ps.setBlob(6, is);
  
    result = ps.executeUpdate();
           
     PreparedStatement student = con.prepareStatement("insert into student(grno,rollnumber,sessionyear,classid,"
             + "section,status)"
              + " values (?,?,?,?,?,?)");
     student.setString(1,varGrNo);
     student.setInt(2,  Integer.parseInt(varRollNo));
     student.setString(3, varSessionYear);
     student.setString(4,varAdmissionClass);
     student.setString(5,varSection);
     student.setString(6, "A");
    result = student.executeUpdate();
}
catch(Exception e){
    out.println(e.getMessage());
  
    out.println(e.getLocalizedMessage());
e.printStackTrace();
}
finally{
if(con != null){
try{
con.close();
}
catch(Exception e){
     out.println(e.getStackTrace());
e.printStackTrace();
}
}
}
//}
if(result > 0){
           out.println("<html><head><script>alert('Admission form data has been saved..')");
           out.println("window.open('AdmissionForm.jsp','_self');");
           out.println("</script></head></body>");   
               
          
          
         }
else{
  out.print("Not Saved...Please input valid data")  ;
//response.sendRedirect("result.jsp?message=Some+Error+Occurred");
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
