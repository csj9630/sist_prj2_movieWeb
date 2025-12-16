package MovieWithdraw;

import java.sql.SQLException;
import java.sql.Date;

public class MovieWithdrawDAO {
    private static MovieWithdrawDAO wDAO;

    private MovieWithdrawDAO() {
    }

    public static MovieWithdrawDAO getInstance() {
        if (wDAO == null) {
            wDAO = new MovieWithdrawDAO();
        }
        return wDAO;
    }

    /**
     * 로그인 검증 (Mock)
     */
    public boolean selectLogin(String id, String pass) throws SQLException {
        // 실제 코드는 주석 처리
        /*
        boolean flag = false;
        DbConn db = DbConn.getInstance("jdbc/dbcp");
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = db.getConn();
            String sql = "SELECT users_id FROM users WHERE users_id=? AND users_pass=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pass);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                flag = true;
            }
        } finally {
            db.dbClose(rs, pstmt, con);
        }
        return flag;
        */

        // 가데이터 테스트 (Mock)
        if ("test1".equals(id) && "1234".equals(pass)) {
            System.out.println("[MovieWithdrawDAO] Mock Login Success: " + id);
            return true;
        }
        System.out.println("[MovieWithdrawDAO] Mock Login Failed: " + id);
        return false;
    }

    /**
     * 회원 정보 조회 (Mock)
     */
    public MovieWithdrawDTO selectUser(String id) throws SQLException {
        // 실제 코드 주석 처리
        /*
        MovieWithdrawDTO dto = null;
        // ... DB select 로직 ...
        return dto;
        */

        // 가데이터 리턴
        if ("test1".equals(id)) {
            MovieWithdrawDTO dto = new MovieWithdrawDTO();
            dto.setUsers_id("test1");
            dto.setUsers_name("이정우");
            dto.setBirth(Date.valueOf("2000-10-13"));
            dto.setPhone_num("010-1111-1111");
            dto.setEmail("test@naver.com");
            dto.setUsers_pass("1234");
            dto.setActive("활성"); // 테스트를 위해 활성으로 가정
            return dto;
        }
        return null;
    }

    /**
     * 회원 정보 수정 (Mock)
     */
    public int updateUser(MovieWithdrawDTO dto) throws SQLException {
        // 실제 DB Update 로직 주석 처리
        /*
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            // update users set email=?, phone_num=? where users_id=?
        } finally {
            // close
        }
        */
        
        System.out.println("[MovieWithdrawDAO] Mock Update User Info");
        System.out.println("Phone: " + dto.getPhone_num() + ", Email: " + dto.getEmail());
        return 1; // 성공으로 가정
    }

    /**
     * 비밀번호 변경 (Mock)
     */
    public int updatePass(String id, String newPass) throws SQLException {
        // 실제 DB Update 로직 주석 처리
        System.out.println("[MovieWithdrawDAO] Mock Update Password: " + newPass);
        return 1; // 성공
    }

    /**
     * 회원 탈퇴 (Active 상태 변경) (Mock)
     */
    public int updateActive(String id) throws SQLException {
        // 실제 DB Update 로직 (Active -> '비활성')
        System.out.println("[MovieWithdrawDAO] Mock Withdraw User (Active->비활성): " + id);
        return 1; // 성공
    }
}
