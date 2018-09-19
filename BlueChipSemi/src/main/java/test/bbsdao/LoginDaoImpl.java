package test.bbsdao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/*@Repository*/
public class LoginDaoImpl extends SqlSessionDaoSupport implements Logindao{
	/*@Autowired
	private SqlSessionTemplate sqlSession;
	*/
	@Override
	public boolean isEqualPass(String id, String pass) {
		// TODO Auto-generated method stub
		System.out.println(id+",,"+pass);
		Map<String, String> map=new HashMap<>();
		map.put("id", id);
		map.put("pass", pass);
		int n=getSqlSession().selectOne("logindb.idequals",map);
		//int tot=getSqlSession().selectOne("logindb.countlogin");
		if(n>=1)
			return true;
		else
			return false;
}
}