package datacontroller;

import java.security.MessageDigest;
import java.util.List;
import model.Student;


	public class StudentController {
		public void addStudent(Student u)
		{
			u.setPassword(MD5(u.getPassword()));
			MySessionFactory.executeAdd(u);
		}
		
		public void deleteStudent(Student u)
		{
			MySessionFactory.executeDelete(u);
		}
		
		public void updateStudent(Student u)
		{
			MySessionFactory.executeUpdate(u);
		}
		
		public List<Student> listStudent(String prop,String value)
		{
			return (List<Student>)(Object)MySessionFactory.getByprop("Student", prop, value);
		}
		
		public Student getStudent(int Studentid)
		{
			List<Student> li= (List<Student>)(Object)MySessionFactory.executeQuery("From Student u where u.Studentid="+Studentid);
			if(li.size()>0) return li.get(0);
			else return null;
		}
		//返回值为 “true”表示登录成功
		public Student verifyStudent(String name,String password)
		{
			List<Student> li= (List<Student>)(Object)MySessionFactory.executeQuery("From Student u where u.username='"+name+"'");
			if(li.size() == 0) return null;
			else if(li.get(0).getPassword().equals(MD5(password)))
			{
				return li.get(0);
			}
			
			return null;
		}
		
		
		
		//MD5加密函数
		public final static String MD5(String s) {
	        char hexDigits[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};       
	        try {
	            byte[] btInput = s.getBytes();
	            // 获得MD5摘要算法的 MessageDigest 对象
	            MessageDigest mdInst = MessageDigest.getInstance("MD5");
	            // 使用指定的字节更新摘要
	            mdInst.update(btInput);
	            // 获得密文
	            byte[] md = mdInst.digest();
	            // 把密文转换成十六进制的字符串形式
	            int j = md.length;
	            char str[] = new char[j * 2];
	            int k = 0;
	            for (int i = 0; i < j; i++) {
	                byte byte0 = md[i];
	                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
	                str[k++] = hexDigits[byte0 & 0xf];
	            }
	            return new String(str);
	        } catch (Exception e) {
	            e.printStackTrace();
	            return null;
	        }
	    }

	}


