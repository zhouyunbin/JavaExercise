package model;

import java.util.Date;

public class Score {
	private int scoreid;
	private int studentid;
	private int examid;
	private int selection_right;
	private int selection_wrong;
	private int code_right;
	private int code_wrong;
	private Date createtime;
	/**
	 * @return the scoreid
	 */
	public int getScoreid() {
		return scoreid;
	}
	/**
	 * @param scoreid the scoreid to set
	 */
	public void setScoreid(int scoreid) {
		this.scoreid = scoreid;
	}
	/**
	 * @return the studentid
	 */
	public int getStudentid() {
		return studentid;
	}
	/**
	 * @param studentid the studentid to set
	 */
	public void setStudentid(int studentid) {
		this.studentid = studentid;
	}
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
	 * @return the selection_right
	 */
	public int getSelection_right() {
		return selection_right;
	}
	/**
	 * @param selection_right the selection_right to set
	 */
	public void setSelection_right(int selection_right) {
		this.selection_right = selection_right;
	}
	/**
	 * @return the selection_wrong
	 */
	public int getSelection_wrong() {
		return selection_wrong;
	}
	/**
	 * @param selection_wrong the selection_wrong to set
	 */
	public void setSelection_wrong(int selection_wrong) {
		this.selection_wrong = selection_wrong;
	}
	/**
	 * @return the code_right
	 */
	public int getCode_right() {
		return code_right;
	}
	/**
	 * @param code_right the code_right to set
	 */
	public void setCode_right(int code_right) {
		this.code_right = code_right;
	}
	/**
	 * @return the code_wrong
	 */
	public int getCode_wrong() {
		return code_wrong;
	}
	/**
	 * @param code_wrong the code_wrong to set
	 */
	public void setCode_wrong(int code_wrong) {
		this.code_wrong = code_wrong;
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
