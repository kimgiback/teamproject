package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.ReservationDTO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class ReservationDAO {
	
	final SqlSession sqlSession;	
	
	public List<ReservationDTO> selectList(){
		return sqlSession.selectList("rv.select");
	}
	
	public List<ReservationDTO> search(HashMap<String, String> map){
		System.out.println(map.get("box"));
		System.out.println(map.get("text"));
		return sqlSession.selectList("rv.search",map);
	}
	
	public int checkIn(String num) {
		System.out.println(num);
		return sqlSession.update("rv.checkIn",num);
	}
	
	public int checkOut(String num) {
		return sqlSession.update("rv.checkOut",num);
	}
}
