package datacontroller;

import java.util.List;

import model.Faq;
import model.User;

public class FaqController {
	public void addFaq(Faq u)
	{
		MySessionFactory.executeAdd(u);
	}
	
	public void deleteFaq(Faq u)
	{
		MySessionFactory.executeDelete(u);
	}
	
	public void updateFaq(Faq u)
	{
		MySessionFactory.executeUpdate(u);
	}
	
	public List<Faq> listFaq(String prop,String value)
	{
		return (List<Faq>)(Object)MySessionFactory.getByprop("Faq", prop, value);
	}
	
	public int getFaqNumber()
	{
		return MySessionFactory.getItemNumber("Faq");
	}
	
	public List<Faq> getListByColumn(int start,int size)
	{
		return getListByColumn(start,size,"createtime");
	}
	
	public List<Faq> getListByColumn(int start,int size,String column)
	{
		return (List<Faq>)(Object)MySessionFactory.getByColumn("Faq", column, start, size);
	}
	
	public Faq getFaqbyId(int id)
	{
		List<Faq> li=listFaq("newsid",String.valueOf(id));
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
