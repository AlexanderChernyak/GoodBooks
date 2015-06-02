package by.bsuir.dao;

import java.sql.SQLException;
import java.util.List;

public interface DAO<Type> {

	public void add(Type generic) throws SQLException;

	public void delete(Type generic) throws SQLException;

	public Type getById(int id) throws SQLException;

	public List<Type> getAll() throws SQLException;
	
	public void update(Type generic) throws SQLException;

}
