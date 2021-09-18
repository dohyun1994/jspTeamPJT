package member;

import mvc.database.DBConnection;
import java.sql.*;

public class MemberDAO {
	public boolean checkId(String id) {
		boolean check = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();
			String sql = "select id from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			check = rs.next();
		} catch(Exception ex) {
			System.out.println("checkId()메서드 호출 에러=>" + ex);
		}
		return check;
	}
}
