package test.gongji;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import test.shop.ShopDto;

@Repository
public class GongjiDao<gdto> extends SqlSessionDaoSupport {
	public int getTotalCount()
	{
		int cnt=getSqlSession().selectOne("GongjiTotalCount");
		return cnt;
	}

	public void insertGongji(GongjiDto dto)
	{
		getSqlSession().insert("GongjiInsert", dto);
	}
	
	public List<GongjiDto> getAllDatas()
	{
		List<GongjiDto> list=getSqlSession().selectList("GongjiAllDatas");
				return list;
	}
	
	public GongjiDto select(int Seq)
	{
		GongjiDto dto= getSqlSession().selectOne("GongjiSelect",Seq);
		return dto;
	}
	
	public void deleteGongji(GongjiDto dto)
	{
		getSqlSession().delete("GongjiDelete", dto);
	}
	
	public GongjiDto update(int seq){
		System.out.println("seq:"+seq);
		return getSqlSession().selectOne("GongjiUpdate", seq);
	}
}
