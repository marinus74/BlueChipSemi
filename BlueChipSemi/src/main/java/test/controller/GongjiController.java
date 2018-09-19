package test.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import test.bbsdto.BBSDto;
import test.bbsservice.BBSService;
import test.gongji.GongjiDao;
import test.gongji.GongjiDto;

@Controller
public class GongjiController {
	
	@Autowired
	private GongjiDao gdao;
	
	
	@RequestMapping("/shop/gongji.do")
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		int totalCount=gdao.getTotalCount();
		
		model.addObject("totalCount", totalCount);
		
		List<GongjiDto> list=gdao.getAllDatas();
		model.addObject("list",list);
		
		model.setViewName("/2/board/gongji");
		return model;
	}
	

	@RequestMapping("/shop/read.do")
	public String dataRead(@ModelAttribute GongjiDto dto)
	{
		gdao.insertGongji(dto);
		return "redirect:gongji.do";
	}
	
	
	@RequestMapping(value="/shop/content.do")
	public ModelAndView content(@RequestParam("articlenum") int seq)
	{
		ModelAndView model=new ModelAndView();
		GongjiDto dto= gdao.select(seq);
		model.addObject("dto", dto);
		model.setViewName("/2/board/content");
		return model;
	}

	@RequestMapping(value="/shop/delete.do")
	public String delete(@ModelAttribute GongjiDto dto)
	{
		gdao.deleteGongji(dto);
		return "redirect:gongji.do";
	}
	
	@RequestMapping("/shop/update.do")
	public ModelAndView update(@RequestParam("articleNum") int seq)
	{
		ModelAndView model = new ModelAndView();
		GongjiDto dto=gdao.update(seq);
		model.addObject("dto", dto); 
		model.setViewName("/2/board/updateForm");
		return model;
	}
	
	
	
}
	



