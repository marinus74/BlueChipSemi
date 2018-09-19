package test.shop;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


@Repository
public class ShopDao extends SqlSessionDaoSupport {
	
	public int getTotalCount()
	{
		int cnt=getSqlSession().selectOne("ShopTotalCount");
		return cnt;
	}
	
	
	public void insertShop(CommentDto cdto)
	{
		getSqlSession().insert("ShopInsert", cdto);		
	}
	
	public List<ShopDto> getAllDatas(int start, int end)
	{
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		return getSqlSession().selectList("ShopAllDatas", map);
	}
	
	public MenuDto getAllDatas2(String hugeirum)
	{
		MenuDto list2 = getSqlSession().selectOne("ShopAllDatas2", hugeirum);
		return list2;
	}
	
	public List<CommentDto> getAllDatas3(String commentirum)
	{
		List<CommentDto> list3 = getSqlSession().selectList("ShopAllDatas3",commentirum);
		return list3;
	}
	
	public ShopDto getAllDatas4(String irum)
	{
		ShopDto list4 = getSqlSession().selectOne("ShopAllDatas4", irum);
		return list4;
	}
	
	public void delete(int commentnum) {
		
		getSqlSession().delete("delete", commentnum);
	}

}
