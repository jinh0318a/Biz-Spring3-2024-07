package com.callor.student.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
// http://localhost:8080/student/user 까지의 요청을 처리할 부분
@RequestMapping(value = "/user")
public class UserController {

	// http://localhost:8080/student/user/login 까지의 요청을 처리할 부분
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return null;
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return null;
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin() {
		return null;
	}
}
