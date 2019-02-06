package com.myproject.mvc;

import com.myproject.util.FindHotelsForm;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController
{

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String home(Model model)
	{
		model.addAttribute("findHotelsForm", new FindHotelsForm());
		return "findHotels";
	}

}
