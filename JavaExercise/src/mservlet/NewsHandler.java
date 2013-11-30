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

import net.sf.json.JSONObject;
import datacontroller.NewsController;
import model.News;
import model.User;

/**
 * Servlet implementation class NewsHandler
 */
@WebServlet("/admin/NewsHandler")
public class NewsHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsHandler() {
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
		NewsController nc=new NewsController();
		if(cmd.equals("add"))
		{
			News n=new News();
			n.setTitle(request.getParameter("title"));
			User u=(User) request.getSession().getAttribute("user");
			n.setAuthorid(u.getUserid());
			n.setCreatetime(new Date());
			n.setContent(request.getParameter("editor1"));
			System.out.println(n.getTitle());
			nc.addNews(n);
			response.sendRedirect("/admin1/");
			return;
		}
		else if(cmd.equals("modify"))
		{
			News n=new News();
			n.setTitle(request.getParameter("title"));
			User u=(User) request.getSession().getAttribute("user");
			n.setAuthorid(u.getUserid());
			n.setCreatetime(new Date());
			n.setContent(request.getParameter("editor1"));
			n.setNewsid(Integer.parseInt(request.getParameter("uid")));
			System.out.println(n.getTitle());
			nc.updateNews(n);
			response.sendRedirect("/admin1/");
			return;
		}
		else if(cmd.equals("list"))
		{
			Map result=new HashMap();
			List mapList = new ArrayList();  
			int page=Integer.parseInt(request.getParameter("page"));
			int rp=Integer.parseInt(request.getParameter("rp"));
			List<News> li=nc.getListByColumn(page*rp-rp, rp);
			result.put("page", page);
			result.put("total", nc.getNewsNumber());
			
			 for(int i = 0; i < li.size(); i++) {  
		            Map cellMap = new HashMap();    
		            cellMap.put("id", li.get(i).getNewsid());    
		            cellMap.put("cell", new Object [] {li.get(i).getTitle(),li.get(i).getCreatetime().toString()});       
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
			News u=new News();
			u.setNewsid(id);
			nc.deleteNews(u);
			response.getWriter().write("True");
			return;
		}
	}

}
