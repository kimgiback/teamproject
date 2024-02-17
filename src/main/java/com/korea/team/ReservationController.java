package com.korea.team;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.VisitDAO;
import dto.VisitDTO;
import lombok.RequiredArgsConstructor;
import util.MyCommon;

@Controller
@RequiredArgsConstructor
public class ReservationController {

	@Autowired
	HttpServletRequest request;
	
	
	final VisitDAO visit_dao;
	
	@RequestMapping("rev_list")
	public String select(Model model) {
	List<VisitDTO> list = visit_dao.selectList();
		model.addAttribute("list", list);
		return MyCommon.VIEW_PATH+"visit/reservation.jsp";
	}
	
	@PostMapping(value="up", produces ="application/text; charset=UTF-8")
	@ResponseBody
	public String upload(@RequestBody MultipartFile o_photo) {
		String webPath = "/resources/upload/";
		String savePath = request.getServletContext().getRealPath(webPath);
		System.out.println(savePath);
			
		//MultipartFile photo = o_photo.getPhoto();
		String fileName = "no_file";
		
		if(!o_photo.isEmpty()) {
			fileName = o_photo.getOriginalFilename();
			File saveFile = new File(savePath, fileName);
			
			if(!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				long time = System.currentTimeMillis();
				fileName = String.format("%d_%s", time, fileName);
				saveFile = new File(savePath, fileName);
				
			}
			
			 try {
				 o_photo.transferTo(saveFile);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		String result = String.format("[{'param':'%s'}]", fileName);
		return result;
	}
	
	@RequestMapping("popup")
	public String reservation_inform(Model model) {
		List<VisitDTO> list = visit_dao.selectList();
		model.addAttribute("list", list);
		return MyCommon.VIEW_PATH+"visit/popup.jsp";
	}
	
	@RequestMapping("del")
	public String del(Model model) {
		List<VisitDTO> list = visit_dao.selectList();
		model.addAttribute("list", list);
		return MyCommon.VIEW_PATH+"visit/rev_del.jsp";
	}

	
	@RequestMapping("visit_view")
	@ResponseBody
	public String delete(@RequestBody String m_email) {
		
		System.out.println("email : " + m_email);

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("m_email", m_email);

		int res = visit_dao.delete(map);
		
		String result="no";
		
		if(res==1) {
			result="yes";
					
		}
		String finRes = String.format("[{'res':'%s'}]", result);
		
		return finRes;
	}
		
	@RequestMapping("log_in_up")
	public <UserInfo> String log_in_up(Model model, HttpSession session) {
		List<VisitDTO> list = visit_dao.selectList();
		model.addAttribute("list", list);
		
		 List<String> info = (List<String>) session.getAttribute("info");
	        if (info == null) {
	        	info = new ArrayList<>();
	        }
	       
	        info.add("m_email"); 
	        
	        session.setAttribute("info", info);
		return MyCommon.VIEW_PATH+"visit/log_in_up.jsp";
	}
		
	@RequestMapping("rev_info")
	public String rev_info(Model model) {
		List<VisitDTO> list = visit_dao.selectList();
		model.addAttribute("list", list);
		return MyCommon.VIEW_PATH+"visit/reservation.jsp";
	}
	
	@RequestMapping("my_info")
	public String my_info(Model model) {
		List<VisitDTO> list = visit_dao.select();
		model.addAttribute("list", list);
		return MyCommon.VIEW_PATH+"visit/log_in_up.jsp";
	}
	
	@RequestMapping("log_update")
	public String log_info(Model model) {
		List<VisitDTO> list = visit_dao.selectList();
		model.addAttribute("list", list);
		return MyCommon.VIEW_PATH+"visit/log_in.jsp";
	}
	
	@RequestMapping("log_update_check")
	public String log_update_check(Model model, String m_email) {
		VisitDTO dto = visit_dao.selectOne(m_email);
		model.addAttribute("dto", dto);
		return MyCommon.VIEW_PATH+"visit/log_in.jsp";
	}
	
	
	  @RequestMapping("insert") public String insert(VisitDTO
	  dto, @RequestParam("m_email") String m_email) { dto.setM_email(m_email); int
	  res = visit_dao.insert(dto); return "redirect:log_in_up"; }
	 
	
	@RequestMapping("zzim")
	public String zzim(Model model,VisitDTO dto,HttpSession session) {
		List<VisitDTO> list = visit_dao.selectList();
		model.addAttribute("list", list);
		
		 List<Integer> wishlist = (List<Integer>) session.getAttribute("wishlist");
	        if (wishlist == null) {
	            wishlist = new ArrayList<>();
	        }
	       
	        wishlist.add(dto.getZzim_num()); 
	        
	        session.setAttribute("wishlist", wishlist);
	        
		return MyCommon.VIEW_PATH+"visit/zzim.jsp";
	}
	
	@RequestMapping("usingwon")
	public String usingwon(Model model) {
		List<VisitDTO> list = visit_dao.selectList();
		model.addAttribute("list", list);
		return MyCommon.VIEW_PATH+"visit/usingwon.jsp";
	}
	
	@RequestMapping("rev_del")
	public String rev_del (Model model) {
	List<VisitDTO> list = visit_dao.selectList();
		model.addAttribute("list", list);
		return MyCommon.VIEW_PATH+"visit/visit_view.jsp";
	}
	
	@RequestMapping("usingpop")
	public String usingpop(Model model) {
		List<VisitDTO> list = visit_dao.selectList();
		
		model.addAttribute("list", list);
		return MyCommon.VIEW_PATH+"visit/usingpop.jsp";
	}
	
	@RequestMapping("review")
	@ResponseBody
	public String review(VisitDTO dto) {
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		int res = visit_dao.insert(dto);
	
		String result ="";
		
		if(res > 0) {
			result = "[{'result':'success'}]";
		} else {
			result = "[{'result':'fail'}]";
		}
		return result;
	}
	
	@RequestMapping("wish")
	@ResponseBody
	public String wish(VisitDTO dto, HttpSession session) {
		if (session.getAttribute("m_email") != null) {
	        
	        int res = visit_dao.count(dto); // select
	        String result = "";

	        if (res > 0) {
	            // delete
	            visit_dao.wishDelete(dto);
	            result = "[{'result':'1'}]";
	        } else {
	            // insert
	            visit_dao.wishInsert(dto);
	            result = "[{'result':'0'}]";
	        }
	        return result;
	    } else {
	       
	        return "[{'result':'2'}]"; 
	    }
	}

	
	@RequestMapping("MyReview")
	public String MyReview(Model model, HttpSession session) {
		List<VisitDTO> list = visit_dao.select1();
		model.addAttribute("list", list);
		
		 List<String> info = (List<String>) session.getAttribute("info");
	        if (info == null) {
	        	info = new ArrayList<>();
	        }
	       
	        info.add("m_email"); 
	        
	        session.setAttribute("info", info);
		return MyCommon.VIEW_PATH+"visit/MyReview.jsp";
	}

	
}
		

