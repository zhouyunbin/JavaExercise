package datacontroller;

import java.util.List;

import model.Stuanswer;

public class StuanswerController {
	public void addStuanswer(Stuanswer u)
	{
		MySessionFactory.executeAdd(u);
	}
	
	public void deleteStuanswer(Stuanswer u)
	{
		MySessionFactory.executeDelete(u);
	}
	
	public void updateStuanswer(Stuanswer u)
	{
		MySessionFactory.executeUpdate(u);
	}
	
	public List<Stuanswer> listStuanswer(String prop,String value)
	{
		return (List<Stuanswer>)(Object)MySessionFactory.getByprop("Stuanswer", prop, value);
	}
	
	public int getStuanswerNumber()
	{
		return MySessionFactory.getItemNumber("Stuanswer");
	}
	
	public List<Stuanswer> getListByColumn(int start,int size)
	{
		return getListByColumn(start,size,"Stuanswerid");
	}
	
	public List<Stuanswer> getListByColumn(int start,int size,String column)
	{
		return (List<Stuanswer>)(Object)MySessionFactory.getByColumn("Stuanswer", column, start, size);
	}
	
	public Stuanswer getStuanswerbyId(int id)
	{
		List<Stuanswer> li=listStuanswer("Stuanswerid",String.valueOf(id));
		if(li.size()>0) return li.get(0);
		return null;
	}
	
	public int getMaxStuanswerId()
	{
		List<Stuanswer> li=(List<Stuanswer>)(Object)MySessionFactory.getByColumn("Stuanswer", "Stuanswerid", 0, 1);
		if(li.size()>0) return li.get(0).getResultid();
		else return 0;
	}
	
	public Stuanswer getByStuidandExamidandQuestionid(int stuid,int examid, int qid,int qtype)
	{
		List<Stuanswer> li=(List<Stuanswer>)(Object)MySessionFactory.executeQuery("From Stuanswer where studentid="+stuid
				+" and examid="+examid+" and questionid="+qid+" and questiontype="+qtype);
		if(li==null) return null;
		else if(li.size()<1) return null;
		else return li.get(0);
	}
}
