package by.bsuir.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "library_card")
public class LibraryCard {

	@Id
	@GeneratedValue
	private int id;
	@Column(name = "status")
	private int status;
	@Column(name = "exposure_rating")
	private boolean exposureRating;
	@JoinColumn(name = "book_id", referencedColumnName = "id")
	@ManyToOne(cascade = CascadeType.ALL)
	private Book book;
	@JoinColumn(name = "user_id", referencedColumnName = "id")
	@ManyToOne(cascade = CascadeType.ALL)
	private User user;


	public LibraryCard() {
		super();
	}

	public LibraryCard(int status, boolean exposureRating, Book book,
			User user) {
		super();
		this.status = status;
		this.exposureRating = exposureRating;
		this.book = book;
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public boolean isExposureRating() {
		return exposureRating;
	}

	public void setExposureRating(boolean exposureRating) {
		this.exposureRating = exposureRating;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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
		LibraryCard other = (LibraryCard) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	

}
