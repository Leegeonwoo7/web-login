document.getElementById('name').value="";
document.getElementById('id').value="";
document.getElementById('password').value="";
document.getElementById('signup').addEventListener('click', check);
function check(){
    name_check();
    id_check();
    password_check();
    confirm_password();
}
function name_check(){
    if(document.getElementById('name').value.length == 0){
        document.getElementById('name').focus();
        document.querySelector('.name_check_message').classList.remove('hide');
    }else {
        document.querySelector('.name_check_message').classList.add('hide');
    }
}

function id_check(){
    if(document.getElementById('id').value.length == 0){
        document.getElementById('id').focus();
        document.querySelector('.id_check_message').classList.remove('hide');
    }else{
        document.querySelector('.id_check_message').classList.add('hide');
    }
}

function password_check(){
    if(document.getElementById('password').value.length == 0){
        document.getElementById('password').focus();
        document.querySelector('.password_check_message').classList.remove('hide');
    }else{
        document.querySelector('.password_check_message').classList.add('hide');
    }
}

function confirm_password(){
    if(document.getElementById('password_confirm').value !== document.getElementById('password').value){
        document.querySelector('.password_confirm_message').classList.remove('hide');
    }else{
        document.querySelector('.password_confirm_message').classList.add('hide');
    }
}

function change(){
    document.getElementById('email2').value = document.getElementById('email3').value;
}

function checkPost(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }



            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("addr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr2").focus();
        }
    }).open();
}

function checkId(){
    if(document.getElementById('id').value.length === 0){
        alert("아이디를 입력해주세요");
    }else{
        window.open("http://localhost:8080/member/checkId.jsp?id=" + (document.getElementById('id').value),
            "checkId",
            "width = 450 height=150 top=150 left=150");
    }
}

/*
if(document.getElementById("name").value == ""){
    document.getElementById("name_check_maessage").innerText = "이름 입력";
    ~~~
 else
 document.getElementById("writeForm").submit();
}
 */