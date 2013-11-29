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
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import model.Student;
import model.User;
import datacontroller.StudentController;
import datacontroller.UserController;

/**
 * Servlet implementation class UserHandler
 */
@WebServlet("/UserHandler")
public class UserHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserHandler() {
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
		UserController uc=new UserController();
		String cmd=request.getParameter("cmd");
		User user=(User)request.getSession().getAttribute("user");
		if(cmd.equals("login"))
		{
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			Student s=uc.verifyStudent(username, password);
			if(s!=null)
			{
				HttpSession sion=request.getSession();
				sion.setAttribute("student", s);
				response.getWriter().write("True");
				return;
			}
			response.getWriter().write("False");
			return;
		}
		else if(cmd.equals("mlogin"))
		{
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			User u=uc.verifyUser(username, password);
			if(u!=null)
			{
				HttpSession sion=request.getSession();
				sion.setAttribute("user", u);
				response.getWriter().write("True");
				return;
			}
			response.getWriter().write("False");
			return;
		}
		else if(cmd.equals("changedepart"))
		{
			user.setDepartment(request.getParameter("department"));
			uc.updateUser(user);
			response.getWriter().write("True");
			return;
		}
		else if(cmd.equals("changemail"))
		{
			user.setEmail(request.getParameter("email"));
			uc.updateUser(user);
			response.getWriter().write("True");
			return;
		}
		else if(cmd.equals("changepwd"))
		{
			String oldword=request.getParameter("opwd");
			if(user.getPassword().equals(uc.MD5(oldword)))
			{
				user.setPassword(uc.MD5(request.getParameter("npwd")));
				uc.updateUser(user);
				response.getWriter().write("True");
			}
			else response.getWriter().write("False");
			return;
		}
		else if(cmd.equals("delete"))
		{
			int uid=Integer.parseInt(request.getParameter("informno"));
			User u=uc.getUser(uid);
			if(!u.getUsername().equals("admin"))
			{
				uc.deleteUser(u);
				response.getWriter().write("True");
				return;
			}
			response.getWriter().write("False");
			return;
		}
		else if(cmd.equals("adduser"))
		{
			User u=new User();
			if(uc.hasUser(request.getParameter("username")))
			{
				response.getWriter().write("False");
				return;
			}
			u.setDepartment(request.getParameter("department"));
			u.setEmail(request.getParameter("email"));
			u.setUsername(request.getParameter("username"));
			u.setPassword(request.getParameter("password"));
			uc.addUser(u);
			response.getWriter().write("True");	
			return;
		}
		else if(cmd.equals("list"))
		{
			Map result=new HashMap();
			List mapList = new ArrayList();  
			StudentController nc =new StudentController();
			int page=Integer.parseInt(request.getParameter("page"));
			int rp=Integer.parseInt(request.getParameter("rp"));
			List<User> li=uc.getListByColumn(rp*page-rp, rp);
			result.put("page", page);
			result.put("total", uc.getUserNumber());
			//System.out.print(li.size());
			 for(int i = 0; i < li.size(); i++) {  
		            Map cellMap = new HashMap();    
		            cellMap.put("id", li.get(i).getUserid());    
		            cellMap.put("cell", new Object [] 
		            		{li.get(i).getUsername(),
		            		li.get(i).getDepartment(),
		            		li.get(i).getEmail()});       
		            mapList.add(cellMap);    
		        }    
			 result.put("rows", mapList);    
			 JSONObject object = JSONObject.fromObject(result);
			 response.getWriter().write(object.toString());
			 return;	
		}
	}

}
