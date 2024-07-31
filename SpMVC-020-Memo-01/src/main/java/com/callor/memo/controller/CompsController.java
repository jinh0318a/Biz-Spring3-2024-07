package com.callor.memo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.memo.models.Memo;
import com.callor.memo.service.MemoService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/comps")
public class CompsController {

	private final MemoService memoService;

	public CompsController(MemoService memoService) {
		super();
		this.memoService = memoService;
	}

	@RequestMapping(value = "/input", method = RequestMethod.GET)
	public String input() {
		return null;
	}

	// localhost:8080/memo/comps/update/333 과 같이 요청이오면
	// {m_seq} path 에 있는 문자열을 값으로 인식하고
	// m_seq 변수에 할당
	@RequestMapping(value = "/update/{m_seq}", method = RequestMethod.GET)
	public String update(@PathVariable(name = "m_seq") String m_seq, Model model) {
		log.debug("PK: {}", m_seq);
		Memo memo = memoService.findById(m_seq);
		model.addAttribute("MEMO", memo);
		return "comps/input";
	}
}
