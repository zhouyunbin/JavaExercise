package mservlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import model.News;
import model.Question;
import datacontroller.QuestionController;

/**
 * Servlet implementation class QuestionHandler
 */
@WebServlet("/admin/QuestionHandler")
public class QuestionHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionHandler() {
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
		if(cmd.equals("add"))
		{
			QuestionController qc=new QuestionController();
			Question q=new Question();
			q.setTitle(request.getParameter("editor1"));
			q.setSelectionA(request.getParameter("editor2"));
			q.setSelectionB(request.getParameter("editor3"));
			q.setSelectionC(request.getParameter("editor4"));
			q.setSelectionD(request.getParameter("editor5"));
			q.setRight_answer(request.getParameter("rightanswer"));
			qc.addQuestion(q);
			response.getWriter().write("True");
			return;
		
		}
		else if(cmd.equals("modify"))
		{
			QuestionController qc=new QuestionController();
			Question q=new Question();
			q.setTitle(request.getParameter("editor1"));
			q.setSelectionA(request.getParameter("editor2"));
			q.setSelectionB(request.getParameter("editor3"));
			q.setSelectionC(request.getParameter("editor4"));
			q.setSelectionD(request.getParameter("editor5"));
			q.setRight_answer(request.getParameter("rightanswer"));
			q.setQuestionid(Integer.parseInt(request.getParameter("questionid")));
			qc.updateQuestion(q);
			response.getWriter().write("True");
			return;
		
		}
		else if(cmd.equals("list"))
		{
			QuestionController qc=new QuestionController();
			Map result=new HashMap();
			List mapList = new ArrayList();  
			int page=Integer.parseInt(request.getParameter("page"));
			int rp=Integer.parseInt(request.getParameter("rp"));
			List<Question> li=qc.getListByColumn(page*rp-rp, rp);
			result.put("page", page);
			result.put("total", qc.getQuestionNumber());
			
			 for(int i = 0; i < li.size(); i++) {  
		            Map cellMap = new HashMap();    
		            cellMap.put("id", li.get(i).getQuestionid()); 
		            if(li.get(i).getTitle().length()>29)
		            	cellMap.put("cell", new Object [] {page*rp-rp+i+1,li.get(i).getTitle().substring(0, 29)});
		            else cellMap.put("cell", new Object [] {page*rp-rp+i+1,li.get(i).getTitle()});
		            mapList.add(cellMap);    
		        }    
			 result.put("rows", mapList);    
			 JSONObject object = JSONObject.fromObject(result);
			 response.getWriter().write(object.toString());
			 return;
		}
		
		else if(cmd.equals("delete"))
		{
			QuestionController qc=new QuestionController();
			int id=Integer.parseInt(request.getParameter("informno"));
			Question u=new Question();
			u.setQuestionid(id);
			qc.deleteQuestion(u);
			response.getWriter().write("True");
			return;
		}
	}

}
