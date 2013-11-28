package mservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datacontroller.ExamController;
import datacontroller.ExamitemController;
import datacontroller.QuestionController;
import datacontroller.ScoreController;
import datacontroller.StuanswerController;
import model.Exam;
import model.Question;
import model.Score;
import model.Stuanswer;
import model.Student;

import java.util.Date;
import java.util.Timer;
/**
 * Servlet implementation class RunexamHandler
 */
@WebServlet("/RunexamHandler")
public class RunexamHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RunexamHandler() {
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
		if(cmd.equals("start"))
		{
			String examid=request.getParameter("examid");
			ScoreController sc=new ScoreController();
			Student s=(Student) request.getSession().getAttribute("student");
			if(s==null) 
			{
				response.getWriter().write("False");
				return;		
			}
			if(!sc.canExam(s.getStudentid(), Integer.parseInt(examid)))
			{
				response.getWriter().write("False");
				return;		
			}
			Timer t=new Timer();
			StuScore ss=new StuScore();
			ss.stuid=s.getStudentid();
			ExamController ec=new ExamController();
			Exam e=ec.getExambyId(Integer.parseInt(examid));
			ss.examid=e.getExamid();
			t.schedule(ss, e.getExamtime()*1000*60);
			request.getSession().setAttribute("starttime", new Date());
			request.getSession().setAttribute("exam", e);
			response.getWriter().write("True");
			return;		
		}
		else if(cmd.equals("question"))
		{
			String questionid=request.getParameter("questionid");
			Student stu=(Student) request.getSession().getAttribute("student");
			Exam exam=(Exam) request.getSession().getAttribute("exam");
			ScoreController sc=new ScoreController();
			if(!sc.canExam(stu.getStudentid(), exam.getExamid()))
			{
				response.getWriter().write("False");
				return;		
			}
			StuanswerController eic=new StuanswerController();
			QuestionController qc=new QuestionController();
			Stuanswer stuanswer=eic.getByStuidandExamidandQuestionid(stu.getStudentid(), exam.getExamid(), Integer.parseInt(questionid), 1);
			if(stuanswer==null)
			{
				stuanswer=new Stuanswer();
				stuanswer.setExamid(exam.getExamid());
				stuanswer.setQuestionid(Integer.parseInt(questionid));
				
				Question q=qc.getQuestionbyId(Integer.parseInt(questionid));
				String result=request.getParameter("answer");
				if(q.getRight_answer().equals(result)) stuanswer.setIsright(1);
				else stuanswer.setIsright(0);
				stuanswer.setQuestiontype(1);
				stuanswer.setStudentanswer(result);
				stuanswer.setStudentid(stu.getStudentid());
				eic.addStuanswer(stuanswer);
				response.getWriter().write("True");
				return;	
			}
			else
			{
				Question q=qc.getQuestionbyId(Integer.parseInt(questionid));
				String result=request.getParameter("answer");
				if(q.getRight_answer().equals(result)) stuanswer.setIsright(1);
				else stuanswer.setIsright(0);
				stuanswer.setStudentanswer(result);
				eic.updateStuanswer(stuanswer);
				response.getWriter().write("True");
				return;	
			}
		}
		else if(cmd.equals("finish"))
		{
			Student stu=(Student) request.getSession().getAttribute("student");
			Exam exam=(Exam) request.getSession().getAttribute("exam");
			ExamController ec=new ExamController();
			if(!ec.isFinishExam(stu.getStudentid(), exam.getExamid()))
				ec.finishExam(stu.getStudentid(), exam.getExamid());
			response.getWriter().write("True");
			return;	
		}
	}
	

}
