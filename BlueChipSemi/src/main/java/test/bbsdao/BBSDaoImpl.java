package test.bbsdao;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.bbsdto.BBSDto;
import test.gongji.GongjiDto;
import test.shop.ShopDto;


@Repository
public class BBSDaoImpl implements BBSDao {
	private final String nameSpace="test.bbsdao.BBSDao";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void write(BBSDto article) {		
		sqlSession.insert(nameSpace+".write", article);		
	}
	
	@Override
	public void write2(BBSDto article) {		
		sqlSession.update(nameSpace+".write2", article);		
	}
	
	@Override
	public int getTotalCount() {		
		return sqlSession.selectOne(nameSpace+".getTotalCount");
	}

	@Override
	public List<BBSDto> list(HashMap<String, String> pagingMap) {		
		return sqlSession.selectList(nameSpace+".list",pagingMap);	
	}

	@Override
	public String login(String id) {		
		return sqlSession.selectOne(nameSpace+".login",id);
	}

	@Override
	public BBSDto content(String articleNum) {		
		return sqlSession.selectOne(nameSpace+".content",articleNum);
	}

		@Override
	public void delete(String articleNum) {
		sqlSession.delete(nameSpace+".delete",articleNum);		
	}
		
	@Override
	public BBSDto updateForm(String articleNum) {
		return sqlSession.selectOne(nameSpace+".updateForm",articleNum);
	}

	@Override
	public void update(BBSDto article) {
		sqlSession.update(nameSpace+".update",article);
	}	
	


}
