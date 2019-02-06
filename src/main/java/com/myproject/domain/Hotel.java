package com.myproject.domain;

import java.sql.Time;
import java.util.List;

public class Hotel {
    private Integer hotelId;

    private String name;

    private Address address;

    private String description;

    private String contactPhoneNumber;

    private String email;

    private Integer numberOfStars;

    private Time checkInHours;

    private Time checkOutHours;

    private List<String> hotelFeatures;

    private List<String> roomFeatures;

    private String stars;

    private Integer builtYear;

    private Integer numberOfFloors;

    private String mainImageURL;

    private Double minimumPricePerNight;

    public Double getMinimumPricePerNight() {
        return minimumPricePerNight;
    }

    public void setMinimumPricePerNight(Double minimumPricePerNight) {
        this.minimumPricePerNight = minimumPricePerNight;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContactPhoneNumber() {
        return contactPhoneNumber;
    }

    public void setContactPhoneNumber(String contactPhoneNumber) {
        this.contactPhoneNumber = contactPhoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getNumberOfStars() {
        return numberOfStars;
    }

    public void setNumberOfStars(Integer numberOfStars) {
        this.numberOfStars = numberOfStars;
    }

    public Time getCheckInHours() {
        return checkInHours;
    }

    public void setCheckInHours(Time checkInHours) {
        this.checkInHours = checkInHours;
    }

    public Time getCheckOutHours() {
        return checkOutHours;
    }

    public void setCheckOutHours(Time checkOutHours) {
        this.checkOutHours = checkOutHours;
    }

    public List<String> getHotelFeatures() {
        return hotelFeatures;
    }

    public void setHotelFeatures(List<String> hotelFeatures) {
        this.hotelFeatures = hotelFeatures;
    }

    public List<String> getRoomFeatures() {
        return roomFeatures;
    }

    public void setRoomFeatures(List<String> roomFeatures) {
        this.roomFeatures = roomFeatures;
    }

    public String getStars() {
        return stars;
    }

    public void setStars(String stars) {
        this.stars = stars;
    }

    public Integer getHotelId() {
        return hotelId;
    }

    public void setHotelId(Integer hotelId) {
        this.hotelId = hotelId;
    }

    public Integer getBuiltYear() {
        return builtYear;
    }

    public void setBuiltYear(Integer builtYear) {
        this.builtYear = builtYear;
    }

    public Integer getNumberOfFloors() {
        return numberOfFloors;
    }

    public void setNumberOfFloors(Integer numberOfFloors) {
        this.numberOfFloors = numberOfFloors;
    }

    public String getMainImageURL() {
        return mainImageURL;
    }

    public void setMainImageURL(String mainImageURL) {
        this.mainImageURL = mainImageURL;
    }
}
