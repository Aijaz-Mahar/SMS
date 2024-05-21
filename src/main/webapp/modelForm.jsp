<%-- 
    Document   : modelForm
    Created on : May 16, 2023, 6:06:46 PM
    Author     : User
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Trigger/Open The Modal -->
<html>
<head>
  <link rel="stylesheet" href="modelFormStyle.css">
  
</head>

<body>
<centerd>
    
      <button id="myBtn" style="width:150px">Open Modal</button>
      
<!-- The Modal -->
<div id="myModal" class="modal">
<div class="modal-content">
  <div class="modal-header">
    <span class="close">&times;</span>
    
    <p>Adding School Information</p>
  </div>
  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <p>Some text in the Modal..</p>
    <p>Some text in the Modal..</p><p>Some text in the Modal..</p>
    <p>Some text in the Modal..</p><p>Some text in the Modal..</p>
    <p>Some text in the Modal..</p>
    <p>Some text in the Modal..</p><p>Some text in the Modal..</p>
    <p>Some text in the Modal..</p>
    <p>Some text in the Modal..</p>
    <div class="clearfix">
        <button type="button" class="cancelbtn" onclick="closeForm()">Cancel</button>
        <button type="button" class="deletebtn">Delete</button>
      </div>
  </div>

</div>
    </centerd>
<script>
    // Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");
var btncancel = document.getElementById("cancelbtn");
// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modal
btn.onclick = function() {
  modal.style.display = "block";
};

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
};

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target === modal) {
    modal.style.display = "none";
  }
 
};

function closeForm() {
  document.getElementById("myModal").style.display = "none";
}
</script>

</body>
</html>