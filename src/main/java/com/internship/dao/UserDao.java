package com.internship.dao;

import com.internship.model.User;

import java.util.List;

/**
 * Created by users on 02.06.17.
 */
public interface UserDao {
    public void addUser(User user);

    public void updateUser(User user);

    public void removeUser(int id);

    public User getUserbyId(int id);

    public List<User> getUsers();

    List<User> getUserbyName(String name);
}
