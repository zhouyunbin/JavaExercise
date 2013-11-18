package model;

public class Question {
	private int questionid;
	private String title;
	private String selectionA;
	private String selectionB;
	private String selectionC;
	private String selectionD;
	private String right_answer;
	private int question_type;
	/**
	 * @return the questionid
	 */
	public int getQuestionid() {
		return questionid;
	}
	/**
	 * @param questionid the questionid to set
	 */
	public void setQuestionid(int questionid) {
		this.questionid = questionid;
	}
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the selectionA
	 */
	public String getSelectionA() {
		return selectionA;
	}
	/**
	 * @param selectionA the selectionA to set
	 */
	public void setSelectionA(String selectionA) {
		this.selectionA = selectionA;
	}
	/**
	 * @return the selectionB
	 */
	public String getSelectionB() {
		return selectionB;
	}
	/**
	 * @param selectionB the selectionB to set
	 */
	public void setSelectionB(String selectionB) {
		this.selectionB = selectionB;
	}
	/**
	 * @return the selectionC
	 */
	public String getSelectionC() {
		return selectionC;
	}
	/**
	 * @param selectionC the selectionC to set
	 */
	public void setSelectionC(String selectionC) {
		this.selectionC = selectionC;
	}
	/**
	 * @return the selectionD
	 */
	public String getSelectionD() {
		return selectionD;
	}
	/**
	 * @param selectionD the selectionD to set
	 */
	public void setSelectionD(String selectionD) {
		this.selectionD = selectionD;
	}
	/**
	 * @return the right_answer
	 */
	public String getRight_answer() {
		return right_answer;
	}
	/**
	 * @param right_answer the right_answer to set
	 */
	public void setRight_answer(String right_answer) {
		this.right_answer = right_answer;
	}
	/**
	 * @return the question_type
	 */
	public int getQuestion_type() {
		return question_type;
	}
	/**
	 * @param question_type the question_type to set
	 */
	public void setQuestion_type(int question_type) {
		this.question_type = question_type;
	}

}
