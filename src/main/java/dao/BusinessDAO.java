package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.BusinessDTO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class BusinessDAO {

	final SqlSession sqlSession;
	
	//���� ī�װ��� ��ȸ
	public List<BusinessDTO> selectList(int bu_id) {
		return sqlSession.selectList("b.category",bu_id);
	}
	
	public BusinessDTO selectOne(String bu_email) {
		return sqlSession.selectOne("b.loginCheck", bu_email);
	}
	
	public int insert(BusinessDTO dto) {
		return sqlSession.insert("b.insert", dto);
	}
	
}
