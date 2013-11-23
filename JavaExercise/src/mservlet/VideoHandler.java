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

import model.Video;
import net.sf.json.JSONObject;
import datacontroller.VideoController;

/**
 * Servlet implementation class VideoHandler
 */
@WebServlet("/admin/VideoHandler")
public class VideoHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoHandler() {
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
		VideoController nc=new VideoController();
		if(cmd.equals("add"))
		{
			Video n=new Video();
			n.setVname(request.getParameter("title"));
			n.setVdescribe(request.getParameter("describe"));
			n.setPath(request.getParameter("link"));
			nc.addVideo(n);
			response.sendRedirect("/admin/Videolist.jsp");
			return;
		}
		else if(cmd.equals("list"))
		{
			Map result=new HashMap();
			List mapList = new ArrayList();  
			int page=Integer.parseInt(request.getParameter("page"));
			int rp=Integer.parseInt(request.getParameter("rp"));
			List<Video> li=nc.getListByColumn(page*rp-rp, rp);
			result.put("page", page);
			result.put("total", nc.getVideoNumber());
			
			 for(int i = 0; i < li.size(); i++) {  
		            Map cellMap = new HashMap();    
		            cellMap.put("id", li.get(i).getVideoid());    
		            cellMap.put("cell", new Object [] {li.get(i).getVname(),li.get(i).getVdescribe()});       
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
			Video u=new Video();
			u.setVideoid(id);
			nc.deleteVideo(u);
			response.getWriter().write("True");
			return;
		}
	}

}
