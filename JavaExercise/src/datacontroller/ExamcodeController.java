package datacontroller;

import java.util.List;

import model.Exam;
import model.Examcode;
import model.Examitem;

public class ExamcodeController {
	public void addExamcode(Examcode u)
	{
		MySessionFactory.executeAdd(u);
	}
	
	public void deleteExamcode(Examcode u)
	{
		MySessionFactory.executeDelete(u);
	}
	
	public void updateExamcode(Examcode u)
	{
		MySessionFactory.executeUpdate(u);
	}
	
	public List<Examcode> listExamcode(String prop,String value)
	{
		return (List<Examcode>)(Object)MySessionFactory.getByprop("Examcode", prop, value);
	}
	
	public int getExamcodeNumber()
	{
		return MySessionFactory.getItemNumber("Examcode");
	}
	
	public List<Examcode> getListByColumn(int start,int size)
	{
		return getListByColumn(start,size,"examitemid");
	}
	
	public List<Examcode> getListByColumn(int start,int size,String column)
	{
		return (List<Examcode>)(Object)MySessionFactory.getByColumn("Examcode", column, start, size);
	}
	
	public Examcode getExamcodebyId(int id)
	{
		List<Examcode> li=listExamcode("examitemid",String.valueOf(id));
		if(li.size()>0) return li.get(0);
		return null;
	}
	
	public int getMaxExamcodeId()
	{
		List<Examcode> li=(List<Examcode>)(Object)MySessionFactory.getByColumn("Examcode", "examitemid", 0, 1);
		if(li.size()>0) return li.get(0).getExamitemid();
		else return 0;
	}
	
	public void deleteByExamid(int id)
	{
		List<Examcode> li=(List<Examcode>)(Object)MySessionFactory.getByprop("Examcode", "examid", String.valueOf(id));
		int i;
		for(i=0;i<li.size();++i)
		{
			this.deleteExamcode(li.get(i));
		}
	}
	
	public List<Examcode> getByExamid(int id)
	{
		return (List<Examcode>)(Object)MySessionFactory.getByprop("Examcode", "examid", String.valueOf(id));
	}
}
