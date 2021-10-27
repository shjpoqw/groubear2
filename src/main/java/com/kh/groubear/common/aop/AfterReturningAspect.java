package com.kh.groubear.common.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.kh.groubear.member.model.vo.Member;

@Aspect
@Component
public class AfterReturningAspect {
	
	private static final Logger logger = LoggerFactory.getLogger(AfterReturningAspect.class);
	
	@AfterReturning(pointcut="execution(* com.kh.spring..*ServiceImpl.login*(..))", returning="returnObj")
	public void loggerAdvice(JoinPoint joinpoint, Object returnObj) {
		if(returnObj instanceof Member) {
			Member m = (Member)returnObj;
			if(m.getEmpId().equals("admin")) {
				logger.info("[log] : 관리자님 환영합니다.");
			} else {
				logger.info("[log] : " + m.getEmpId() + " 로그인 성공~!!");
			}
		}
	}

}

