package by.bsuir.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import by.bsuir.entity.Annotation;
import by.bsuir.entity.Author;
import by.bsuir.entity.Book;
import by.bsuir.entity.Comment;
import by.bsuir.entity.Genre;
import by.bsuir.entity.LibraryCard;
import by.bsuir.entity.Stylistic;

public class HelpController {
	
	public static List<Book> getBooksByUserAndStatus(String name, int status)
			throws SQLException {
		List<Book> books = new ArrayList<Book>();
		List<LibraryCard> cards = Factory.getLibraryCardDAO().getAll();
		for (LibraryCard card : cards) {
			if (card.getUser().getUsername().equals(name)
					&& card.getStatus() == status) {
				books.add(card.getBook());
			}
		}
		return books;
	}
	
	public static List<Author> getAuthorByBook(Book book) throws SQLException {
		List<Annotation> annotations = Factory.getInstance().getAnnotationDAO()
				.getAll();
		List<Author> authors = new ArrayList<Author>();

		for (Annotation annotation : annotations) {
			if (book.equals(annotation.getBook())) {
				authors.add(annotation.getAuthor());
			}
		}

		return authors;
	}

	public static LibraryCard getLibraryCardByUsernameAndBook(String username,
			Book book) throws SQLException {
		List<LibraryCard> cards = Factory.getInstance().getLibraryCardDAO()
				.getAll();
		for (LibraryCard card : cards) {
			if (card.getUser().getUsername().equals(username)
					&& card.getBook().equals(book)) {
				return card;
			}
		}
		return null;
	}
	public static List<Comment> getCommentsByBook(Book book) throws SQLException {
		List<Comment> comments = Factory.getInstance().getCommentDAO().getAll();
		List<Comment> result = new ArrayList<Comment>();
		for (Comment current : comments) {
			if (current.getLibraryCard().getBook().equals(book)) {
				result.add(current);
			}
		}

		return result;
	}

	public static List<Genre> getGenreByBook(Book book) throws SQLException {
		List<Stylistic> stylistics = Factory.getInstance().getStylisticDAO()
				.getAll();
		List<Genre> genres = new ArrayList<Genre>();
		for (Stylistic stylistic : stylistics) {
			if (stylistic.getBook().equals(book)) {
				genres.add(stylistic.getGenre());
			}
		}
		return genres;
	}

	public static by.bsuir.entity.User getUserByUsername(String username)
			throws SQLException {
		List<by.bsuir.entity.User> users = Factory.getInstance().getUserDAO()
				.getAll();

		for (by.bsuir.entity.User user : users) {
			if (user.getUsername().equals(username))
				return user;
		}
		return null;
	}
	
	public static List<Book> getBooksByName(List<Book> books, String name) {
		List<Book> result = new ArrayList<Book>();
		if (name.equals(""))
			return books;
		else {
			for (Book book : books) {
				if (book.getName().equals(name))
					result.add(book);
			}
		}
		return result;
	}

	public static List<Book> getBookByAuthor(List<Book> books, String authorId)
			throws NumberFormatException, SQLException {
		List<Book> result = new ArrayList<Book>();
		if (authorId.equals("*"))
			return books;
		else {
			Author author = Factory.getInstance().getAuthorDAO()
					.getById(new Integer(authorId));
			List<Annotation> annotations = Factory.getInstance()
					.getAnnotationDAO().getAll();
			for (Annotation annotation : annotations) {
				for (Book book : books) {
					if (annotation.getBook().equals(book)
							&& annotation.getAuthor().equals(author))
						result.add(book);
				}
			}
		}
		return result;
	}

	public static List<Book> getBookByGenre(List<Book> books, String genreId)
			throws NumberFormatException, SQLException {
		List<Book> result = new ArrayList<Book>();
		if (genreId.equals("*"))
			return books;
		else {
			Genre genre = Factory.getInstance().getGenreDAO()
					.getById(new Integer(genreId));
			List<Stylistic> stylistics = Factory.getInstance()
					.getStylisticDAO().getAll();
			for (Stylistic stylistic : stylistics) {
				for (Book book : books) {
					if (stylistic.getBook().equals(book)
							&& stylistic.getGenre().equals(genre))
						result.add(book);
				}
			}
		}
		return result;
	}

}
