package datacontroller;

import java.util.List;

import model.Exam;
import model.Examcode;
import model.Examitem;
import model.User;

public class ExamitemController {
	public void addExamitem(Examitem u)
	{
		MySessionFactory.executeAdd(u);
	}
	
	public void deleteExamitem(Examitem u)
	{
		MySessionFactory.executeDelete(u);
	}
	
	public void updateExamitem(Examitem u)
	{
		MySessionFactory.executeUpdate(u);
	}
	
	public List<Examitem> listExamitem(String prop,String value)
	{
		return (List<Examitem>)(Object)MySessionFactory.getByprop("Examitem", prop, value);
	}
	
	public int getExamitemNumber()
	{
		return MySessionFactory.getItemNumber("Examitem");
	}
	
	public List<Examitem> getListByColumn(int start,int size)
	{
		return getListByColumn(start,size,"examitemid");
	}
	
	public List<Examitem> getListByColumn(int start,int size,String column)
	{
		return (List<Examitem>)(Object)MySessionFactory.getByColumn("Examitem", column, start, size);
	}
	
	public Examitem getExamitembyId(int id)
	{
		List<Examitem> li=listExamitem("examitemid",String.valueOf(id));
		if(li.size()>0) return li.get(0);
		return null;
	}
	
	public int getMaxExamitemId()
	{
		List<Examitem> li=(List<Examitem>)(Object)MySessionFactory.getByColumn("Examitem", "examitemid", 0, 1);
		if(li.size()>0) return li.get(0).getExamitemid();
		else return 0;
	}
	
	public void deleteByExamid(int id)
	{
		List<Examitem> li=(List<Examitem>)(Object)MySessionFactory.getByprop("Examitem", "examid", String.valueOf(id));
		int i;
		for(i=0;i<li.size();++i)
		{
			this.deleteExamitem(li.get(i));
		}
	}
	
	public List<Examitem> getByExamid(int id)
	{
		return (List<Examitem>)(Object)MySessionFactory.getByprop("Examitem", "examid", String.valueOf(id));
	}
}
