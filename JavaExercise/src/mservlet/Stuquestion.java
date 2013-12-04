package mservlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import model.Question;
import datacontroller.QuestionController;

/**
 * Servlet implementation class Stuquestion
 */
@WebServlet("/student/Stuquestion")
public class Stuquestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Stuquestion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cmd=request.getParameter("cmd");
		if(cmd.equals("question"))
		{
			int id=Integer.parseInt(request.getParameter("id"));
			QuestionController qc=new QuestionController();
			Question q;
			q=qc.getQuestionbyId(id);
			JSONObject object = JSONObject.fromObject(q);
			response.getWriter().write(object.toString());
		}
		else if(cmd.equals("next"))
		{
			int id=Integer.parseInt(request.getParameter("id"))-1;
			QuestionController qc=new QuestionController();
			Question q=null;
			q=qc.getQuestionbyId(id);
			while(q==null)
			{
				--id;
				q=qc.getQuestionbyId(id);
				if(id<0) break;
			}
			Map mymap=new HashMap();
			if(q!=null) mymap.put("isend", 0);
			else mymap.put("isend", 1);
			mymap.put("nextid", id);
			JSONObject object = JSONObject.fromObject(mymap);
			response.getWriter().write(object.toString());
			
		}
		else if(cmd.equals("previous"))
		{
			int id=Integer.parseInt(request.getParameter("id"))+1;
			QuestionController qc=new QuestionController();
			Question q=null;
			q=qc.getQuestionbyId(id);
			int maxid=qc.getMaxQuestionId();
			while(q==null)
			{
				++id;
				q=qc.getQuestionbyId(id);
				if(id>maxid) break;
			}
			Map mymap=new HashMap();
			if(q!=null) mymap.put("isend", 0);
			else mymap.put("isend", 1);
			mymap.put("nextid", id);
			JSONObject object = JSONObject.fromObject(mymap);
			response.getWriter().write(object.toString());
		}
		else if(cmd.equals("getanswer"))
		{
			int id=Integer.parseInt(request.getParameter("id"));
			QuestionController qc=new QuestionController();
			Question q1=qc.getQuestionbyId(id);
			Map mymap=new HashMap();
			mymap.put("answer",q1.getRight_answer() );
			if(request.getParameter("answer").equals(q1.getRight_answer()))
				mymap.put("isright", 1);
			else mymap.put("isright", 0);
			JSONObject object = JSONObject.fromObject(mymap);
			response.getWriter().write(object.toString());
		}
	}

}
