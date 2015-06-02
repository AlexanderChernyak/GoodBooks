package by.bsuir.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "stylistic")
public class Stylistic {

	@Id
	@GeneratedValue
	private int id ;

	@JoinColumn(name = "book_id", referencedColumnName = "id")
	@ManyToOne(cascade = CascadeType.ALL)
	private Book book;

	@JoinColumn(name = "genre_id", referencedColumnName = "id")
	@ManyToOne(cascade = CascadeType.ALL)
	private Genre genre;

	public Stylistic(Book book, Genre genre) {
		super();
		this.book = book;
		this.genre = genre;
	}

	public Stylistic() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Genre getGenre() {
		return genre;
	}

	public void setGenre(Genre genre) {
		this.genre = genre;
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
		Stylistic other = (Stylistic) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	

}
