package member.dao;

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
    public static MemberDAO getInstance(){
        return memberDAO;
    }
    public MemberDAO(){
        try{
            Class.forName(driver);
        }catch(ClassNotFoundException e){
            e.printStackTrace();
        }
    }

    public void getConnection(){
        try {
            conn = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean isExistId(String id){
        boolean exist = false;
        String sql = "select * from member where id = ?";

        getConnection();
        try {
            pstmt = conn.prepareStatement(sql); //생성
            pstmt.setString(1, id);
            rs = pstmt.executeQuery(); //실행-ResultSet 리턴

            if(rs.next()) exist = true; //레코드가 존재하기때문에 사용이 불가능
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        return exist;
    }
}
//jar파일넣기 WEB-INF -> lib에 넣기
