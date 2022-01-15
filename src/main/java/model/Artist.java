package model;

public class Artist {
	private int id;
	private String name;
	
//	constructors
	public Artist(int id, String name) {
		this.id = id;
		this.name = name;
	}
	

//	getters and setters
	public void setID(int id) {
		this.id = id;
	}
	
	public int getID() {
		return id;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	
	
	@Override
	public String toString() {
		return String.format("Artist {ID=%d, Name=%s", id, name);
	}
}
