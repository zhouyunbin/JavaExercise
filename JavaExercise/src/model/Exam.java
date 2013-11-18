package model;

import java.util.Date;

public class Exam {
	private int examid;
	private String examtitle;
	private String describe;
	private Date createtime;
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
	 * @return the describe
	 */
	public String getDescribe() {
		return describe;
	}
	/**
	 * @param describe the describe to set
	 */
	public void setDescribe(String describe) {
		this.describe = describe;
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
}
