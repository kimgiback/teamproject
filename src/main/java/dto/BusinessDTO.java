package dto;

import lombok.Data;

@Data
public class BusinessDTO {
	
	private String bu_email, bu_password, bu_tel, bu_name, bu_addr, bu_title, approval, bu_pic;
	private int bu_id;

}
