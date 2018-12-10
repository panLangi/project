package dao;

import java.util.*;

import entity.News;

public interface NewsDao {
	List<News> findNews();
}
