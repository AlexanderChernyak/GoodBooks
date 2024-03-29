package by.bsuir.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="genre")
public class Genre {
	
	@Id
	@GeneratedValue
	private int id;
	@Column(name="name")
	private String name ;
	
	public Genre() {
	}
		
	public Genre(String name) {
		super();		
		this.name = name;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		Genre other = (Genre) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	

	
}
