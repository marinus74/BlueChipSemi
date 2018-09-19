package test.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import test.bbsdto.BBSDto;
import test.bbsservice.BBSService;

@Controller
public class BBSController {
	@Autowired
	private BBSService bbsService;
	
	@RequestMapping(value="/gongji.do")
	public String list(@RequestParam("pageNum") int pageNum,
						Model model) {		
		bbsService.list(pageNum,model);		
		return "/2/board/gongji";
	}
	 
	@RequestMapping(value="/writeForm.bbs", method=RequestMethod.GET)
	public String writeForm(HttpSession session) {
		return "writeForm";
	}
	 
	/*multipartHttpServletRequest로 업로드처리
	@RequestMapping(value="/write.bbs", method=RequestMethod.POST)
	public String write(BBSDto article, HttpSession session, MultipartHttpServletRequest mRequest) {
		List<MultipartFile> mFile=mRequest.getFiles("fname");*/
	
	//@RequestPart를 이용
	@RequestMapping(value="/shop/write.do", method=RequestMethod.POST)
	public String write(BBSDto article, HttpSession session) {
		article.setId((String)session.getAttribute("id"));	
		bbsService.write(article);
		return "redirect:gongji.do";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(@RequestParam("id") String id,    //@RequestParam은 요청 파라미터를 메소드 파라미터에 넣어주는 애노테이션이다
						@RequestParam("pass") String pass, 
						HttpSession session, HttpServletRequest req) {
		return bbsService.login(id,pass,session,req);
	}
	
	
	@RequestMapping(value="/gongji.do", method=RequestMethod.GET)
	public String loginForm() {
		return "redirect:gongji.do";
	}
	
	@RequestMapping(value="/shop/logout.do", method=RequestMethod.POST)
	public String login(HttpSession session) { //HttpSession session 로그인 했는지 식별하는 역할 (사용자가 서버로 접근하려는지)
		session.removeAttribute("id"); //현재 세션을 무효화 시킨다 로그인을 무효화함
		return "redirect:gongji.do";
	}
	
	@RequestMapping(value="/shop/update2.do", method=RequestMethod.POST)
	public String write2(BBSDto article, HttpSession session) {
		article.setId((String)session.getAttribute("id"));	
		bbsService.write2(article);
		return "redirect:gongji.do";
	}
	
	
	
	
	
	
}
