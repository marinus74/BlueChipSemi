package test.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import test.bbsdao.LoginDaoImpl;

@Controller
public class LoginController {
	
	@Autowired
	LoginDaoImpl logindao;
	
	@RequestMapping("/shop/gongjiprocess.do")
	public String loginprocess(@RequestParam String id,@RequestParam String pass,Model model,HttpSession session)
	{
		System.out.println(id+","+pass);
		boolean s=logindao.isEqualPass(id, pass);

		if(s) {
			session.setAttribute("id", id);
	
			model.addAttribute("id", id);
			return "redirect:gongji.do";
		}
		else
			return "redirect:gongji.do";
	}
}
