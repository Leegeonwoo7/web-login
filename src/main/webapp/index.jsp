<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hello</title>
    <style>
        .hide{
            display: none;
        }
        .name_check_message{
            color: red;
            font-size: 8px;
        }

        .id_check_message{
            color: red;
            font-size: 8px;
        }

        .password_check_message{
            color: red;
            font-size: 8px;
        }

        .password_confirm_message{
            color: red;
            font-size: 8px;
        }

        table{
            border-collapse: collapse;
        }
    </style>
</head>
<body>
<form name="form_1" method="post" action="member/write.jsp" onsubmit="return validateForm()">
    <table border="1" cellspacing="5">
        <tr>
            <th>이름</th>
            <td>
                <input type="text" id="name" name="name"><br>
                <div class="name_check_message hide">이름을 입력하세요</div>
                <!-- <div class="fail_message1 hide">아이디는 4~12글자이어야 합니다.</div>
                <div class="fail_message2 hide">영어 또는 숫자만 가능합니다.</div> -->
            </td>
        </tr>

        <tr>
            <th>아이디</th>
            <td>
                <input type="text" id="id" name="id">
                <button onclick="checkId();">중복체크</button>
                <div class="id_check_message hide">아이디를 입력하세요</div>

            </td>
        </tr>

        <tr>
            <th>비밀번호</th>
            <td>
                <input type="password" id="password" name="password">
                <div class="password_check_message hide">비밀번호를 입력해주세요</div>
            </td>
        </tr>

        <tr>
            <th>재확인</th>
            <td>
                <input type="password" id="password_confirm" name="password_confirm">
                <div class="password_confirm_message hide">비밀번호가 일치하지 않습니다</div>
            </td>
        </tr>

        <tr>
            <th>성별</th>
            <td>
                <input type="radio" name="gender" value="0" checked>남성
                <!-- <label for="gender">남성</label> -->
                <input type="radio" name="gender" value="1">여성
                <!-- <label for="gender">여성</label> -->
            </td>
        </tr>

        <tr>
            <th>이메일</th>
            <td>
                <input type="text" name="email1" id="email1">@
                <input type="text" name="email2" id="email2">

                <input type="email" name="email3" list="email4" id="email3" placeholder="직접입력" oninput="change()">
                <datalist id=email4>
                    <option value="naver.com"></option>
                    <option value="gmail.com"></option>
                    <option value="daum.com"></option>
                </datalist>
<%--                <select name="email3" id="email3" style="width: 130px" oninput="change()">--%>
<%--                    <option value="enter_directly">직접입력</option>--%>
<%--                    <option value="naver">naver.com</option>--%>
<%--                    <option value="google">google.com</option>--%>
<%--                    <option value="daum">daum.com</option>--%>
<%--                </select>--%>
            </td>
        </tr>

        <tr>
            <th>휴대폰</th>
            <td>
                <select name="tel1" id="tel1">
                    <option value="010">010</option>
                    <option value="011">011</option>
                    <option value="019">019</option>
                </select>
                -
                <input type="text" name="tel2" minlength="4" maxlength="4">
                -
                <input type="text" name="tel3" minlength="4" maxlength="4">
            </td>
        </tr>

        <tr>
            <th>주소</th>
            <td>
                <input type="text" name="zipcode" id="zipcode">
                <button onclick="checkPost();">우편번호검색</button><br>
                <input type="text" placeholder="주소" name="addr1" id="addr1" size="50" readonly><br>
                <input type="text" placeholder="상세주소" name="addr2" id="addr2" size="50" readonly>
            </td>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <input type="button" id="signup" onclick="checkWrite()" value="회원가입">
                <input type="reset" value="다시작성">
            </td>
        </tr>
    </table>
</form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="member/member.js">
</script>
</body>
</html>