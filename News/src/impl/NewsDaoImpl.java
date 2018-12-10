package impl;

import java.sql.*;
import java.util.*;

import dao.*;
import entity.News;

public class NewsDaoImpl extends BaseDao implements NewsDao{
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public List<News> findNews() {
		List<News> list = new ArrayList<News>();
		try {
			conn = getConnection();
			String sql = "select * from news";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				News news = new News();
				news.setNid(rs.getInt(1));
				news.setNtid(rs.getInt(2));
				news.setNtitle(rs.getString(3));
				news.setNauthor(rs.getString(4));
				news.setNcreateDate(rs.getDate(5));
				news.setNpicPath(rs.getString(6));
				news.setNcontent(rs.getString(7));
				news.setNmodifyDate(rs.getDate(8));
				news.setNsummary(rs.getString(9));
				list.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return list;
	}
}
