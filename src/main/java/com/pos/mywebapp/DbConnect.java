package com.pos.mywebapp;
import java.sql.*;


/**
 *
 * @author User
 */
public class DbConnect {
     private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static Connection conn;
    
    public static Connection getConnection() {

        try {

            Class.forName(DRIVER);

            try {

                conn = DriverManager.getConnection(URL,"sms","sms123");

            } catch (SQLException ex) {

                // log an exception. fro example:
                ex.printStackTrace();
                System.out.println("Failed to create the database connection."); 

            }

        } catch (ClassNotFoundException ex) {

            // log an exception. for example:

            System.out.println("Driver not found."); 

        }

        return conn;

    }
    
}
