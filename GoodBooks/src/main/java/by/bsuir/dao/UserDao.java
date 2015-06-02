package by.bsuir.dao;

import by.bsuir.entity.User;

public interface UserDao {

	User findByUserName(String username);

}