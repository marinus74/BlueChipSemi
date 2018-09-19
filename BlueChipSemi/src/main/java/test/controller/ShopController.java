package test.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import test.shop.CommentDto;
import test.shop.MenuDto;
import test.shop.ShopDao;
import test.shop.ShopDto;

@Controller
public class ShopController {

	@Autowired
	private ShopDao sdao;
	
	@RequestMapping("/shop/list.do")
	public ModelAndView list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum)
	{
		ModelAndView model = new ModelAndView();
		
		int totalCount = sdao.getTotalCount();
		int perPage = 10; // 한페이지당 보여지는 글의 갯수
		int perBlock = 9; // 한블럭당 보여지는 페이지번호의 수
		int totalPage; // 총 페이지의 갯수
		int startNum; // 한페이지당 보여지는 시작번호
		int endNum; // 한페이지당 보여지는 끝번호
		int startPage; // 한 블럭당 보여지는 시작페이지번호
		int endPage; // 한 블럭당 보여지는 끝페이지번호
		int no; // 게시글에 붙일 시작번호
		List<ShopDto> list = null;
		
		// 총 페이지수
		totalPage = (totalCount / perPage) + (totalCount % perPage > 0 ? 1 : 0);
		// 각 페이지에 보여질 시작번호와 끝번호 구하기
		startNum = (pageNum - 1) * perPage + 1;
		endNum = startNum + perPage - 1;
		// 예를 들어 모두 45개의 글이 있을경우
		// 마지막 페이지는 endnum 이 45 가 되야함
		if (endNum > totalCount)
			endNum = totalCount;

		// 각 블럭에 보여질 시작 페이지번호와 끝 페이지 번호 구하기
		startPage = (pageNum - 1) / perBlock * perBlock + 1;
		endPage = startPage + perBlock - 1;

		// 예를 들어 총 34페이지일경우
		// 마지막 블럭은 30-34 만 보여야함
		if (endPage > totalPage)
			endPage = totalPage;

		// 각 글에 보여질 번호구하기(총 100개라면 100부터 출력함)
		no = (pageNum - 1) * perPage + 1;
		
		
		
		list = sdao.getAllDatas(startNum, endNum);
		
		model.addObject("pageNum", pageNum);
		model.addObject("no", no);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("totalPage", totalPage);
		model.addObject("totalCount",totalCount);
		model.addObject("list",list);
		
		model.setViewName("/1/board/shoplist");
		
		return model;
	}
	
	@RequestMapping("/shop/list2.do")
	public ModelAndView list2(@RequestParam("hugeirum") String hugeirum,
			@RequestParam("commentirum") String commentirum,
			@RequestParam("irum") String irum,
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum)
	{
		ModelAndView model = new ModelAndView();
		
		MenuDto list2 = sdao.getAllDatas2(hugeirum);
		List<CommentDto> list3 = sdao.getAllDatas3(commentirum);
		ShopDto list4 = sdao.getAllDatas4(irum);
		
		model.addObject("list2",list2);
		model.addObject("list3",list3);
		model.addObject("list4",list4);
		model.addObject("pageNum", pageNum);
		
		model.setViewName("/1/board/shoplist2");
		
		return model;
	}
	
	@RequestMapping("/shop/thro.do")
	public String cnlwl()
	{
		
		return "/2/board/thro";
	}
	
	@RequestMapping("/shop/read2.do")
	public String dataRead(@ModelAttribute CommentDto cdto)
	{
		sdao.insertShop(cdto);
		
		String s = "";
		try {
			s = java.net.URLEncoder.encode(cdto.getCommentirum(),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return "redirect:list2.do?hugeirum="+s+"&commentirum="+s+"&irum="+s;	
		
	}
	
	@RequestMapping("/shop/commentdelete.do")
	public String delete(@RequestParam("commentnum") int commentnum,
							@RequestParam("irum") String irum) {	
		
		sdao.delete(commentnum);
		
		String s = "";
		try {
			s = java.net.URLEncoder.encode(irum,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return "redirect:list2.do?hugeirum="+s+"&commentirum="+s+"&irum="+s;	
	}
	
	
	@RequestMapping("/shop/map.do")
	public String map()
	{
		return "/1/board/map";
	}
	
	@RequestMapping("/shop/writeForm.do")
	public String writeform()
	{
		System.out.println(2);
		return "/2/board/writeForm2";
	}
	
	@RequestMapping("/shop/loginform.do")
	public String loginform()
	{
		return "/2/board/loginform";
	}
}
