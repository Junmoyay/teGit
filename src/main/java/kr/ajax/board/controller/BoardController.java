package kr.ajax.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ajax.board.dto.BoardDTO;
import kr.ajax.board.service.BoardService;

@Controller
public class BoardController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired BoardService boardservice;
	
	// 시작 페이지
	@RequestMapping(value="/")
	public String Start(Model model) {
		logger.info("[시작] 서비스 도착");		
		//List<BoardDTO> list = boardservice.list();
		//model.addAttribute("list",list);
		
		return "list";
	}
	@RequestMapping(value="/list.do")
	@ResponseBody
	public Map<String, Object> listCall(){
		Map<String, Object> map = new HashMap<String, Object>();
		List<BoardDTO> list = boardservice.list();
		map.put("list", list);
		
		return map; //json과 가장 닮은 map을 사용
	}
	
	//배열 형태로 들어오는 경우 따로 명시를 해줘야 한다.
	@RequestMapping(value="/del", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> del(@RequestParam(value="delList[]") List<String>delList){
		logger.info("del list : {}",delList);
		
		int cnt = boardservice.del(delList);
		logger.info("del count :"+cnt);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cnt", cnt);
		
		return map;
	}
	// 400 Bad Request =보내는쪽과 받는쪽의 파라메터 갯수가 맞지 않을때 뜸
	// (value="delList[]") 이렇게 명시함으로써 안뜸

	
	
}
