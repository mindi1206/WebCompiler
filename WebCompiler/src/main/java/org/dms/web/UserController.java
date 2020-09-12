package org.dms.web;

import javax.servlet.http.HttpServletRequest;

import org.dms.web.domain.UserVO;
import org.dms.web.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UserController {

		@Autowired
		UserService userService;
		
		private static final Logger logger = LoggerFactory.getLogger(UserController.class);
		
		@RequestMapping(value="/join", method = RequestMethod.GET)
		public String joinGet() {
			return "join";
		}
		
		@RequestMapping(value = "/join", method=RequestMethod.POST)
		public String joinPost(@ModelAttribute("user") UserVO uvo) throws Exception{
			userService.insertUser(uvo);
			return "main";
		}
		
		@RequestMapping(value = "/login", method=RequestMethod.GET)
		public String loginGet() throws Exception{
			return "signin";
		}
		
		@RequestMapping(value = "/login.do", method=RequestMethod.POST)
		public String loginPost(@ModelAttribute("user") UserVO uvo, Model model, HttpServletRequest request, RedirectAttributes attr) throws Exception{
			UserVO user = userService.readUser(uvo);
	
			if(user != null && !user.getUser_id().equals("") && !user.getUser_passwd().equals("")) {
				logger.info("아이디: " + user.getUser_id());
				logger.info("비밀번호: " + user.getUser_passwd());
				request.getSession().setAttribute("user", user);
				return "redirect:/";
			}
			else {
				request.getSession().setAttribute("user", null);
				attr.addFlashAttribute("msg", false);
				return "redirect:/login";
			}
		}
		
		@RequestMapping(value = "/logout.do")
		public String logout(@ModelAttribute("user") UserVO uvo, HttpServletRequest request) throws Exception{
			request.getSession().removeAttribute("user");
			return "redirect:/";
		}
		
}