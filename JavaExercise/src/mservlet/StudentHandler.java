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
import datacontroller.ExamController;
import datacontroller.ScoreController;
import datacontroller.StudentController;
import model.News;
import model.Score;
import model.Student;

/**
 * Servlet implementation class StudentHandler
 */
@WebServlet("/student/StudentHandler")
public class StudentHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentHandler() {
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
		Student s=(Student) request.getSession().getAttribute("student");
		StudentController sc=new StudentController();
		if(cmd.equals("changename"))
		{
			s.setSname(request.getParameter("name"));
			sc.updateStudent(s);
			response.getWriter().write("True");
			return;
		}
		else if(cmd.equals("changemail"))
		{
			s.setSemail(request.getParameter("email"));
			sc.updateStudent(s);
			response.getWriter().write("True");
			return;
		}
		else if(cmd.equals("changepwd"))
		{
			String oldword=request.getParameter("opwd");
			if(s.getPassword().equals(sc.MD5(oldword)))
			{
				s.setPassword(sc.MD5(request.getParameter("npwd")));
				sc.updateStudent(s);
				response.getWriter().write("True");
			}
			else response.getWriter().write("False");
			return;
		}
		else if(cmd.equals("listscore"))
		{
			Map result=new HashMap();
			List mapList = new ArrayList();  
			ScoreController nc =new ScoreController();
			int page=Integer.parseInt(request.getParameter("page"));
			int rp=Integer.parseInt(request.getParameter("rp"));
			List<Score> li=nc.listScore("studentid", String.valueOf(s.getStudentid()));
			result.put("page", page);
			result.put("total", nc.getScoreNumber());
			ExamController ec=new ExamController();
			 for(int i = page*rp-rp; i < li.size()&&i<rp; i++) {  
		            Map cellMap = new HashMap();    
		            cellMap.put("id", li.get(i).getScoreid());    
		            cellMap.put("cell", new Object [] 
		            		{ec.getExambyId(li.get(i).getExamid()).getExamtitle(),
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
