package com.myproject.mvc.validator;

import com.myproject.util.ReservationForm;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class ReservationFormValidator implements Validator {
    @Override
    public boolean supports(Class aClass) {
        return ReservationForm.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        ValidationUtils.rejectIfEmpty(errors, "startDate", "error.startDate", "Start date is required!");
        ValidationUtils.rejectIfEmpty(errors, "endDate", "error.endDate", "End date is required!");
        ValidationUtils.rejectIfEmpty(errors, "firstName", "error.firstName", "First name is required!");
        ValidationUtils.rejectIfEmpty(errors, "lastName", "error.lastName", "Last name is required!");
        ValidationUtils.rejectIfEmpty(errors, "phoneNumber", "error.phoneNumber", "Phone number is required!");
        ValidationUtils.rejectIfEmpty(errors, "email", "error.email", "Email is required!");
        ValidationUtils.rejectIfEmpty(errors, "capacity", "error.capacity", "Capacity is required!");

        ReservationForm reservationForm = (ReservationForm) o;

        String phoneNumber = reservationForm.getPhoneNumber();
        if(phoneNumber.length() > 0 && phoneNumber.length() != 10) {
            errors.rejectValue("phoneNumber","error.phoneNumber","Not a valid phone number!");
        }
        Integer capacity = reservationForm.getCapacity();
        if (capacity != null && (capacity < 0 || capacity > 10)) {
            errors.rejectValue("capacity", "error.capacity", "Invalid room capacity.");
        }
    }
}
