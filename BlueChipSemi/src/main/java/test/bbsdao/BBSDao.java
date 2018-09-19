package test.bbsdao;

import java.util.HashMap;
import java.util.List;

import test.bbsdto.BBSDto;
import test.gongji.GongjiDto;


public interface BBSDao {
	public void write(BBSDto article);
	public void write2(BBSDto article);
	public int getTotalCount();
	public List<BBSDto> list(HashMap<String, String> pagingMap);
	public String login(String id);
	public BBSDto content(String articleNum);
	public void delete(String articleNum);
	public BBSDto updateForm(String articleNum);
	public void update(BBSDto article);
	
}
