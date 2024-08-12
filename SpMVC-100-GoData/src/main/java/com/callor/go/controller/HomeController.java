package com.callor.go.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.callor.go.models.BisStation;
import com.callor.go.service.BisService;

@Controller
public class HomeController {

	private final BisService bisService;

	public HomeController(BisService bisService) {
		super();
		this.bisService = bisService;
	}
	
	@RequestMapping(value="/")
	public String home() {
		return "home";
	}
	
//	@ResponseBody
//	@RequestMapping(value = "/", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
//	public List<BisStation> home(Model model) {
//
//		List<BisStation> bisList = bisService.getStations();
//
//		return bisList;
//	}

}