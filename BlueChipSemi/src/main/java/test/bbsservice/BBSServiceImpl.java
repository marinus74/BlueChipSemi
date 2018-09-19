package test.bbsservice;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import test.bbsdao.BBSDao;
import test.bbsdto.BBSDto;
import test.paging.Page;


@Service
public class BBSServiceImpl implements BBSService {
	@Autowired
	private BBSDao bbsDao;
	
	@Autowired
	private Page page;
	
	@Override 
	public void write(BBSDto article) {
		//리턴되는 값인 List<MultipartFile>는 CommonsMultipartFile을 리턴함
		//그래서 isEmpty() (List에 있는 isEmpty() 메소드임)로 물어보면 List 값이 비어있는 것이 아님
		//MultipartFile에 있는 isEmpty()를 사용해야함
			bbsDao.write(article);
	}
	
	@Override 
	public void write2(BBSDto article) {
		//리턴되는 값인 List<MultipartFile>는 CommonsMultipartFile을 리턴함
		//그래서 isEmpty() (List에 있는 isEmpty() 메소드임)로 물어보면 List 값이 비어있는 것이 아님
		//MultipartFile에 있는 isEmpty()를 사용해야함
			bbsDao.write2(article);
	}
	
	@Override 
	public int getTotalCount() {
		return bbsDao.getTotalCount();
	}
	
	@Override
	public void list(int pageNum,Model model) {
		int pageSize=15;
		int pageBlock=10;
		int totalCount=bbsDao.getTotalCount();
		HashMap<String, String> pagingMap=page.paging(pageNum, totalCount, pageSize, pageBlock);
		
		List<BBSDto> articleList=bbsDao.list(pagingMap);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageCode", pagingMap.get("pageCode"));
		model.addAttribute("articleList", articleList);	
		model.addAttribute("pageNum", pageNum);
	}
	
	
	@Override
	public String login(String id, String pass, HttpSession session, HttpServletRequest req) {
		String dbPass=bbsDao.login(id);
		String view=null;
		if(dbPass==null) {
			view="passFail";
		}else {
			if(pass.equals(dbPass)) {  //사용자의 패스워드와 비교
				//세션 고정 취약점 제거
				session.invalidate(); //현재의 세션이 사라짐
				session=req.getSession(); //새로운세션
				session.setAttribute("id", id);
				
				view="redirect:/gongji.do";
			}else {
				view="passFail"; //패스워드가 틀렷을때 이 페이지로 넘어감
			}
		}
		return view;
	}

	@Override
	public BBSDto content(String articleNum) {
		BBSDto article=bbsDao.content(articleNum);
		article.setContent(article.getContent().replaceAll("\r\n", "<br/>"));//엔터키 적용
		return article;
	}
	
	@Override
	public void delete(String articleNum) {
		bbsDao.delete(articleNum);
		
	}
	
	@Override
	public BBSDto updateForm(String articleNum) {
		return bbsDao.updateForm(articleNum);
	}
	@Override
	public void update(BBSDto article) {
		bbsDao.update(article);
		
	}
	
	
	
	
	
	
	
}
