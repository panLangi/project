package dao;

import java.util.*;

import entity.Topic;

public interface TopicDao {
	//查询所有主题
	List<Topic> findTopic();
	
	//根据条件查询
	int findTopicName(String name);
	
	//添加主题
	int addTopic(String name);
	
	//删除主题
	int delTopic(int id);
	
	//修改主题
	int upTopic(int id, String name);
}
