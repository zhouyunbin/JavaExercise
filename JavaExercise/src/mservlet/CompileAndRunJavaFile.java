package mservlet;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
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
import datacontroller.CodeController;
import datacontroller.QuestionController;
import datacontroller.ScoreController;
import datacontroller.StuanswerController;
import model.Code;
import model.Exam;
import model.Question;
import model.Stuanswer;
import model.Student;
import model.Video;

@WebServlet("/admin/CompileAndRunJavaFile")
public class CompileAndRunJavaFile extends HttpServlet {

	private static Process process;// 执行子进程

	/**
	 * 编译并且运行JAVA代码
	 * 
	 * @author zyb
	 */

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String cmd = req.getParameter("cmd");
		
		if(cmd.equals("add"))
		{
			String result=CompileAndRun(req,resp);
			//System.out.print("123:"+result);
			resp.getWriter().write(result);
			return;
		}
		else if(cmd.equals("confirm"))
		{
			Code c=new Code();
			c.setCanswer(CompileAndRun(req,resp));
			c.setTitle(req.getParameter("title"));
			c.setCcontent(req.getParameter("content"));
			c.setCdescribe(req.getParameter("describe"));
			CodeController cc=new CodeController();
			cc.addCode(c);
			resp.sendRedirect("/codelist.jsp");
			return;
		}
		else if(cmd.equals("modify"))
		{
			Code c=new Code();
			c.setCanswer(CompileAndRun(req,resp));
			c.setTitle(req.getParameter("title"));
			c.setCcontent(req.getParameter("content"));
			c.setCdescribe(req.getParameter("describe"));
			c.setCodeid(Integer.parseInt(req.getParameter("uid")));
			CodeController cc=new CodeController();
			cc.updateCode(c);
			resp.sendRedirect("/codelist.jsp");
			return;
		}
		else if(cmd.equals("delete"))
		{
			CodeController nc=new CodeController();
			Code c=new Code();
			c.setCodeid(Integer.parseInt(req.getParameter("informno")));
			nc.deleteCode(c);
			resp.getWriter().write("True");
			return;
		}
		else if (cmd.equals("execute")) {
			Student stu=(Student) req.getSession().getAttribute("student");
			Exam exam=(Exam) req.getSession().getAttribute("exam");
			ScoreController sc=new ScoreController();
			if(!sc.canExam(stu.getStudentid(), exam.getExamid()))
			{
				resp.getWriter().write("False");
				return;		
			}
			
			String id=req.getParameter("codeid");
			CodeController nc=new CodeController();
			Code c=nc.getCodebyId(Integer.parseInt(id));
			StuanswerController eic=new StuanswerController();
			
			int isright;
			String result=CompileAndRun(req,resp);
			if(result.equals(c.getCanswer()))
			{
				isright=1;
			}
			else isright=0;
			
			Stuanswer stuanswer=eic.getByStuidandExamidandQuestionid(stu.getStudentid(), exam.getExamid(), c.getCodeid(), 2);
			if(stuanswer==null)
			{
				stuanswer=new Stuanswer();
				stuanswer.setExamid(exam.getExamid());
				stuanswer.setQuestionid(c.getCodeid());
				stuanswer.setIsright(isright);
				stuanswer.setQuestiontype(2);
				stuanswer.setStudentanswer(result);
				stuanswer.setStudentid(stu.getStudentid());
				eic.addStuanswer(stuanswer);
			}
			else
			{
				stuanswer.setIsright(isright);
				stuanswer.setStudentanswer(result);
				eic.updateStuanswer(stuanswer);
			}
			resp.getWriter().write("True");
			return;			
		}
		else if (cmd.equals("execute2")) {
			String id=req.getParameter("codeid");
			CodeController nc=new CodeController();
			Code c=nc.getCodebyId(Integer.parseInt(id));
			StuanswerController eic=new StuanswerController();
			
			int isright;
			String result=CompileAndRun(req,resp);
			if(result.equals(c.getCanswer()))
			{
				resp.getWriter().write("True");
			}
			else resp.getWriter().write("False");
			return;			
		}
		else if(cmd.equals("list"))
		{
			CodeController nc=new CodeController();
			Map result=new HashMap();
			List mapList = new ArrayList();  
			int page=Integer.parseInt(req.getParameter("page"));
			int rp=Integer.parseInt(req.getParameter("rp"));
			List<Code> li=nc.getListByColumn(page*rp-rp, rp);
			result.put("page", page);
			result.put("total", nc.getCodeNumber());
			
			 for(int i = 0; i < li.size(); i++) {  
		            Map cellMap = new HashMap();    
		            cellMap.put("id", li.get(i).getCodeid());    
		            cellMap.put("cell", new Object [] {li.get(i).getTitle(),li.get(i).getCdescribe()});       
		            mapList.add(cellMap);    
		        }    
			 result.put("rows", mapList);    
			 JSONObject object = JSONObject.fromObject(result);
			 resp.getWriter().write(object.toString());
			 return;
		}

	}
	protected String CompileAndRun(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String className = null; // 类名
		String classStr = null;
		BufferedWriter bw = null;
		String result="";
		String code = req.getParameter("code");
		if(code.indexOf("Runtime")!=-1)
		{
			return "forbidden";
		}
		if(code.indexOf("Process")!=-1)
		{
			return "forbidden";
		}
		try {
			classStr = code.substring(code.indexOf("public class"),
					code.indexOf("{")).toString();// 获取类名字符串
			String[] classStrArray = classStr.split("\\s{1,}");// 按空格分开
			if (classStrArray.length != 3) {
				result+="编译失败：格式不符合规范，请检查类名是否正确(如：public class YouClassName{})";
			} else {
				className = classStrArray[classStrArray.length - 1];
				File sourceFile = new File(className + ".java");// 保存源代码
				if (sourceFile.exists()) {
					sourceFile.delete();
				}
				FileWriter fr = new FileWriter(sourceFile);
				bw = new BufferedWriter(fr);
				bw.write(code);
				bw.close();
				fr.close();

				Runtime runtime = Runtime.getRuntime();
				process = runtime.exec("cmd");
				Thread.sleep(1000);// 防止cmd.exe程序未启动，当然也可以直接使用javac命令
				// 往控制台注入命令
				bw = new BufferedWriter(new OutputStreamWriter(
						process.getOutputStream()));
				//bw.write("chcp 65001 \n");
				bw.write("javac " + className + ".java \n");
				bw.flush();
				//long startFreeMemory = runtime.freeMemory();// Java
															// 虚拟机中的空闲内存量
				// 执行时间也是无法知道，因为dos执行java命令，程序无法知道它到底执行到那里了，两个进程，互不了解
				//long startCurrentTime = System.currentTimeMillis();// 获取系统当前时间
				bw.write("java " + className + " \n");
				bw.close();
				// 获取控制台输出的结果
				RuntimeInput runtimeInput = new RuntimeInput();
				runtimeInput.start();

				// 获取内存信息,实际过程中，是无法得到这个程序到底多少内存，内存的分配有操作系统决定，如果
				// 程序需要，系统会动态分配内存，如果有对象没有引用，可能会被垃圾回收器回收，所以是无法得到到底多少内存的
				// 如果你有办法知道，可以留言,现在得到程序运行前后内存使用率，不过输出的是0，因为程序退出，不占内存了
				runtimeInput.join();
				//long endCurrentTime = System.currentTimeMillis();
				//long endFreeMemory = runtime.freeMemory();
				//double useMemory = (startFreeMemory - endFreeMemory) / 1024;
				// System.out.println("开始时间:"+startCurrentTime);
				// System.out.println("结束时间:"+endCurrentTime);
				//long useTime = endCurrentTime - startCurrentTime;

				//result+= "编译成功,使用时间：" + useTime + "毫秒";// 这个使用时间是大概的,不精确
				result=runtimeInput.result;

			}

		} catch (Exception e) {
			e.printStackTrace();
			result+="格式不符合规范，请检查类名是否正确(如：public class YouClassName{}).错误信息:"+ e.getMessage();
		}

		return result;
	}

	public class RuntimeInput extends Thread {
		public String result = "";

		@Override
		public void run() {
			BufferedReader br = new BufferedReader(new InputStreamReader(
					process.getInputStream()));
			 BufferedReader err = new BufferedReader(new InputStreamReader(process.getErrorStream()));
			String content = null;
			int i=0;
			try {
				while ((content = br.readLine()) != null) {
					System.out.println(content);//如果想把结果输出到页面，直接定义变量就行
					if(i>1)
						result += content;
					i++;
				}
				while ((content =err.readLine()) != null) {
					System.out.println(content);//如果想把结果输出到页面，直接定义变量就行
					if(i>2)
						result += content;
					i++;
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
