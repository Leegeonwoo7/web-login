<%@ page import="member.dao.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: leegeonwoo
  Date: 2/1/24
  Time: 12:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");

    //DB
    MemberDAO memberDAO = MemberDAO.getInstance();
    boolean exist = memberDAO.isExistId(id);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%if(exist){ %>
    <form action="checkId.jsp">
        <font color="red"><strong>선택하신 아이디<%=id %>은 사용 불가능</strong></font>
        <br><br>
        아이디 <input type="text" name="id">
        <input type="submit" value="중복체크">
    </form>
<%} else {%>
    <font color="blue"><strong>선택하신 아이디<%=id %>는 사용 가능합니다</strong></font>
    <br><br>
    <input type="button" value="사용하기" onclick="checkIdClose('<%=id %>')">
<%} %>

<script type="text/javascript">
    function checkIdClose(id){
        opener.document.getElementById("id").value = id; //현재열려있는 윈도우 창이아닌 회원가입 form밸류에 삽입
        window.close();

        opener.document.getElementById("pwd").focus();
    }
</script>
</body>
</html>
