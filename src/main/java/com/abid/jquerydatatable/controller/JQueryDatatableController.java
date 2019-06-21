package com.abid.jquerydatatable.controller;

import java.io.IOException;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.abid.jquerydatatable.service.LoadDataService;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class JQueryDatatableController {
	 private static final Logger logger = LoggerFactory.getLogger(JQueryDatatableController.class);
    
	 
	    @RequestMapping(value = "/", method = RequestMethod.GET)
	    public String home(Locale locale, Model model) throws JsonGenerationException, JsonMappingException, IOException {
	        logger.info("Welcome home! The client locale is {}.", locale);
	        
	        LoadDataService dataService = new LoadDataService();
	        ObjectMapper mapper = new ObjectMapper();
	        model.addAttribute("employeeList", mapper.writeValueAsString(dataService.getEmployeeList()));
	        return "home";
	    }
}
