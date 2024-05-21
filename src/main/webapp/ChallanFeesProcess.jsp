<%@page import="java.sql.*"%>
<%@ page import="com.pos.mywebapp.DbConnect" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.*"%> 

<%

String feesid[]=request.getParameterValues("chksubjectid");
String cid=request.getParameter("cid");
String sid=request.getParameter("sid");
String mid=request.getParameter("mid");
String yid=request.getParameter("yid");
String isdate=request.getParameter("issuedate");
String dudate=request.getParameter("duedate");

String bid=request.getParameter("bankid");
//out.println(isdate+"--"+dudate);
 //Date myissuedate=Date.valueOf(isdate);

 
//out.println(cid);
    try{
       
        Connection con = DbConnect.getConnection();
        Statement st=con.createStatement();
          Statement stdel=con.createStatement();
         int d;
        d=stdel.executeUpdate("delete from challan");
        
    int r=0,mc=0,fr;
for(int i=0;i<feesid.length;i++)
{
//out.println("bb:"+feesid[i]);
    //choosesports+=sports[i]+" ";
   r=st.executeUpdate("insert into challan(bankid,months,years,classid,sessionyear,feesid) values('"+bid+"','"+mid+"','"+yid+"','"+cid+"','"+sid+"','"+feesid[i]+"')");
     
    }
    
    //out.print(r );
       if(r>0)    
       {
        Statement masterchallan=con.createStatement();
        mc=masterchallan.executeUpdate("insert into masterchallan (challanid,grno,feesid,classid,amount,categoryid,monthof,yearof,issuedate,duedate,sessionyear,bankid) "
        + "select TO_CHAR(TO_DATE(C.MONTHS,'MM'),'MM')||c.years||s.grno,s.grno,f.feesid,s.classid,f.amount,s.categoryid,c.months,c.years,'"+isdate+"','"+dudate+"','"+sid+"','"+bid+"' from student s,feesStructure f,challan c"
        + " where s.categoryid=f.categoryid and f.feesid=c.feesid and  f.classid=c.classid and s.classid='"+cid+"' order by s.grno ");
      // con.commit();
       // out.print("mID="+mid);
      // out.print("heloooo");
        Statement stfeesrecord=con.createStatement();
        fr=stfeesrecord.executeUpdate("insert into feesrecord (tdate,challanid,grno,description,debit,ref,yearof)"
        + "select sysdate,challanid,grno,'Fees dues of '||monthof||'-'||yearof as monthof,sum(amount),monthof,yearof from masterchallan "
        + " where classid='"+cid+"' and monthof='"+mid+"' and yearof='"+yid+"'  group by challanid,grno,monthof,yearof");

        
          
    response.sendRedirect("PrintChallan.jsp?cid="+cid+"&mid="+mid+"&yid="+yid);
    
        }
       
        }
       catch(Exception e){
       e.printStackTrace();
        System.out.println(e);
        out.print(e);
        }
        
%>

       