package com.kh.groubear.jsh.Messenger.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.groubear.jsh.Messenger.model.vo.MemberMsg;
import com.kh.groubear.jsh.Messenger.model.vo.Messenger;
import com.kh.groubear.jsh.Messenger.model.vo.StateMessage;
import com.kh.groubear.member.model.vo.Member;

public interface MessengerService {

	ArrayList<MemberMsg> memberList(HashMap<String, Object> map1);

	MemberMsg loginMember(Member user);

	void updateStateMessage(StateMessage stateMessage);

	ArrayList<Messenger> msgList(HashMap<String, Object> map3);

	void insertMsg(Messenger insertMsg);

}
