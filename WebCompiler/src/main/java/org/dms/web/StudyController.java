package org.dms.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/study")
public class StudyController {
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String getPage(HttpSession session) {
		return "study";
	}
}