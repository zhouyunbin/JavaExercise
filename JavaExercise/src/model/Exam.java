package model;

import java.util.Date;

public class Exam {
	private int examid;
	private String examtitle;
	private String edescribe;
	private Date createtime;
	private int examtime;
	/**
	 * @return the examid
	 */
	public int getExamid() {
		return examid;
	}
	/**
	 * @param examid the examid to set
	 */
	public void setExamid(int examid) {
		this.examid = examid;
	}
	/**
	 * @return the examtitle
	 */
	public String getExamtitle() {
		return examtitle;
	}
	/**
	 * @param examtitle the examtitle to set
	 */
	public void setExamtitle(String examtitle) {
		this.examtitle = examtitle;
	}
	
	/**
	 * @return the createtime
	 */
	public Date getCreatetime() {
		return createtime;
	}
	/**
	 * @param createtime the createtime to set
	 */
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	/**
	 * @return the edescribe
	 */
	public String getEdescribe() {
		return edescribe;
	}
	/**
	 * @param edescribe the edescribe to set
	 */
	public void setEdescribe(String edescribe) {
		this.edescribe = edescribe;
	}
	/**
	 * @return the examtime
	 */
	public int getExamtime() {
		return examtime;
	}
	/**
	 * @param examtime the examtime to set
	 */
	public void setExamtime(int examtime) {
		this.examtime = examtime;
	}
}
