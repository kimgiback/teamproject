package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import dto.VisitDTO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class VisitDAO {

	final SqlSession sqlSession;
	
	public List<VisitDTO> selectList() {
		List<VisitDTO> list = sqlSession.selectList("v.reservation");
		return list;
	}
	
	public List<VisitDTO> select() {
		List<VisitDTO> list = sqlSession.selectList("v.member");
		return list;
	}
	
	public int delete(HashMap<String, Object> map) {
		int res = sqlSession.delete("v.rev_del",map);
		return res;
	}

	public VisitDTO selectOne(String m_email) {
		VisitDTO dto = sqlSession.selectOne("v.visit_one",m_email);
		return dto;
	}
	
	public int insert(VisitDTO dto) {
		int res = sqlSession.insert("v.visit_insert", dto);
		return res;
	}
	
	public int wishInsert(VisitDTO dto) {
		int res = sqlSession.insert("v.wish", dto);
		return res;
	}
	public int count(VisitDTO dto) {
		int res = sqlSession.selectOne("v.wishCountSelect",dto);
		return res;
	}

	public int wishDelete(VisitDTO dto) {
		int res = sqlSession.delete("v.wishdel",dto);
		return res;
	}
	
	public List<VisitDTO> select1() {
		List<VisitDTO> list = sqlSession.selectList("v.MyReview");
		return list;
	}

	
}
