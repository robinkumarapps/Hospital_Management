package com.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ControllerHome {
	
	private Logger log = Logger.getLogger(ControllerDoctor.class);
	
	// Home Route
		@RequestMapping("/")
		public String home() {
			log.debug("Setting view to home index");
			return "index";
		}
}
