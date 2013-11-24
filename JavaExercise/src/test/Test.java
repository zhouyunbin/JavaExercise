package test;

import model.Student;
import datacontroller.UserController;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		UserController uc=new UserController();
		Student s=new Student();
		s.setSname("搞笑");
		s.setPassword("123456");
		s.setUsername("123456");
		s.setSemail("33@qq.com");
		uc.addStudent(s);

	}

}
