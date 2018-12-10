package impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.*;
import entity.Topic;

public class TopicDaoImpl extends BaseDao implements TopicDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	// 查询全部主题
	public List<Topic> findTopic() {
		List<Topic> list = new ArrayList<Topic>();
		try {
			conn = getConnection();
			String sql = "select * from topic;";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Topic topic = new Topic();
				topic.settId(rs.getInt(1));
				topic.settName(rs.getString(2));
				list.add(topic);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return list;
	}

	// 根据条件查询主题
	public int findTopicName(String name) {
		int re = 0;
		try {
			conn = getConnection();
			String sql = "select count(1) from topic where tname = ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
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

	// 添加新闻主题
	public int addTopic(String name) {
		int re = 0;
		String sql = "insert into topic values(null,?);";
		Object[] param = { name };
		re = executeUpdate(sql, param);
		return re;
	}

	// 删除主题
	public int delTopic(int id) {
		int re = 0;
		String sql = "delete from topic where tid = ?;";
		Object[] param = { id };
		re = executeUpdate(sql, param);
		return re;
	}

	// 修改主题
	public int upTopic(int id, String name) {
		int re = 0;
		String sql = "update topic set tname=? where tid=?";
		Object[] param = { name, id };
		re = executeUpdate(sql, param);
		return re;
	}
}
