<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Complete Reservation</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class= "form-group">
<h2>Complete Reservation:</h2>
Airline: ${flight.operatingAirlines} <br/>
Departure city: ${flight.departureCity}<br/>
Arrival City: ${flight.arrivalCity}<br/>
</div>
<div class="bs-example">

<form action= "completeReservation" method="post">
<div class= "form-group">
<h2>Passenger details</h2>
</div>
	 <form action="findFlights" method="post">         
        <div class="form-group">
            <label for="inputFirstName">First Name: </label>
            <input type="text" class="form-control" id="passengerFirstName" name="passengerFirstName" required>
            <div class="invalid-feedback">Please enter a valid first name.</div>
        </div>
        <div class="form-group">
            <label for="inputLastName">Last Name: </label>
            <input type="text" class="form-control" id="passengerLastName" name="passengerLastName" required>
            <div class="invalid-feedback">Please enter a valid Last Name.</div>
        </div>
        <div class="form-group">
            <label for="inputEmail">Email: </label>
            <input type="text" class="form-control" id="passengerEmail" name="passengerEmail"  required>
            <div class="invalid-feedback">Please enter your Email.</div>
        </div>
         <div class="form-group">
            <label for="inputPhone">Phone: </label>
            <input type="text" class="form-control" id="passengerPhone" name="passengerPhone"  required>
            <div class="invalid-feedback">Please enter your Phone.</div>
        </div>
       
       	<div class= "form-group">
			<h2>Card details</h2>
		</div>
		
		 <div class="form-group">
            <label for="inputNameCard">Name on the card: </label>
            <input type="text" class="form-control" id="nameOnTheCard" name="nameOnTheCard" required>
            <div class="invalid-feedback">Please enter a valid name.</div>
        </div>
        <div class="form-group">
            <label for="inputCardNumber">Card Number: </label>
            <input type="text" class="form-control" id="cardNumber" name="cardNumber" required>
            <div class="invalid-feedback">Please enter a valid Last Name.</div>
        </div>
		 <div class="form-group">
            <label for="inputFirstName">Expiry Date: </label>
            <input type="text" class="form-control" id="expirationDate" name="expirationDate" required>
            <div class="invalid-feedback">Please enter a valid first name.</div>
        </div>
         <div class="form-group">
            <label for="inputCardCVV">CVV: </label>
            <input type="text" class="form-control" id="cardCVV" name="cardCVV" required>
            <div class="invalid-feedback">Please enter a valid CVV.</div>
        </div>
		<input type ="hidden" name= "flightId" value=${flight.id}>
        <button type="submit" class="btn btn-primary" value="confirm">Submit the payment</button>
	
</form>
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