package datacontroller;

import java.util.List;

import model.Question;

public class QuestionController {
	public void addQuestion(Question u)
	{
		MySessionFactory.executeAdd(u);
	}
	
	public void deleteQuestion(Question u)
	{
		MySessionFactory.executeDelete(u);
	}
	
	public void updateQuestion(Question u)
	{
		MySessionFactory.executeUpdate(u);
	}
	
	public List<Question> listQuestion(String prop,String value)
	{
		return (List<Question>)(Object)MySessionFactory.getByprop("Question", prop, value);
	}
	
	public int getQuestionNumber()
	{
		return MySessionFactory.getItemNumber("Question");
	}
	
	public List<Question> getListByColumn(int start,int size)
	{
		return getListByColumn(start,size,"questionid");
	}
	
	public List<Question> getListByColumn(int start,int size,String column)
	{
		return (List<Question>)(Object)MySessionFactory.getByColumn("Question", column, start, size);
	}
	
	public Question getQuestionbyId(int id)
	{
		List<Question> li=listQuestion("questionid",String.valueOf(id));
		if(li.size()>0) return li.get(0);
		return null;
	}
	public int getMaxQuestionId()
	{
		List<Question> li=(List<Question>)(Object)MySessionFactory.getByColumn("Question", "questionid", 0, 1);
		if(li.size()>0) return li.get(0).getQuestionid();
		else return 0;
	}
}
