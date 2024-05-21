<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="com.pos.mywebapp.DbConnect" %>
<%@page import="java.io.*"%> 

<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="\localcss\bootstrap.min.css">
  <script src="\localjs\jquery-3.7.0.min.js"></script>
  <script src="\localjs\bootstrap.min.js"></script>
  
</head>
<body>

<div class="container">
  <h2>Activate Modal with JavaScript</h2>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" id="myBtn">Open Modal</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
            <%--
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            --%>
          <h4 class="modal-title"> Adding Student Category</h4>
        </div>
        <div class="modal-body">
            <p>
            <form name="catform" id="catform1" class="catform" method="post" action="AddStudentCat">
                    Category ID:<br>
                <input type=""text" id="stdcatid" name="stdcatid">
                <br>
                Description:<br>
                <input type=""text" id="stdcatname" name="stdcatname" size="40">
            </p>
             <input style="font-weight: bold;font-size:20px;height:30px;width:60px;" type='submit' value="Save" name='save'/>
                </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

<script>
$(document).ready(function(){
  $("#myBtn").click(function(){
    $("#myModal").modal();
  });
});
</script>


</body>
</html>
