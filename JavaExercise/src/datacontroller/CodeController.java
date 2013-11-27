package datacontroller;

import java.util.List;

import model.Code;
import model.Exam;

public class CodeController {
	public void addCode(Code u)
	{
		MySessionFactory.executeAdd(u);
	}
	
	public void deleteCode(Code u)
	{
		MySessionFactory.executeDelete(u);
	}
	
	public void updateCode(Code u)
	{
		MySessionFactory.executeUpdate(u);
	}
	
	public List<Code> listCode(String prop,String value)
	{
		return (List<Code>)(Object)MySessionFactory.getByprop("Code", prop, value);
	}
	
	public int getCodeNumber()
	{
		return MySessionFactory.getItemNumber("Code");
	}
	
	public List<Code> getListByColumn(int start,int size)
	{
		return getListByColumn(start,size,"codeid");
	}
	
	public List<Code> getListByColumn(int start,int size,String column)
	{
		return (List<Code>)(Object)MySessionFactory.getByColumn("Code", column, start, size);
	}
	
	public Code getCodebyId(int id)
	{
		List<Code> li=listCode("codeid",String.valueOf(id));
		if(li.size()>0) return li.get(0);
		return null;
	}
	
	public int getMaxCodeId()
	{
		List<Code> li=(List<Code>)(Object)MySessionFactory.getByColumn("Code", "codeid", 0, 1);
		if(li.size()>0) return li.get(0).getCodeid();
		else return 0;
	}
	
}
