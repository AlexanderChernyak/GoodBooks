package by.bsuir.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.aspectj.util.PartialOrder.PartialComparable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dropbox.core.DbxEntry;
import com.dropbox.core.DbxException;

import by.bsuir.entity.Annotation;
import by.bsuir.entity.Author;
import by.bsuir.entity.Book;
import by.bsuir.entity.Comment;
import by.bsuir.entity.Genre;
import by.bsuir.entity.LibraryCard;
import by.bsuir.entity.Stylistic;
import by.bsuir.service.Dropbox;
import by.bsuir.service.Factory;
import by.bsuir.service.HelpController;
import by.bsuir.service.Validator;

@Controller
@MultipartConfig
public class LibraryController {

	@RequestMapping(value = { "/library/all_book/{id}" }, method = RequestMethod.GET)
	public ModelAndView allBook(@PathVariable("id") String id)
			throws SQLException {
		ModelAndView modelAndView = new ModelAndView("library");
		List<Book> books = Factory.getInstance().getBookDAO().getAll();
		modelAndView.addObject("books", books);
		if (books.size() % 8 != 0)
			modelAndView.addObject("countPage", books.size() / 8 + 1);
		else
			modelAndView.addObject("countPage", books.size() / 8);
		modelAndView.addObject("page", new Integer(id));
		return modelAndView;
	}

	

	@RequestMapping(value = { "/library/currently_book/{id}" }, method = RequestMethod.GET)
	public ModelAndView currentlyBook(@PathVariable("id") String id)
			throws SQLException {
		ModelAndView modelAndView = new ModelAndView("library");
		User user = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		String name = user.getUsername();
		List<Book> books = HelpController.getBooksByUserAndStatus(name, 1);
		if (books.size() % 8 != 0)
			modelAndView.addObject("countPage", books.size() / 8 + 1);
		else
			modelAndView.addObject("countPage", books.size() / 8);
		modelAndView.addObject("page", new Integer(id));
		modelAndView.addObject("books", books);
		return modelAndView;
	}

	@RequestMapping(value = { "/library/future_book/{id}" }, method = RequestMethod.GET)
	public ModelAndView futureBook(@PathVariable("id") String id)
			throws SQLException {
		ModelAndView modelAndView = new ModelAndView("library");
		User user = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		String name = user.getUsername();
		List<Book> books = HelpController.getBooksByUserAndStatus(name, 2);
		if (books.size() % 8 != 0)
			modelAndView.addObject("countPage", books.size() / 8 + 1);
		else
			modelAndView.addObject("countPage", books.size() / 8);
		modelAndView.addObject("page", new Integer(id));
		modelAndView.addObject("books", books);
		return modelAndView;
	}

	@RequestMapping(value = { "/library/past_book/{id}" }, method = RequestMethod.GET)
	public ModelAndView pastBook(@PathVariable("id") String id)
			throws SQLException {
		ModelAndView modelAndView = new ModelAndView("library");
		User user = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		String name = user.getUsername();
		List<Book> books = HelpController.getBooksByUserAndStatus(name, 3);
		if (books.size() % 8 != 0)
			modelAndView.addObject("countPage", books.size() / 8 + 1);
		else
			modelAndView.addObject("countPage", books.size() / 8);
		modelAndView.addObject("page", new Integer(id));
		modelAndView.addObject("books", books);
		return modelAndView;
	}




	@RequestMapping(value = { "/library/show_book" }, method = RequestMethod.GET)
	public ModelAndView showBook(HttpServletRequest request)
			throws SQLException {
		ModelAndView modelAndView = new ModelAndView("book");
		User user = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		Book book = Factory.getInstance().getBookDAO()
				.getById(new Integer(request.getParameter("book")));

		modelAndView.addObject("book", book);
		modelAndView.addObject("authors", HelpController.getAuthorByBook(book));
		modelAndView.addObject("comments", HelpController.getCommentsByBook(book));
		modelAndView.addObject("genres", HelpController.getGenreByBook(book));
		LibraryCard card = HelpController.getLibraryCardByUsernameAndBook(user.getUsername(),
				book);
		if (card == null) {
			by.bsuir.entity.User u = HelpController.getUserByUsername(user.getUsername());
			card = new LibraryCard(0, false, book, u);
			Factory.getInstance().getLibraryCardDAO().add(card);
		}
		modelAndView.addObject("card", card);

		return modelAndView;
	}


	@RequestMapping(value = { "/library/set_comment" }, method = RequestMethod.GET)
	public ModelAndView setComment(HttpServletRequest request, @RequestParam("text") String text)
			throws SQLException {
		ModelAndView modelAndView = new ModelAndView("book");
		Book book = Factory.getInstance().getBookDAO()
				.getById(new Integer(request.getParameter("book")));
		User user = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		LibraryCard card = HelpController.getLibraryCardByUsernameAndBook(user.getUsername(),
				book);
		Comment comment = new Comment(text, new Date(),
				card);
		Factory.getInstance().getCommentDAO().add(comment);

		modelAndView.addObject("book", book);
		modelAndView.addObject("authors", HelpController.getAuthorByBook(book));
		modelAndView.addObject("comments", HelpController.getCommentsByBook(book));
		modelAndView.addObject("genres", HelpController.getGenreByBook(book));
		modelAndView.addObject("card", card);
		return modelAndView;
	}

	@RequestMapping(value = { "/library/set_rating" }, method = RequestMethod.POST)
	public ModelAndView setRating(HttpServletRequest request)
			throws SQLException {
		ModelAndView modelAndView = new ModelAndView("book");
		Book book = Factory.getInstance().getBookDAO()
				.getById(new Integer(request.getParameter("book")));
		User user = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		LibraryCard card = HelpController.getLibraryCardByUsernameAndBook(user.getUsername(),
				book);
		card.setExposureRating(true);
		Factory.getInstance().getLibraryCardDAO().update(card);
		book.incCountRating();
		book.incRating(new Double(request.getParameter("inlineRadio")));
		Factory.getInstance().getBookDAO().update(book);
		modelAndView.addObject("book", book);
		modelAndView.addObject("authors", HelpController.getAuthorByBook(book));
		modelAndView.addObject("comments", HelpController.getCommentsByBook(book));
		modelAndView.addObject("genres", HelpController.getGenreByBook(book));
		modelAndView.addObject("card", card);
		return modelAndView;
	}

	@RequestMapping(value = { "/library/add_book" }, method = RequestMethod.GET)
	public ModelAndView forwardPageAddBook(HttpServletRequest request)
			throws SQLException {
		ModelAndView modelAndView = new ModelAndView("addBookTitle");
		return modelAndView;
	}

	@RequestMapping(value = { "/library/add_book_title" }, method = RequestMethod.POST)
	public @ResponseBody
	ModelAndView addBook(@RequestParam("name") String name,
			@RequestParam("description") String description,
			@RequestParam("date") String date,
			@RequestParam("urlImg") MultipartFile fileImg,
			@RequestParam("url") MultipartFile file) throws SQLException,
			DbxException, IOException, ServletException {
		ModelAndView modelAndView = new ModelAndView("addAuthorForBook");
		Dropbox dropbox = new Dropbox();
		Book book = new Book(name, new Date(), description,
				dropbox.UploadingFile(file), 0, dropbox.UploadingFile(fileImg));
		Factory.getInstance().getBookDAO().add(book);
		modelAndView.addObject("book", book);
		modelAndView.addObject("authors", HelpController.getAuthorByBook(book));
		modelAndView.addObject("allAuthor", Factory.getInstance()
				.getAuthorDAO().getAll());
		return modelAndView;
	}

	@RequestMapping(value = { "/library/add_author_for_book" }, method = RequestMethod.POST)
	public ModelAndView addAnnotation(@RequestParam("name") String name,
			@RequestParam("surname") String surname,
			@RequestParam("middlename") String middlename,
			@RequestParam("birthday") String birthday,
			@RequestParam("book") String bookId) throws SQLException {
		ModelAndView modelAndView = new ModelAndView("addAuthorForBook");
		Book book = Factory.getInstance().getBookDAO()
				.getById(new Integer(bookId));
		if (!Validator.isNumberInString(name)
				|| !Validator.isNumberInString(surname)
				|| !Validator.isNumberInString(middlename)) {
			modelAndView.addObject("error",
					"В инициалах не должно содержаться посторонних символов!");
			modelAndView.addObject("book", book);
			modelAndView.addObject("authors", HelpController.getAuthorByBook(book));
			modelAndView.addObject("allAuthor", Factory.getInstance()
					.getAuthorDAO().getAll());
			return modelAndView;
		}
		Author author;
		try {
			author = new Author(name, surname, middlename,
					new SimpleDateFormat("yyyy-MM-dd").parse(birthday));
		} catch (ParseException e) {
			modelAndView.addObject("error", "Не верный формат даты!");
			return modelAndView;
		}
	
		Factory.getInstance().getAuthorDAO().add(author);
		Factory.getInstance().getAnnotationDAO()
				.add(new Annotation(book, author));
		modelAndView.addObject("book", book);
		modelAndView.addObject("authors", HelpController.getAuthorByBook(book));
		modelAndView.addObject("allAuthor", Factory.getInstance()
				.getAuthorDAO().getAll());
		return modelAndView;
	}

	@RequestMapping(value = { "/library/add_annotation" }, method = RequestMethod.POST)
	public ModelAndView addAnnotations(HttpServletRequest request)
			throws SQLException {
		ModelAndView modelAndView = new ModelAndView("addAuthorForBook");
		Book book = Factory.getInstance().getBookDAO()
				.getById(new Integer(request.getParameter("book")));
		Author author = Factory.getInstance().getAuthorDAO()
				.getById(new Integer(request.getParameter("author")));
		Factory.getInstance().getAnnotationDAO()
				.add(new Annotation(book, author));
		modelAndView.addObject("book", book);
		modelAndView.addObject("authors", HelpController.getAuthorByBook(book));
		modelAndView.addObject("allAuthor", Factory.getInstance()
				.getAuthorDAO().getAll());
		return modelAndView;
	}

	@RequestMapping(value = { "/library/add_genre" }, method = RequestMethod.GET)
	public ModelAndView forwardPageAddGenre(HttpServletRequest request)
			throws SQLException {
		ModelAndView modelAndView = new ModelAndView("addGenreForBook");
		Book book = Factory.getInstance().getBookDAO()
				.getById(new Integer(request.getParameter("book")));
		modelAndView.addObject("allGenres", Factory.getInstance().getGenreDAO()
				.getAll());
		modelAndView.addObject("genres", HelpController.getGenreByBook(book));
		modelAndView.addObject("book", book);
		return modelAndView;
	}

	@RequestMapping(value = { "/library/add_stylistic" }, method = RequestMethod.POST)
	public ModelAndView addStylistic(@RequestParam("genre") String genreS,
			@RequestParam("book") String bookId) throws SQLException {
		ModelAndView modelAndView = new ModelAndView("addGenreForBook");
		Book book = Factory.getInstance().getBookDAO()
				.getById(new Integer(bookId));
		Genre genre = Factory.getInstance().getGenreDAO()
				.getById(new Integer(genreS));
		Factory.getInstance().getStylisticDAO().add(new Stylistic(book, genre));
		modelAndView.addObject("allGenres", Factory.getInstance().getGenreDAO()
				.getAll());
		modelAndView.addObject("book", book);
		modelAndView.addObject("genres", HelpController.getGenreByBook(book));
		return modelAndView;
	}

	@RequestMapping(value = { "/library/add_genre_for_book" }, method = RequestMethod.POST)
	public ModelAndView addGenreForBook(@RequestParam("name") String name,
			@RequestParam("book") String bookId)
			throws SQLException {
		ModelAndView modelAndView = new ModelAndView("addGenreForBook");
		Book book = Factory.getInstance().getBookDAO()
				.getById(new Integer(bookId));
		if(!Validator.isNumberInString(name)){
			modelAndView.addObject("error", "В инициалах не должно содержаться посторонних символов!");
			modelAndView.addObject("allGenres", Factory.getInstance().getGenreDAO()
					.getAll());
			modelAndView.addObject("book", book);
			modelAndView.addObject("genres", HelpController.getGenreByBook(book));
			return modelAndView;
		}
		Genre genre = new Genre(name);
		Factory.getInstance().getGenreDAO().add(genre);
		Factory.getInstance().getStylisticDAO().add(new Stylistic(book, genre));
		modelAndView.addObject("allGenres", Factory.getInstance().getGenreDAO()
				.getAll());
		modelAndView.addObject("book", book);
		modelAndView.addObject("genres", HelpController.getGenreByBook(book));
		return modelAndView;
	}

	@RequestMapping(value = { "/library/set_status" }, method = RequestMethod.POST)
	public ModelAndView setStatus(HttpServletRequest request)
			throws SQLException {
		ModelAndView modelAndView = new ModelAndView("book");
		User user = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		Book book = Factory.getInstance().getBookDAO()
				.getById(new Integer(request.getParameter("book")));
		LibraryCard card = Factory.getInstance().getLibraryCardDAO()
				.getById(new Integer(request.getParameter("card")));
		card.setStatus(new Integer(request.getParameter("status")));
		Factory.getInstance().getLibraryCardDAO().update(card);
		modelAndView.addObject("book", book);
		modelAndView.addObject("authors", HelpController.getAuthorByBook(book));
		modelAndView.addObject("comments", HelpController.getCommentsByBook(book));
		modelAndView.addObject("genres", HelpController.getGenreByBook(book));
		modelAndView.addObject("card", card);
		return modelAndView;
	}

	@RequestMapping(value = { "/library/search_books/{id}" }, method = RequestMethod.GET)
	public ModelAndView forwardSearchBooks(@PathVariable("id") String id)
			throws SQLException {
		ModelAndView modelAndView = new ModelAndView("search");
		modelAndView.addObject("authors", Factory.getInstance().getAuthorDAO()
				.getAll());
		modelAndView.addObject("genres", Factory.getInstance().getGenreDAO()
				.getAll());
		List<Book> books = Factory.getInstance().getBookDAO().getAll();
		modelAndView.addObject("books", books);
		if (books.size() % 8 != 0)
			modelAndView.addObject("countPage", books.size() / 8 + 1);
		else
			modelAndView.addObject("countPage", books.size() / 8);
		modelAndView.addObject("page", new Integer(id));
		return modelAndView;
	}

	

	@RequestMapping(value = { "/library/search/{id}" }, method = RequestMethod.GET)
	public ModelAndView searchBooks(@PathVariable("id") String id,
			HttpServletRequest request) throws SQLException {
		ModelAndView modelAndView = new ModelAndView("search");
		List<Book> bookAll = Factory.getInstance().getBookDAO().getAll();
		List<Book> books = HelpController.getBookByGenre(
				HelpController.getBookByAuthor(
						HelpController.getBooksByName(bookAll, request.getParameter("name")),
						request.getParameter("author")),
				request.getParameter("genre"));
		modelAndView.addObject("books", books);
		if (books.size() % 8 != 0)
			modelAndView.addObject("countPage", books.size() / 8 + 1);
		else
			modelAndView.addObject("countPage", books.size() / 8);
		modelAndView.addObject("page", new Integer(id));
		modelAndView.addObject("authors", Factory.getInstance().getAuthorDAO()
				.getAll());
		modelAndView.addObject("genres", Factory.getInstance().getGenreDAO()
				.getAll());
		return modelAndView;
	}

	@RequestMapping(value = "library/delete_book", method = RequestMethod.GET)
	public ModelAndView deleteBook(@RequestParam("book") String book) {
		ModelAndView model = new ModelAndView("info");
		try {
			Factory.getInstance()
					.getBookDAO()
					.delete(Factory.getInstance().getBookDAO()
							.getById(new Integer(book)));
			model.addObject("success", "Книга удалена.");
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			model.addObject("error", "Удаление книги не удалось");
			return model;
		}
		return model;
	}

}
