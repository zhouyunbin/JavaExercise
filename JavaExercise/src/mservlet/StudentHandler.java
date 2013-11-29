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
@WebServlet("/StudentHandler")
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
			int j=0;
			 for(int i = page*rp-rp; i < li.size()&&j<rp; i++) {  
				 	++j;
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
		else if(cmd.equals("stulist"))
		{
			Map result=new HashMap();
			List mapList = new ArrayList();  
			StudentController nc =new StudentController();
			int page=Integer.parseInt(request.getParameter("page"));
			int rp=Integer.parseInt(request.getParameter("rp"));
			List<Student> li=nc.getListByColumn(rp*page-rp, rp);
			result.put("page", page);
			result.put("total", nc.getStudentNumber());
			//System.out.print(li.size());
			 for(int i = 0; i < li.size(); i++) {  
		            Map cellMap = new HashMap();    
		            cellMap.put("id", li.get(i).getStudentid());    
		            cellMap.put("cell", new Object [] 
		            		{li.get(i).getUsername(),
		            		li.get(i).getSname(),
		            		li.get(i).getSemail()});       
		            mapList.add(cellMap);    
		        }    
			 result.put("rows", mapList);    
			 JSONObject object = JSONObject.fromObject(result);
			 response.getWriter().write(object.toString());
			 return;	
		}
		else if(cmd.equals("deletestu"))
		{
			String studentid=request.getParameter("stuid");
			Student ssss=new Student();
			ssss.setStudentid(Integer.parseInt(studentid));
			StudentController stc=new StudentController();
			stc.deleteStudent(ssss);
			response.getWriter().write("True");
			return;	
		}
		else if(cmd.equals("stuscore"))
		{
			Map result=new HashMap();
			List mapList = new ArrayList();  
			ScoreController nc =new ScoreController();
			int page=Integer.parseInt(request.getParameter("page"));
			int rp=Integer.parseInt(request.getParameter("rp"));
			String studentid=request.getParameter("studentid");
			List<Score> li=nc.listScore("studentid", studentid);
			result.put("page", page);
			result.put("total", nc.getScoreNumber());
			ExamController ec=new ExamController();
			int j=0;
			 for(int i = page*rp-rp; i < li.size()&&j<rp; i++) { 
				 	++j;
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
		else if(cmd.equals("addstu"))
		{
			String prefix=request.getParameter("prefix");
			String start=request.getParameter("start");
			String end=request.getParameter("end");
			String pwd=request.getParameter("pwd");
			int length=end.length();
			int i,k;
			i=Integer.parseInt(start);
			k=Integer.parseInt(end);
			for(;i<=k;i++)
			{
				Student s1=new Student();
				String stuname=prefix+String.format("%0"+length+"d", i);
				if(sc.hasStudent(stuname)) continue;
				s1.setUsername(stuname);
				s1.setPassword(pwd);
				sc.addStudent(s1);
			}
			response.getWriter().write("True");
			return;
		}
			
	}

}
