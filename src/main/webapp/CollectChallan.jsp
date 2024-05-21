<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
 <%@ page import="com.pos.mywebapp.DbConnect" %>
<!DOCTYPE html>
<html>
<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: #333;
 
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #04AA6D;
  color: white;
}
.search {
 background-color: #31b131;
  border: none;
  color: white;
  padding: 15px 15px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
  
}
</style>
<body>
   <div class="topnav">
  <a class="active" href="ChallanList.jsp">Challan List</a>
  <a href="CollectChallan.jsp">Collect Challan</a>
  <a href="ChallanForm.jsp">Generate Challan</a>
  </div>
       
    <center>
         <p style="color:white;background-color: green; width:280px; font-size: 20px;">Collect Challan</p>
         <p>Enter Challan#:
             <input type="text" id="challanno" >
             <input type="button" id="btnsearch" class="search" value="Search" onclick="showClasses(document.getElementById('challanno').value)">
       
 
         <div id="txtHint">
    
 </div>
    </center>
<script>
function showClasses(str) {
  if (str == "") {
    document.getElementById("txtHint").innerHTML = "";
    return;
  }
  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {
    document.getElementById("txtHint").innerHTML = this.responseText;
  }
  xhttp.open("GET", "ShowCollectChallan.jsp?sid="+str);
  xhttp.send();
}

 
</script>

<script>
var input = document.getElementById("challanno");
input.addEventListener("keypress", function(event) {
  if (event.key === "Enter") {
    event.preventDefault();
    document.getElementById("btnsearch").click();
  }
});
</script>
</body>
</html>
