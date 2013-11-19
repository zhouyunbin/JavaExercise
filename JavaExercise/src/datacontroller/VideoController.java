package datacontroller;

import java.util.List;

import model.Video;

public class VideoController {
	public void addVideo(Video u)
	{
		MySessionFactory.executeAdd(u);
	}
	
	public void deleteVideo(Video u)
	{
		MySessionFactory.executeDelete(u);
	}
	
	public void updateVideo(Video u)
	{
		MySessionFactory.executeUpdate(u);
	}
	
	public List<Video> listVideo(String prop,String value)
	{
		return (List<Video>)(Object)MySessionFactory.getByprop("Video", prop, value);
	}
	
	public int getVideoNumber()
	{
		return MySessionFactory.getItemNumber("Video");
	}
	
	public List<Video> getListByColumn(int start,int size)
	{
		return getListByColumn(start,size,"videoid");
	}
	
	public List<Video> getListByColumn(int start,int size,String column)
	{
		return (List<Video>)(Object)MySessionFactory.getByColumn("Video", column, start, size);
	}
	
	public Video getVideobyId(int id)
	{
		List<Video> li=listVideo("videoid",String.valueOf(id));
		if(li.size()>0) return li.get(0);
		return null;
	}
}
