package datacontroller;

import java.util.Date;
import java.util.List;

import model.Exam;
import model.Score;

public class ScoreController {
	public void addScore(Score u)
	{
		MySessionFactory.executeAdd(u);
	}
	
	public void deleteScore(Score u)
	{
		MySessionFactory.executeDelete(u);
	}
	
	public void updateScore(Score u)
	{
		MySessionFactory.executeUpdate(u);
	}
	
	public List<Score> listScore(String prop,String value)
	{
		return (List<Score>)(Object)MySessionFactory.getByprop("Score", prop, value);
	}
	
	public int getScoreNumber()
	{
		return MySessionFactory.getItemNumber("Score");
	}
	
	public List<Score> getListByColumn(int start,int size)
	{
		return getListByColumn(start,size,"scoreid");
	}
	
	public List<Score> getListByColumn(int start,int size,String column)
	{
		return (List<Score>)(Object)MySessionFactory.getByColumn("Score", column, start, size);
	}
	
	public Score getScorebyId(int id)
	{
		List<Score> li=listScore("scoreid",String.valueOf(id));
		if(li.size()>0) return li.get(0);
		return null;
	}
	
	public int getMaxScoreId()
	{
		List<Score> li=(List<Score>)(Object)MySessionFactory.getByColumn("Score", "scoreid", 0, 1);
		if(li.size()>0) return li.get(0).getScoreid();
		else return 0;
	}
	
	public boolean canExam(int studentid,int examid)
	{
		List<Score> li=(List<Score>)(Object)MySessionFactory.executeQuery("From Score where studentid="+studentid+" and examid="+examid);
		if(li==null) return true;
		else if(li.size()<1) return true;
		else 
		{
			Date now =new Date();
			Score ss=li.get(0);
			ExamController ec=new ExamController();
			Exam e=ec.getExambyId(examid);
			if((now.getTime()-ss.getCreatetime().getTime()/(1000*60))>e.getExamtime())
				return false;
		}
		return true;
	
	}
}
