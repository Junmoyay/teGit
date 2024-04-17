package kr.ajax.board.service;

import java.io.File;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ajax.board.dao.BoardDAO;
import kr.ajax.board.dto.BoardDTO;

@Service
public class BoardService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired BoardDAO dao;
	
	private String root_path ="C:/upload/";
	

	public int del(List<String> delList) {	
		int cnt = 0;		
		for (String idx : delList) { 
			// 1.게시글에 연결 된 파일 명(new_filename 확보가 필요하다.
			List<String> files = dao.getFiles(idx);
			cnt += dao.del(idx);// 2. bbs에서 해당 글 삭제
			// 3. 파일 삭제
			logger.info("files : {}", files);
			delFile(files);
			
		}
		
		return cnt;
	}

	private void delFile(List<String> files) {
		for(String name : files) {
			File file = new File(name);
			if(file.exists()) {
				file.delete();
			}
		}
		
	}
	
	public List<BoardDTO> list() {
		logger.info("[리스트]서비스 도착");
		
		return dao.list();
	}

}
