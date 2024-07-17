package com.callor.student.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.student.models.StudentVO;
import com.callor.student.persistance.StudentDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private final StudentDao studentDao;

	public HomeController(StudentDao studentDao) {
		super();
		this.studentDao = studentDao;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		List<StudentVO> stList = studentDao.selectAll();
		model.addAttribute("ST_LIST", stList);
		return "home";
	}

	// 학생정보를 입력받기위한 화면을 보여주는 메서드
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert() {
		return "student/input";
	}

	// 학생정보 입력화면에서 데이터를 입력한 후 저장을 클릭했을때 데이터를 전달 받는 메서드
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(StudentVO studentVO, Model model) {
		model.addAttribute("STD", studentVO);
		int result = studentDao.insert(studentVO);

//		List<StudentVO> stList = studentDao.selectAll();
//		model.addAttribute("ST_LIST", stList);
//		return "home";

		return "redirect:/";
	}

}
