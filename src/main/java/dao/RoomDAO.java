package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.RoomDTO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class RoomDAO {
	
	final SqlSession sqlSession;
	
	
	//방 추가하기
	public int add(RoomDTO dto) {
		return sqlSession.insert("r.room_insert",dto);
	}
	
	//방 전체조회
	public List<RoomDTO> selectList(String bu_email) {
		return sqlSession.selectList("r.room_list",bu_email);
	}
	
	//방 하나 조회
	public RoomDTO selectOne(int ro_num) {
		return sqlSession.selectOne("r.room_selectOne", ro_num);
	}
	
	//객실 정보 수정
	public int update(RoomDTO dto) {
		return sqlSession.update("r.room_update",dto);
	}
	
	//객실 삭제
	public int delete(int num) {
		return sqlSession.delete("r.room_delete",num);
	}
	
	
	
}
