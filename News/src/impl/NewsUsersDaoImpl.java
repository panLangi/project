package impl;

import java.sql.*;

import dao.BaseDao;
import dao.NewsUsersDao;

public class NewsUsersDaoImpl extends BaseDao implements NewsUsersDao{
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//根据名字和密码查询
	public int findUsers(String name, String pwd) {
		int re = 0;
		try {
			conn = getConnection();
			String sql = "select count(1) from news_users where uname=? and upwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				re = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return re;
	}
}
