package model;

public class Artist {
	private Long id;
	private String name;
	
//	constructors
	public Artist() {
	}
	
	public Artist(String name) {
		this.name = name;
	}
	
	public Artist(Long id, String name) {
		this.id = id;
		this.name = name;
	}
	

//	getters and setters
	public void setID(Long id) {
		this.id = id;
	}
	
	public Long getID() {
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
