package by.bsuir.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "comment")
public class Comment {

	@Id
	@Column(name = "id")
	private int id;
	@Column(name = "text")
	private String text;
	@Column(name = "time_write")
	private Date timeWrite;
	@JoinColumn(name = "library_card_id", referencedColumnName = "id")
	@ManyToOne(cascade = CascadeType.ALL)
	private LibraryCard libraryCard;

	public Comment() {
		super();
	}

	public Comment(String text, Date timeWrite, LibraryCard libraryCard) {
		super();
		this.text = text;
		this.timeWrite = timeWrite;
		this.libraryCard = libraryCard;
	}

	public LibraryCard getLibraryCard() {
		return libraryCard;
	}

	public void setLibraryCard(LibraryCard libraryCard) {
		this.libraryCard = libraryCard;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Date getTimeWrite() {
		return timeWrite;
	}

	public void setTimeWrite(Date timeWrite) {
		this.timeWrite = timeWrite;
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
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Comment other = (Comment) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	

}
