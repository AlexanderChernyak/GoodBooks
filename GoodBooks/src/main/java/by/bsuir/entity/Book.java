package by.bsuir.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "book")
public class Book {
	@Id
	@GeneratedValue
	@Column(name = "id")
	private int id;
	@Column(name = "name")
	private String name;
	@Column(name = "date_of_publication")
	@Temporal(TemporalType.DATE)
	private Date dateOfPublication;
	@Column(name = "description")
	private String description;
	@Column(name = "url")
	private String url;
	@Column(name = "rating")
	private double rating;
	@Column(name = "url_image")
	private String urlImage;
	@Column(name = "count_rate")
	private int countRate;

	public int getCountRate() {
		return countRate;
	}

	public void setCountRate(int countRate) {
		this.countRate = countRate;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}
	
	public void incRating ( double newRating){
		this.rating += newRating;
	}
	
	public void incCountRating( ){
		this.countRate++ ;
	}

	public int getId() {
		return id;
	}

	public Book(String name, Date dateOfPublication, String description,
			String url, double rating, String urlImage) {
		super();
		this.name = name;
		this.dateOfPublication = dateOfPublication;
		this.description = description;
		this.url = url;
		this.rating = rating;
		this.urlImage = urlImage;
	}

	public Book() {
		super();
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

	public Date getDateOfPublication() {
		return dateOfPublication;
	}

	public void setDateOfPublication(Date dateOfPublication) {
		this.dateOfPublication = dateOfPublication;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Double getRating() {
		return rating;
	}

	public void setRating(Double rating) {
		this.rating = rating;
	}

	public String getUrlImage() {
		return urlImage;
	}

	public void setUrlImage(String urlImage) {
		this.urlImage = urlImage;
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
		Book other = (Book) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	
	
}
