package mservlet;

import java.util.TimerTask;

import datacontroller.ExamController;

public class StuScore extends TimerTask {
	public int stuid;
	public int examid;
	@Override
	public void run() {
		// TODO Auto-generated method stub
		ExamController ec=new ExamController();
		if(!ec.isFinishExam(stuid, examid))
			ec.finishExam(stuid, examid);
		this.cancel();
	}

}
