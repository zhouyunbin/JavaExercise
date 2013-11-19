package datacontroller;

import java.util.List;

import model.News;
import model.User;

public class NewsController {
	public void addNews(News u)
	{
		MySessionFactory.executeAdd(u);
	}
	
	public void deleteNews(News u)
	{
		MySessionFactory.executeDelete(u);
	}
	
	public void updateNews(News u)
	{
		MySessionFactory.executeUpdate(u);
	}
	
	public List<News> listNews(String prop,String value)
	{
		return (List<News>)(Object)MySessionFactory.getByprop("News", prop, value);
	}
	
	public int getNewsNumber()
	{
		return MySessionFactory.getItemNumber("News");
	}
	
	public List<News> getListByColumn(int start,int size)
	{
		return getListByColumn(start,size,"createtime");
	}
	
	public List<News> getListByColumn(int start,int size,String column)
	{
		return (List<News>)(Object)MySessionFactory.getByColumn("News", column, start, size);
	}
	
	public News getNewsbyId(int id)
	{
		List<News> li=listNews("newsid",String.valueOf(id));
		if(li.size()>0) return li.get(0);
		return null;
	}
	
	public String getAuthorByid(int id)
	{
		List<User> li=(List<User>)(Object)MySessionFactory.getByprop("User","userid",String.valueOf(id));
		if(li.size()>0) return li.get(0).getUsername();
		else return null;
	}
}
