package com.neha.flightreservation.repos;

import org.springframework.data.jpa.repository.JpaRepository;

//import com.neha.flightreservation.entities.Flight;
import com.neha.flightreservation.entities.Passenger;


public interface PassengerRepository extends JpaRepository<Passenger, Long> {

}
