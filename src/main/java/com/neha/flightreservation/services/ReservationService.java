package com.neha.flightreservation.services;


import com.neha.flightreservation.dto.ReservationRequest;
import com.neha.flightreservation.entities.Reservation;
public interface ReservationService {
	public Reservation bookFlight(ReservationRequest request);

}
