package mservlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Exam;
import model.Examcode;
import model.Examitem;
import model.News;
import model.Score;
import model.Student;
import net.sf.json.JSONObject;
import datacontroller.CodeController;
import datacontroller.ExamController;
import datacontroller.ExamcodeController;
import datacontroller.ExamitemController;
import datacontroller.NewsController;
import datacontroller.QuestionController;
import datacontroller.ScoreController;
import datacontroller.StudentController;

/**
 * Servlet implementation class ExamHandler
 */
@WebServlet("/admin/ExamHandler")
public class ExamHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExamHandler() {
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
		ExamController ec=new ExamController();
		ExamitemController eic=new ExamitemController();
		ExamcodeController ecc=new ExamcodeController();
		QuestionController qc=new QuestionController();
		CodeController cc=new CodeController();
		if(cmd.equals("add"))
		{
			Exam e=new Exam();
			e.setExamtitle(request.getParameter("title"));
			e.setCreatetime(new Date());
			e.setEdescribe(request.getParameter("describe"));
			e.setExamtime(Integer.parseInt(request.getParameter("examtime")));
			ec.addExam(e);
			e=ec.getExambyId(ec.getMaxExamId());
			int i;
			for(i=0;i<=qc.getMaxQuestionId();++i)
			{
				String id=request.getParameter("q_"+i);
				if(id!=null)
				{
					Examitem ei=new Examitem();
					ei.setExamid(e.getExamid());
					ei.setQuestionid(Integer.parseInt(id));
					eic.addExamitem(ei);
				}
			}
			for(i=0;i<=cc.getMaxCodeId();++i)
			{
				String id=request.getParameter("c_"+i);
				if(id!=null)
				{
					Examcode ei=new Examcode();
					ei.setExamid(e.getExamid());
					ei.setCodeid(Integer.parseInt(id));
					ecc.addExamcode(ei);
				}
			}
			response.getWriter().write("True");
			return;
		}
		else if(cmd.equals("list"))
		{
			Map result=new HashMap();
			List mapList = new ArrayList();  
			int page=Integer.parseInt(request.getParameter("page"));
			int rp=Integer.parseInt(request.getParameter("rp"));
			List<Exam> li=ec.getListByColumn(page*rp-rp, rp);
			result.put("page", page);
			result.put("total", ec.getExamNumber());
			
			 for(int i = 0; i < li.size(); i++) {  
		            Map cellMap = new HashMap();    
		            cellMap.put("id", li.get(i).getExamid());    
		            cellMap.put("cell", new Object [] {li.get(i).getExamtitle(),li.get(i).getEdescribe(),li.get(i).getExamtime(),li.get(i).getCreatetime().toString()});       
		            mapList.add(cellMap);    
		        }    
			 result.put("rows", mapList);    
			 JSONObject object = JSONObject.fromObject(result);
			 response.getWriter().write(object.toString());
			 return;
		}
		else if(cmd.equals("delete"))
		{
			int id=Integer.parseInt(request.getParameter("informno"));
			Exam u=new Exam();
			u.setExamid(id);
			ecc.deleteByExamid(id);
			eic.deleteByExamid(id);
			ec.deleteExam(u);	
			response.getWriter().write("True");
			return;
		}
		else if(cmd.equals("stulist"))
		{
			Map result=new HashMap();
			List mapList = new ArrayList();  
			int page=Integer.parseInt(request.getParameter("page"));
			int rp=Integer.parseInt(request.getParameter("rp"));
			String examid=request.getParameter("examid");
			ScoreController sc=new ScoreController();
			List<Score> li=sc.listScore("examid", examid);
			result.put("page", page);
			result.put("total", ec.getExamNumber());
			StudentController stuc=new StudentController();
			
			 for(int i = rp*page-rp; i < li.size()&&i<rp*page; i++) {  
		            Map cellMap = new HashMap();    
		            cellMap.put("id", li.get(i).getScoreid());  
		            Student stu=stuc.getStudent(li.get(i).getStudentid());
		            //System.out.println(li.get(i).getStudentid());
		            cellMap.put("cell", new Object [] {stu.getUsername(),
		            		stu.getSname(),
		            		ec.getExambyId(li.get(i).getExamid()).getExamtitle(),
		            		li.get(i).getSelection_right(),
		            		li.get(i).getSelection_wrong(),
		            		li.get(i).getCode_right(),
		            		li.get(i).getCode_wrong(),
		            		li.get(i).getCreatetime().toString()});       
		            mapList.add(cellMap);    
		        }    
			 result.put("rows", mapList);    
			 JSONObject object = JSONObject.fromObject(result);
			 response.getWriter().write(object.toString());
			 return;
		}
	}

}
