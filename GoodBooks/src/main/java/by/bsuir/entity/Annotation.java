package by.bsuir.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "annotation")
public class Annotation {

	@Id
	@GeneratedValue
	private int id;

	@JoinColumn(name = "book_id", referencedColumnName = "id")
	@ManyToOne(cascade = CascadeType.ALL)
	private Book book;

	@JoinColumn(name = "author_id", referencedColumnName = "id")
	@ManyToOne(cascade = CascadeType.ALL)
	private Author author;

	public Annotation() {
		super();
	}

	public Annotation(Book book, Author author) {
		super();
		this.book = book;
		this.author = author;
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

	public Author getAuthor() {
		return author;
	}

	public void setAuthor(Author author) {
		this.author = author;
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
		Annotation other = (Annotation) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	

}
