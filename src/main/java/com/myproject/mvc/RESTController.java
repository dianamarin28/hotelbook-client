package com.myproject.mvc;

import com.google.gson.Gson;
import com.myproject.domain.Availability;
import com.myproject.domain.Hotel;
import com.myproject.mvc.validator.FindHotelsFormValidator;
import com.myproject.mvc.validator.ReservationFormValidator;
import com.myproject.mvc.validator.RoomAvailabilityFormValidator;
import com.myproject.util.ReservationForm;
import com.myproject.util.FindHotelsForm;
import com.myproject.util.RoomAvailabilityForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.Date;

@Controller
public class RESTController {

    @Autowired
    private FindHotelsFormValidator findValidator;

    @Autowired
    private RoomAvailabilityFormValidator availabilityValidator;

    @Autowired
    private ReservationFormValidator reservationValidator;

    private static final String URI = "http://tomcat-serverapp:8080/myproject";

    private static class HotelList extends ArrayList<Hotel> {
    }

    @RequestMapping(value = "/findAllHotels", method = RequestMethod.GET)
    public String getAllHotels(@ModelAttribute("findHotelsForm") FindHotelsForm findHotelsForm, Model model) {
        final String uri = URI + "/hotelREST/allHotels";

        RestTemplate restTemplate = new RestTemplate();
        String result = restTemplate.getForObject(uri, String.class);
        Gson gson = new Gson();
        HotelList hotels = gson.fromJson(result, HotelList.class);

        model.addAttribute("hotels", hotels);

        return "hotelsList";
    }

    @RequestMapping(value = "/findHotels", method = RequestMethod.GET)
    public String getFindHotels(Model model) {
        model.addAttribute("findHotelsForm", new FindHotelsForm());
        return "findHotels";
    }

    @RequestMapping(value = "/findHotels", method = RequestMethod.POST)
    public String getHotelsForFilters(@ModelAttribute("findHotelsForm") FindHotelsForm findHotelsForm, Model model, BindingResult bindingResult) {
        findValidator.validate(findHotelsForm, bindingResult);

        if (bindingResult.hasErrors()) {
            model.addAttribute("error", bindingResult.getAllErrors().get(0).getDefaultMessage());
            return "findHotels";
        } else {
            String city = findHotelsForm.getCity();

            final String uri = URI + "/hotelREST/hotels/" + city;

            RestTemplate restTemplate = new RestTemplate();
            String result = restTemplate.getForObject(uri, String.class);
            Gson gson = new Gson();
            HotelList hotels = gson.fromJson(result, HotelList.class);

            for (Hotel h : hotels) {
                h.setStars(convertHotelStarsToHtml(h));
                h.getAddress().setAddressToString(concatenateHotelAddress(h));
            }

            model.addAttribute("filterDestination", city);
            model.addAttribute("hotels", hotels);
        }

        return "hotelsList";
    }

    @RequestMapping(value = "/hotelDetails/{hotelId}", method = RequestMethod.GET)
    public String getHotelDetails(@PathVariable("hotelId") Integer hotelId, Model model) {
        final String uri = URI + "/hotelREST/hotel/" + hotelId;

        RestTemplate restTemplate = new RestTemplate();
        String result = restTemplate.getForObject(uri, String.class);
        if (!result.equals("{}")) {
            Gson gson = new Gson();
            Hotel hotel = gson.fromJson(result, Hotel.class);

            hotel.setStars(convertHotelStarsToHtml(hotel));
            hotel.getAddress().setAddressToString(concatenateHotelAddress(hotel));

            model.addAttribute("hotel", hotel);
        } else {
            return "redirect:/findHotels";
        }

        model.addAttribute("roomAvailabilityForm", new RoomAvailabilityForm());
        return "hotelDetails";
    }

    @RequestMapping(value = "/roomAvailability", method = RequestMethod.POST)
    public String checkRoomAvailability(@ModelAttribute("roomAvailabilityForm") RoomAvailabilityForm roomAvailabilityForm, Model model,
                                        BindingResult bindingResult) {

        availabilityValidator.validate(roomAvailabilityForm, bindingResult);
        if (!bindingResult.hasErrors()) {
            Integer hotelId = roomAvailabilityForm.getHotelId();
            String startDate = roomAvailabilityForm.getStartDate();
            String endDate = roomAvailabilityForm.getEndDate();
            Integer capacity = roomAvailabilityForm.getCapacity();

            final String uri = URI + "/reservationREST/roomAvailability?hotelId=" + hotelId + "&startDate=" + startDate + "&endDate=" + endDate + "&capacity=" + capacity;

            RestTemplate restTemplate = new RestTemplate();
            String result = restTemplate.getForObject(uri, String.class);
            Gson gson = new Gson();
            Availability isAvailable = gson.fromJson(result, Availability.class);

            boolean available = isAvailable.isAvailable();
            model.addAttribute("isAvailable", available);
            if (available) {
                String reservationURI = "/reservation?hotelId=" + hotelId + "&startDate=" + startDate + "&endDate=" + endDate + "&capacity=" + capacity;
                model.addAttribute("reservationURI", reservationURI);
            }
        }

        return "hotelDetailsFragment";
    }

    @RequestMapping(value = "/reservation", method = RequestMethod.GET)
    public String createReservationGetPage(@RequestParam("hotelId") Integer hotelId, @RequestParam("startDate") String startDate,
                                           @RequestParam("endDate") String endDate, @RequestParam("capacity") Integer capacity, Model model) {

        ReservationForm reservationForm = new ReservationForm();
        reservationForm.setStartDate(startDate);
        reservationForm.setEndDate(endDate);
        reservationForm.setCapacity(capacity);
        reservationForm.setHotelId(hotelId);

        model.addAttribute("reservationForm", reservationForm);

//        REST call for additional hotel info
        final String uri = URI + "/hotelREST/hotel/" + hotelId;

        RestTemplate restTemplate = new RestTemplate();
        String result = restTemplate.getForObject(uri, String.class);
        Gson gson = new Gson();
        Hotel hotel = gson.fromJson(result, Hotel.class);

        hotel.setStars(convertHotelStarsToHtml(hotel));

        model.addAttribute("hotel", hotel);

        return "makeReservation";
    }


    @RequestMapping(value = "/reservation", method = RequestMethod.POST)
    public String createReservation(@ModelAttribute("reservationForm") ReservationForm reservationForm, Model model, BindingResult bindingResult) {

        reservationValidator.validate(reservationForm, bindingResult);

        RestTemplate restTemplate = new RestTemplate();

        if (!bindingResult.hasErrors()) {

            final String uri = URI + "/reservationREST/reservation";

            Integer result = restTemplate.postForObject(uri, reservationForm, Integer.class);

            model.addAttribute("result", result);
        }

//        REST call for additional hotel info
        final String uriHotel = URI + "/hotelREST/hotel/" + reservationForm.getHotelId();

        String resultHotel = restTemplate.getForObject(uriHotel, String.class);
        Gson gson = new Gson();
        Hotel hotel = gson.fromJson(resultHotel, Hotel.class);

        hotel.setStars(convertHotelStarsToHtml(hotel));

        model.addAttribute("hotel", hotel);

        return "makeReservation";
    }

    private String convertHotelStarsToHtml(Hotel hotel) {
        String html = "";
        if (hotel.getNumberOfStars() != null) {
            Integer numberOfStars = hotel.getNumberOfStars();
            int i = 0;
            while (i < numberOfStars) {
                html += "<span class=\"glyphicon glyphicon-star\" style=\"color:#FFD700\"></span> ";
                i++;
            }
        }
        return html;
    }

    private String concatenateHotelAddress(Hotel hotel) {
        String addressToString = "";
        if (hotel.getAddress() != null && hotel.getAddress().getNumber() != null && hotel.getAddress().getStreet() != null
                && hotel.getAddress().getCity() != null && hotel.getAddress().getCountry() != null && hotel.getContactPhoneNumber() != null) {
            addressToString += hotel.getAddress().getStreet();
            addressToString += " " + hotel.getAddress().getNumber();
            addressToString += ", " + hotel.getAddress().getCity();
            addressToString += ", " + hotel.getAddress().getCountry();
        }
        return addressToString;
    }
}
