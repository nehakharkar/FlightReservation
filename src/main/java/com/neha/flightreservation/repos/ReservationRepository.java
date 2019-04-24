package com.neha.flightreservation.repos;

import org.springframework.data.jpa.repository.JpaRepository;

//import com.neha.flightreservation.entities.Flight;
import com.neha.flightreservation.entities.Reservation;
//import com.neha.flightreservation.entities.User;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {

}
