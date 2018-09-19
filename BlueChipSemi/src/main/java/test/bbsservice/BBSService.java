package test.bbsservice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.core.io.FileSystemResource;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;


import test.bbsdto.BBSDto;

public interface BBSService {

	public void write(BBSDto article);
	public void write2(BBSDto article);
	public int getTotalCount();
	public void list(int pageNum, Model model);
	public String login(String id,String pass,HttpSession session,HttpServletRequest req);
	public BBSDto content(String articleNum);
	public void delete(String articleNum);
	public BBSDto updateForm(String articleNum);
	public void update(BBSDto article);

}
