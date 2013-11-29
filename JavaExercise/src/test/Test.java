package test;

import java.util.List;

import model.Student;
import datacontroller.StudentController;
import datacontroller.UserController;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//StudentController sc=new StudentController();
		//List<Student> li=sc.getListByColumn(45, 15);
		UserController uc=new UserController();
		System.out.print(uc.hasUser("admin1"));
		

	}

}
