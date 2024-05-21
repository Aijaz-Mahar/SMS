/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pos.mywebapp;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author User
 */
public class test {
    private static Connection conn;
    public static void main(String[] args) throws SQLException, ClassNotFoundException  {
   //  String driver = "org.apache.derby.jdbc.EmbeddedDriver";
    //String URL = "jdbc:derby:d://mydb;user=aa;password=aa";
    
    // String driver = "org.apache.derby.jdbc.ClientDriver";
//             String URL = "jdbc:derby://localhost:1527/sample";
  //  Class.forName("org.apache.derby.jdbc.ClientDriver");
    
 //   Connection conn=DriverManager.getConnection(URL);
    
 
    //String sql="insert into aa.course(courseBO,course_name) values('17','new course')";
   conn=DbConnect.getConnection();
  System.out.println("connected");
  Statement st1=conn.createStatement();
  /* int r=st1.executeUpdate(sql);
   if (r>0) 
          {System.out.println("row added");
           }*/
    String sqlselect="select coursename from course";
     ResultSet rs=st1.executeQuery(sqlselect);
      while (rs.next()) {
      try{  String cName = rs.getString("coursename");
       // int supplierID = rs.getInt("SUP_ID");
        //float price = rs.getFloat("PRICE");
        //int sales = rs.getInt("SALES");
        //int total = rs.getInt("TOTAL");
        System.out.println(cName);
      }
     catch (SQLException e) {
      
    }
       
      }
      
    }
    
}
    
