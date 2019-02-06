package com.myproject.mvc.validator;

import com.myproject.util.RoomAvailabilityForm;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class RoomAvailabilityFormValidator implements Validator {
    @Override
    public boolean supports(Class aClass) {
        return RoomAvailabilityForm.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {

        ValidationUtils.rejectIfEmpty(errors, "startDate", "error.startDate", "Start data is required!");
        ValidationUtils.rejectIfEmpty(errors, "endDate", "error.endDate", "End date is required!");
        ValidationUtils.rejectIfEmpty(errors, "capacity", "error.capacity", "Capacity is required!");

        RoomAvailabilityForm form = (RoomAvailabilityForm) o;
        Integer capacity = form.getCapacity();
        if (capacity != null && (capacity < 0 || capacity > 10)) {
            errors.rejectValue("capacity", "error.capacity", "Invalid room capacity!");
        }

    }
}
