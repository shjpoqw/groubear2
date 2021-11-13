package com.kh.groubear.common;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.groubear.jsh.Messenger.controller.MessengerController;
import com.kh.groubear.jsh.Messenger.model.service.MessengerService;
import com.kh.groubear.jsh.Messenger.model.vo.Chat;

@RequestMapping("/websocket")
public class SocketHandler extends TextWebSocketHandler{
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	private static final Logger logger = LoggerFactory.getLogger(MessengerController.class); 
	
	private static final ObjectMapper objectMapper = new ObjectMapper();
	
	@Autowired
	public MessengerService service;
	
	
	// 클라이언트 연결 되었을때 설정
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		logger.info("{ } 연결됨",session.getId());
	}
	
	// 클라이언트가 웹소켓 서버로 메시지를 전송했을때 실행
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 전달 받은 메세지
		String mssg = message.getPayload();
		logger.info("{} 번호, {} 받음", session.getId(), message.getPayload());
		
		Chat chat = objectMapper.readValue(mssg, Chat.class);
		
		// 해당 세션에 뿌려줌
		for(WebSocketSession sess : sessionList) {
			TextMessage msg = new TextMessage(message.getPayload());
			
			// js파일에 sendMessage 함수 실행
			sess.sendMessage(msg);
		}
		
		int result = service.sendMessage(chat);
		if(result == -1) {
			logger.info("메세지 전송 성공");
		} else {
			logger.info("메세지 전송 실패");
		}
	}
	
	// 클라이언트 연결을 끊었을때 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		logger.info("{} 연결끊김",session.getId());
	}
	
	
	
}	
