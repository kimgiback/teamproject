package dto;

import org.springframework.web.multipart.MultipartFile;
import lombok.Data;

@Data
public class VisitDTO {
	private String title;
	private String filename;
	private MultipartFile photo; 
	
	private int re_num;
	private String m_email;
	private int ro_num;
	private String bu_title;
	private String ro_name;
	private String checkin_date;
	private String checkout_date;
	private String status;
	private String payment;
	private String price;
	private String regdate;
	
	private String m_pwd;
	private String m_name;
	private String m_tel;
		
	private String content;
	private int rev_num;
	private String score;
	private String content_reply;
	private String report;
	private String regidate;

	private String bu_email;
	private int zzim_num;
}
