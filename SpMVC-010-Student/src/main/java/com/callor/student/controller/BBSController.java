package com.callor.student.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/bbs")
public class BBSController {

	@RequestMapping(value = { "/", "" }, method = RequestMethod.GET)
	public String bbs() {
		return "bbs/list";
	}

	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice() {
		return null;
	}
}
