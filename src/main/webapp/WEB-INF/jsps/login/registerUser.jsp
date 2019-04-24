<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
<html lang="en">
<head>
<title>Register User</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
    .bs-example{
        margin: 20px;        
    }
</style>
</head>
<body>
<div class= "form-group">
          	<h2>  &nbsp;&nbsp; User Registration : </h2>
</div>

<div class="bs-example">
    <form action="registerUser" method="post">
        <div class="form-group">
            <label for="firstName">First Name </label>
            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="name" required>
            <div class="invalid-feedback">Please enter a valid name.</div>
        </div>
        <div class="form-group">
            <label for="lastName">Last Name </label>
            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="lastName" required>
            <div class="invalid-feedback">Please enter a valid name.</div>
        </div>
        <div class="form-group">
            <label for="inputEmail">Email </label>
            <input type="email" class="form-control" id="email" name="email" placeholder="email" required>
            <div class="invalid-feedback">Please enter a valid name.</div>
        </div>
        <div class="form-group">
            <label for="inputPassword">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
            <div class="invalid-feedback">Please enter your password to continue.</div>
        </div>
       <div class="form-group">
            <label for="inputconfirmPassword">ConfirmPassword</label>
            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="confirmPassword" required>
            <div class="invalid-feedback">Please enter your password to continue.</div>
        </div>
       
        <button type="submit" class="btn btn-primary">Register</button>
    </form>
    
    <!-- JavaScript for disabling form submissions if there are invalid fields -->
    <script>
        // Self-executing function
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.getElementsByClassName('needs-validation');
                // Loop over them and prevent submission
                var validation = Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
</div>
</body>
</html>                            