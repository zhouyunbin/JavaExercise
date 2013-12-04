package datacontroller;

import java.util.Date;
import java.util.List;

import model.Exam;
import model.Examcode;
import model.Examitem;
import model.Question;
import model.Score;
import model.Stuanswer;

public class ExamController {
	public void addExam(Exam u)
	{
		MySessionFactory.executeAdd(u);
	}
	
	public void deleteExam(Exam u)
	{
		MySessionFactory.executeDelete(u);
	}
	
	public void updateExam(Exam u)
	{
		MySessionFactory.executeUpdate(u);
	}
	
	public List<Exam> listExam(String prop,String value)
	{
		return (List<Exam>)(Object)MySessionFactory.getByprop("Exam", prop, value);
	}
	
	public int getExamNumber()
	{
		return MySessionFactory.getItemNumber("Exam");
	}
	
	public List<Exam> getListByColumn(int start,int size)
	{
		return getListByColumn(start,size,"examid");
	}
	
	public List<Exam> getListByColumn(int start,int size,String column)
	{
		return (List<Exam>)(Object)MySessionFactory.getByColumn("Exam", column, start, size);
	}
	
	public Exam getExambyId(int id)
	{
		List<Exam> li=listExam("examid",String.valueOf(id));
		if(li.size()>0) return li.get(0);
		return null;
	}
	
	public int getMaxExamId()
	{
		List<Exam> li=(List<Exam>)(Object)MySessionFactory.getByColumn("Exam", "examid", 0, 1);
		if(li.size()>0) return li.get(0).getExamid();
		else return 0;
	}
	
	public void finishExam(int studentid,int examid)
	{
		
		List<Stuanswer> li=(List<Stuanswer>)(Object)MySessionFactory.executeQuery("From Stuanswer where studentid="+studentid+" and examid="+examid);
		List<Examitem> lei=(List<Examitem>)(Object)MySessionFactory.executeQuery("From Examitem where examid="+examid);
		List<Examcode> lec=(List<Examcode>)(Object)MySessionFactory.executeQuery("From Examcode where examid="+examid);
		int i;
		int cright=0,qright=0;
		for(i=0;i<li.size();i++)
		{
			if(li.get(i).getIsright()==1)
			{
				if(li.get(i).getQuestiontype()==1) qright++;
				else if(li.get(i).getQuestiontype()==2) cright++;
			}	
		}
		Score score=new Score();
		score.setCode_right(cright);
		score.setCode_wrong(lec.size()-cright);
		score.setExamid(examid);
		score.setCreatetime(new Date());
		score.setSelection_right(qright);
		score.setSelection_wrong(lei.size()-qright);
		score.setStudentid(studentid);
		ScoreController sc=new ScoreController();
		sc.addScore(score);
	}
	
	public boolean isFinishExam(int studentid,int examid)
	{
		//List<Score> li=(List<Score>)(Object)MySessionFactory.executeQuery("From Score where studentid="+studentid+" and examid="+examid);
		//if(li==null) return false;
		//else if(li.size()<1) return false;
		return false;
	}
	
}
