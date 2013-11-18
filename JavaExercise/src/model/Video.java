package model;

public class Video {
	private int videoid;
	private String name;
	private String describe;
	private String path;
	/**
	 * @return the videoid
	 */
	public int getVideoid() {
		return videoid;
	}
	/**
	 * @param videoid the videoid to set
	 */
	public void setVideoid(int videoid) {
		this.videoid = videoid;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
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
	 * @return the path
	 */
	public String getPath() {
		return path;
	}
	/**
	 * @param path the path to set
	 */
	public void setPath(String path) {
		this.path = path;
	}
}
