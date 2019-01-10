package com.itmakesavillage.jpaproject.data;

import java.util.List;
import java.util.Set;

import com.itmakesavillage.jpaproject.entities.User;

public interface UserDAO {
	public User findUser(int id);
	public User createUser(User user);
	public User updateUser(int id, User user);
	public Set<User> searchUser(String keyword);
	public List<User> getAllUser();

}
