package com.neha.flightreservation.util;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.neha.flightreservation.entities.Reservation;

@Component
public class PDFGenerator {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(PDFGenerator.class);


	public void generateItinerary(Reservation reservation, String filePath) {
		LOGGER.info("generateItinerary");
		Document document = new Document();
		try {

			PdfWriter.getInstance(document, new FileOutputStream(filePath));
			document.open();
			document.add(generateTable(reservation));
			document.close();

		} catch (FileNotFoundException | DocumentException e) {
			LOGGER.error("Exception in generateItinerary"+e);
			e.printStackTrace();
		}

	}

	private PdfPTable generateTable(Reservation reservation) {
		PdfPTable pdfTable = new PdfPTable(2);

		PdfPCell cell;
		cell = new PdfPCell(new Phrase("Flight Itinerary"));
		cell.setColspan(2);
		pdfTable.addCell(cell);

		cell = new PdfPCell(new Phrase("Flight Details"));
		cell.setColspan(2);
		pdfTable.addCell(cell);
		
		pdfTable.addCell("Airlines");
		pdfTable.addCell(reservation.getFlight().getOperatingAirlines());

		pdfTable.addCell("Departure City");
		pdfTable.addCell(reservation.getFlight().getDepartureCity());

		pdfTable.addCell("Arrival City");
		pdfTable.addCell(reservation.getFlight().getArrivalCity());

		pdfTable.addCell("Flight Number");
		pdfTable.addCell(reservation.getFlight().getDepartureCity());

		pdfTable.addCell("Departure Date");
		pdfTable.addCell(reservation.getFlight().getDateOfDeparture().toString());

		pdfTable.addCell("Departure Time");
		pdfTable.addCell(reservation.getFlight().getEstimatedDepartureTime().toString());

		cell = new PdfPCell(new Phrase("Passenger Details"));
		cell.setColspan(2);
		pdfTable.addCell(cell);

		pdfTable.addCell("First Name");
		pdfTable.addCell(reservation.getPassenger().getFirstName());

		pdfTable.addCell("Last Name");
		pdfTable.addCell(reservation.getPassenger().getLastName());

		pdfTable.addCell("Email");
		pdfTable.addCell(reservation.getPassenger().getEmail());

		pdfTable.addCell("Phone");
		pdfTable.addCell(reservation.getPassenger().getPhone());

		return pdfTable;
	}
}
