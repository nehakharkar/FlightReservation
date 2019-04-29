package com.neha.flightreservation.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.neha.flightreservation.dto.ReservationRequest;
import com.neha.flightreservation.entities.Flight;
import com.neha.flightreservation.entities.Passenger;
import com.neha.flightreservation.entities.Reservation;
import com.neha.flightreservation.repos.FlightRepository;
import com.neha.flightreservation.repos.PassengerRepository;
import com.neha.flightreservation.repos.ReservationRepository;
import com.neha.flightreservation.util.EmailUtil;
import com.neha.flightreservation.util.PDFGenerator;
@Service
public class ReservationServiceImpl implements ReservationService {
	@Autowired
	FlightRepository flightRepository;
	
	@Autowired
	PassengerRepository passengerRepository;

	@Autowired
	ReservationRepository reservationRepository;
	
	@Autowired
	PDFGenerator pdfGenerator;
	
	@Autowired
	EmailUtil emailUtil;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(ReservationServiceImpl.class);

	@Value("${com.neha.flightreservation.itinerary.dirpath}")
	private String Itinerary_Dir;
	
	@Override
	public Reservation bookFlight(ReservationRequest request) {
		
		LOGGER.info("inside bookflight()");
		Long flightId= request.getFlightId();
		LOGGER.info("fetching flight for flight id" + flightId);

		Flight flight = flightRepository.findById(flightId).get();

		
		Passenger passenger = new Passenger();
		passenger.setFirstName(request.getPassengerFirstName());
		passenger.setLastName(request.getPassengerLastName());
		passenger.setEmail(request.getPassengerEmail());
		passenger.setPhone(request.getPassengerPhone());	
		LOGGER.info("saving the passenger" + passenger);

		Passenger savedPassenger = passengerRepository.save(passenger);
		
		Reservation reservation = new Reservation();
		reservation.setFlight(flight);
		reservation.setPassenger(savedPassenger);
		reservation.setCheckedIn(false);
		LOGGER.info("saving the reservation" + reservation);
		Reservation savedReservation = reservationRepository.save(reservation);
		
		String filePath = Itinerary_Dir + savedReservation.getId() + ".pdf";
		LOGGER.info("generating the itinerary");
		pdfGenerator.generateItinerary(savedReservation, filePath);

		LOGGER.info("sending the itinerary");
		emailUtil.sendItinerary(passenger.getEmail(), filePath);
		return savedReservation;
	}

}
