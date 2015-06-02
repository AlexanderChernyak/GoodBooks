package by.bsuir.service;

import by.bsuir.dao.DAO;
import by.bsuir.dao.DAOImpl;
import by.bsuir.entity.Annotation;
import by.bsuir.entity.Author;
import by.bsuir.entity.Book;
import by.bsuir.entity.Comment;
import by.bsuir.entity.Genre;
import by.bsuir.entity.LibraryCard;
import by.bsuir.entity.Stylistic;
import by.bsuir.entity.Suggest;
import by.bsuir.entity.User;
import by.bsuir.entity.UserRole;

public class Factory {

	private static Factory instance = null;
	private static DAO<Annotation> annotationDAO = null ;
	private static DAO<Author> authorDAO = null ;
	private static DAO<Book> bookDAO = null ;
	private static DAO<Comment> commentDAO = null ;
	private static DAO<Genre> genreDAO = null ;
	private static DAO<LibraryCard> libraryCardDAO = null ;
	private static DAO<Stylistic> stylisticDAO = null ;
	private static DAO<User> userDAO = null ;
	private static DAO<UserRole> userRoleDAO = null ;
	private static DAO<Suggest> suggestDAO = null ;

	public static synchronized Factory getInstance() {
		if (instance == null) {
			instance = new Factory();
		}
		return instance;
	}
	
	public static DAO<Suggest> getSuggestDAO() {
		if (suggestDAO == null)
			suggestDAO = new DAOImpl<Suggest>((Class<Suggest>)(new Suggest().getClass()));
		return suggestDAO;
	}

	public static DAO<Annotation> getAnnotationDAO() {
		if (annotationDAO == null)
			annotationDAO = new DAOImpl<Annotation>((Class<Annotation>)(new Annotation().getClass()));
		return annotationDAO;
	}

	
	public static DAO<UserRole> getUserRoleDAO() {
		if (userRoleDAO == null)
			userRoleDAO = new DAOImpl<UserRole>((Class<UserRole>)(new UserRole().getClass()));
		return userRoleDAO;
	}
	
	public static DAO<Author> getAuthorDAO() {
		if (authorDAO == null)
			authorDAO = new DAOImpl<Author>((Class<Author>)(new Author().getClass()));
		return authorDAO;
	}

	public static DAO<Book> getBookDAO() {
		if (bookDAO == null)
			bookDAO = new DAOImpl<Book>((Class<Book>)(new Book().getClass()));
		return bookDAO;
	}

	public static DAO<Comment> getCommentDAO() {
		if (commentDAO == null)
			commentDAO = new DAOImpl<Comment>((Class<Comment>)(new Comment().getClass()));
		return commentDAO;
	}

	public static DAO<Genre> getGenreDAO() {
		if (genreDAO == null)
			genreDAO = new DAOImpl<Genre>((Class<Genre>)(new Genre().getClass()));
		return genreDAO;
	}

	public static DAO<LibraryCard> getLibraryCardDAO() {
		if (libraryCardDAO == null)
			libraryCardDAO = new DAOImpl<LibraryCard>((Class<LibraryCard>)(new LibraryCard().getClass()));
		return libraryCardDAO;
	}

	public static DAO<Stylistic> getStylisticDAO() {
		if (stylisticDAO == null)
			stylisticDAO = new DAOImpl<Stylistic>((Class<Stylistic>)(new Stylistic().getClass()));
		return stylisticDAO;
	}

	public static DAO<User> getUserDAO() {
		if (userDAO == null)
			userDAO = new DAOImpl<User>((Class<User>)(new User().getClass()));
		return userDAO;
	}
	
	

}
