package member.dao;

import member.bean.MemberDTO;

import java.lang.reflect.Member;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
    private static MemberDAO memberDAO = new MemberDAO();

    private Connection conn;
    private ResultSet rs;
    private PreparedStatement pstmt;
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/world";
    private String username = "root";
    private String password = "1234";

    //world?serverTimezone=UTC
    //싱글톤패턴
    public static MemberDAO getInstance() {
        return memberDAO;
    }

    public MemberDAO() {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void getConnection() {
        try {
            conn = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean isExistId(String id) {
        boolean exist = false; //false이면 중복없음
        String sql = "select * from member where id = ?";

        getConnection();
        try {
            pstmt = conn.prepareStatement(sql); //생성
            pstmt.setString(1, id);
            rs = pstmt.executeQuery(); //실행-ResultSet 리턴

            if (rs.next()) exist = true; //레코드가 존재하기때문에 사용이 불가능
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return exist;
    }

    public boolean write(MemberDTO memberDTO) {
        String sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";

        getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberDTO.getName());
            pstmt.setString(2, memberDTO.getId());
            pstmt.setString(3, memberDTO.getGender());
            pstmt.setString(4, memberDTO.getEmail1());
            pstmt.setString(5, memberDTO.getEmail2());
            pstmt.setString(6, memberDTO.getEmail3());
            pstmt.setString(7, memberDTO.getTel1());
            pstmt.setString(8, memberDTO.getTel2());
            pstmt.setString(9, memberDTO.getTel3());
            pstmt.setString(10, memberDTO.getZipcode());
            pstmt.setString(11, memberDTO.getAddr1());
            pstmt.setString(12, memberDTO.getAddr2());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return true;
    }

    public MemberDTO login(String id, String pwd) {
        MemberDTO memberDTO = null;
        String sql = "SELECT name, id, email, email2, FROM member WHERE id = ? AND pwd = ?";

        getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pwd);

            rs = pstmt.executeQuery();
            if (rs.next()) {
                memberDTO = new MemberDTO();
                memberDTO.setName(rs.getString("name"));
                memberDTO.setId(rs.getString("id"));
                memberDTO.setEmail1(rs.getString("email1"));
                memberDTO.setEmail1(rs.getString("email2"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
                ;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return memberDTO;
    }
}


//jar파일넣기 WEB-INF -> lib에 넣기
