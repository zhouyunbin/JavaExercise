package mservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	}

}
