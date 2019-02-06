package com.myproject.mvc.validator;

import com.myproject.util.FindHotelsForm;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class FindHotelsFormValidator implements Validator {
    @Override
    public boolean supports(Class aClass) {
        return FindHotelsForm.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {

        ValidationUtils.rejectIfEmpty(errors, "city", "error.city", "Please enter a destination!");

    }
}
