<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
<html lang="en">
<head>
<title>Find Flights User</title>
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
          	<h2>  &nbsp;&nbsp; Find Flights: </h2>
</div>

<div class="bs-example">
    <form action="findFlights" method="post">
        <div class="form-group">
         
        <div class="form-group">
            <label for="inputFrom">From </label>
            <input type="text" class="form-control" id="from" name="from" required>
            <div class="invalid-feedback">Please enter a valid location.</div>
        </div>
        <div class="form-group">
            <label for="inputTo">To </label>
            <input type="text" class="form-control" id="to" name="to" required>
            <div class="invalid-feedback">Please enter a valid location.</div>
        </div>
        <div class="form-group">
            <label for="inputdepature">Departure Date</label>
            <input type="text" class="form-control" id="departureDate" name="departureDate" placeholder="Password" required>
            <div class="invalid-feedback">Please enter your Departure Date to continue.</div>
        </div>
       
        <button type="submit" class="btn btn-primary">Search</button>
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