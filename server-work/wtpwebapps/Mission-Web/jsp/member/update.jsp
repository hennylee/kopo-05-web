<%@page import="kr.ac.kopo.member.dao.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String tgt = request.getParameter("tgt");
	String str = request.getParameter("str");
	
	memberDAO dao = new memberDAO();
	//dao.update(String tgt, String str);

%>