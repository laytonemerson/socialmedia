package edu.matc.persistence;

import edu.matc.entity.User;
import edu.matc.entity.UserRole;
import org.junit.Before;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class UserDaoTest {

    UserDao dao;

    @Before
    public void setup() {
        dao = new UserDao();
    }

    @Test
    public void getAllUsers() throws Exception {
        List<User> users = dao.getAllUsers();
        assertTrue(users.size() == 2);
    }

    @Test
    public void getUser() throws Exception {
        User user = dao.getUser("laytonemerson");
        assertTrue(user.getEmailAddress().equals("laytonemerson@gmail.com"));
    }

    @Test
    public void addUser() throws Exception {


        User user = new User("laytonemerson3","password","laytonemerson@gmail.com","Layton","Emerson");

        UserRole role = new UserRole("user");
        role.setUser(user);
        user.getUserRoles().add(role);

        String name = dao.addUser(user);

        assertTrue(dao.getUser("laytonemerson3").equals(user));


    }

    @Test
    public void deleteUser() throws Exception {

        User user = dao.getUser("laytonemerson2");
        dao.deleteUser("laytonemerson2");
        List<User> users = dao.getAllUsers();

        assertFalse(users.contains(user));
    }

    @Test
    public void updateUser() throws Exception {

        User user = dao.getUser("laytonemerson");

        user.setFirstName("Not Layton");
        dao.updateUser(user);

        User user2 = dao.getUser("laytonemerson");
        assertTrue(user.getFirstName().equals(user2.getFirstName()));

    }

}