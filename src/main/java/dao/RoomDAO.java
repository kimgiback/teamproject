package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.RoomDTO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class RoomDAO {
	
	final SqlSession sqlSession;
	
	
	//�� �߰��ϱ�
	public int add(RoomDTO dto) {
		return sqlSession.insert("r.room_insert",dto);
	}
	
	//�� ��ü��ȸ
	public List<RoomDTO> selectList(String bu_email) {
		return sqlSession.selectList("r.room_list",bu_email);
	}
	
	//�� �ϳ� ��ȸ
	public RoomDTO selectOne(int ro_num) {
		return sqlSession.selectOne("r.room_selectOne", ro_num);
	}
	
	//���� ���� ����
	public int update(RoomDTO dto) {
		return sqlSession.update("r.room_update",dto);
	}
	
	//���� ����
	public int delete(int num) {
		return sqlSession.delete("r.room_delete",num);
	}
	
	
	
}
