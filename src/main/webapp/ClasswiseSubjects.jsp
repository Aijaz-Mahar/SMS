<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Selected ROW From HTML Table Using Javascript</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
</head>
<body>
<div class="container">
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">id</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Phone</th>
            <th scope="col">Address</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <tr id="row-1">
            <th scope="row">1</th>
            <td class="name">Mark</td>
            <td class="email">mark@mail.com</td>
            <td class="phone">+99-2312312311</td>
            <td class="address">New-york</td>
            <td>
                <a onclick="toggleModal(this, 1)">Edit</a>
                <a onclick="removeRow(this)">Delete</a>
            </td>
        </tr>
        <tr id="row-2">
            <th scope="row">2</th>
            <td class="name">Lara</td>
            <td class="email">lara@mail.com</td>
            <td class="phone">+99-2312312311</td>
            <td class="address">california</td>
            <td>
                <a onclick="toggleModal(this, 2)">Edit</a>
                <a onclick="removeRow(this)">Delete</a>
            </td>
        <tr id="row-3">
            <th scope="row">3</th>
            <td class="name">Josef</td>
            <td class="email">josef@mail.com</td>
            <td class="phone">+99-2312312311</td>
            <td class="address">Texas</td>
            <td>
                <a onclick="toggleModal(this, 3)">Edit</a>
                <a onclick="removeRow(this)">Delete</a>
            </td>
        </tr>
        </tbody>
    </table>
</div>
 
<!-- Creating a popup modal -->
<div class="modal" tabindex="-1" role="dialog" id="exampleModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Table</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" id="name" class="form-control">
                </div>
 
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="text" id="email" class="form-control">
                </div>
 
                <div class="form-group">
                    <label for="phone">Phone</label>
                    <input type="text" id="phone" class="form-control">
                </div>
 
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" id="address" class="form-control">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="saveInfo()">Save changes</button>
                <button type="button" class="btn btn-secondary" onclick="closeModal()">Close</button>
            </div>
        </div>
    </div>
</div>
<div class="modal-backdrop fade show" id="backdrop" style="display: none;"></div>

<script>
    let tableRowElement;
    function toggleModal(element) {
 
        tableRowElement = element.parentElement.parentElement;
        const name = tableRowElement.getElementsByClassName('name')[0].innerHTML;
        const email = tableRowElement.getElementsByClassName('email')[0].innerHTML;
        const phone = tableRowElement.getElementsByClassName('phone')[0].innerHTML;
        const address = tableRowElement.getElementsByClassName('address')[0].innerHTML;
 
        document.getElementById('name').value = name;
        document.getElementById('email').value = email;
        document.getElementById('phone').value = phone;
        document.getElementById('address').value = address;
 
        openModal();
    }
 
    function saveInfo() {
        const name = document.getElementById('name').value;
        const email = document.getElementById('email').value;
        const phone = document.getElementById('phone').value;
        const address = document.getElementById('address').value;
 
        tableRowElement.getElementsByClassName('name')[0].innerHTML=name;
        tableRowElement.getElementsByClassName('email')[0].innerHTML=email;
        tableRowElement.getElementsByClassName('phone')[0].innerHTML=phone;
        tableRowElement.getElementsByClassName('address')[0].innerHTML=address;
 
        closeModal();
    }
 
    function openModal() {
        
        document.getElementById("backdrop").style.display = "block";
        document.getElementById("exampleModal").style.display = "block";
        document.getElementById("exampleModal").classList.add("show");
    }
 
    function closeModal() {
        document.getElementById("backdrop").style.display = "none";
        document.getElementById("exampleModal").style.display = "none";
        document.getElementById("exampleModal").classList.remove("show");
    }
 
    function removeRow(current) {
        current.parentElement.parentElement.remove();
    }
</script>