<%@ page import="member.dao.MemberDAO" %>
<%@ page import="member.bean.MemberDTO" %><%--
  Created by IntelliJ IDEA.
  User: leegeonwoo
  Date: 2/2/24
  Time: 11:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%
    String name = request.getParameter("name");
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    String gender = request.getParameter("gender");
    String email1 = request.getParameter("email1");
    String email2 = request.getParameter("email2");
    String tel1 = request.getParameter("tel1");
    String tel2 = request.getParameter("tel2");
    String tel3 = request.getParameter("tel3");
    String zipcode = request.getParameter("zipcode");
    String addr1 = request.getParameter("addr1");
    String addr2 = request.getParameter("addr2");
    String logtime = request.getParameter("logtime");

    //DB - insert
    MemberDTO memberDTO = new MemberDTO();
    memberDTO.setName(name);
    memberDTO.setId(id);
    memberDTO.setGender(gender);
    memberDTO.setEmail1(email1);
    memberDTO.setEmail2(email2);
    memberDTO.setTel1(tel1);
    memberDTO.setTel2(tel2);
    memberDTO.setTel3(tel3);
    memberDTO.setZipcode(zipcode);
    memberDTO.setAddr1(addr1);
    memberDTO.setAddr2(addr2);
    memberDTO.setPwd(pwd);

    MemberDAO memberDAO = MemberDAO.getInstance();
    boolean su = memberDAO.write(memberDTO);
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%if(su){ %>
        회원가입을 축하합니다.
<%} else {%>
    회원가입 실패하였습니다. <br>
    다시 작성하세요
<%} %>
</body>
</html>
