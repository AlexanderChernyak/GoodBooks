package by.bsuir.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;

import by.bsuir.dao.DAO;
import by.bsuir.service.HibernateUtil;


public class DAOImpl<Type>  implements DAO<Type> {
	
	private Class<Type> type;
	
	public DAOImpl(Class<Type> type) {
		this.type = type;
	}

	public void add(Type generic) throws SQLException {
		Session session = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			session.save(generic);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if ((session != null) && (session.isOpen()))
				session.close();
		}
	}

	public void delete(Type generic) throws SQLException {
		Session session = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			session.delete(generic);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if ((session != null) && (session.isOpen()))
				session.close();
		}	
	}

	public Type getById(int id) throws SQLException {
		Type generic = null;
		Session session = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			generic = (Type) session.get(type, id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if ((session != null) && (session.isOpen()))
				session.close();
		}
		return generic;
	}

	public List<Type> getAll() throws SQLException {
		List<Type> generics = null ;
		Session session = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			generics = session.createCriteria(type).list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if ((session != null) && (session.isOpen()))
				session.close();
		}		
		return generics;
	}

	public void update(Type generic) throws SQLException {
		Session session = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			session.update(generic);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if ((session != null) && (session.isOpen()))
				session.close();
		}
	}

}
