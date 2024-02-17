package com.korea.team;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.BusinessDAO;
import dto.BusinessDTO;
import lombok.RequiredArgsConstructor;
import util.MyCommon;

@Controller
@RequiredArgsConstructor
public class IndexController {

	final BusinessDAO business_dao;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	@RequestMapping(value = {"/","index"})
	public String main(Model model) {
		model.addAttribute(model);
		return MyCommon.VIEW_PATH+"main/index.jsp";
	}
	
	//로그인 방법 선택
	@RequestMapping("login_form")
	public String login_form() {
		return MyCommon.VIEW_PATH+"member/login_form.jsp";
	}
	
	//이메일로 시작하기 선택
	@RequestMapping("login_email")
	public String login_form_user() {
		System.out.println("이메일로그인");
		return MyCommon.VIEW_PATH + "member/login_form_user.jsp";
	}
	
	//비즈니스 로그인
		@RequestMapping("login_business")
		public String login_form_business() {
			System.out.println("비즈니스 로그인");
			return MyCommon.VIEW_PATH + "business/login_form_business.jsp";
		}
	
	
	//카테고리별로 보기
	@RequestMapping("category")
	public String view_accomoList(Model model, @RequestParam(value = "bu_id", required = true)int bu_id) {
		
		List<BusinessDTO> list = business_dao.selectList(bu_id);
		model.addAttribute("list",list);
		
		return MyCommon.VIEW_PATH+"main/category.jsp?bu_id=" + bu_id;
	}
	
}
