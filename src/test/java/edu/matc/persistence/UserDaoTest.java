package edu.matc.persistence;

import edu.matc.entity.Friend;
import edu.matc.entity.Movie;
import edu.matc.entity.User;
import edu.matc.entity.UserRole;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import junitparams.*;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

@RunWith(JUnitParamsRunner.class)
public class UserDaoTest {

    UserDao dao;
    List<User> allUsers;

    @Before
    public void setup() {
        dao = new UserDao();
        allUsers = dao.getAllUsers();
    }

    @Test
    public void getAllUsers() throws Exception {
        List<User> users = dao.getAllUsers();
        assertTrue(users.size() == allUsers.size());
    }

    @Test
    @Parameters({"12345"})
    public void getUser(String userName) throws Exception {

        User user = dao.getUser(userName);
        User user2 = null;
        for (User current: allUsers) {
            if (current.getUserName().equals(userName)) {
                user2 = current;
            }
        }
        assertTrue(user.equals(user2));
    }

    @Test
    @Parameters({"newlayton, password, laytonemerson@gmail.com, Layton, Emerson, bioPictureUrl" +
            ", This is my bio for newlaytonemerson,0,user"})
    public void addUser(String userName, String password, String email, String firstName, String lastName,
                        String picture, String bio, Integer movieCount, String userRole) throws Exception {

        User beforeUser = new User(userName,password,email,firstName,lastName,picture,bio,movieCount);
        UserRole role = new UserRole(userRole);
        role.setUser(beforeUser);
        beforeUser.getUserRoles().add(role);
        String name = dao.addUser(beforeUser);

        User afterUser = dao.getUser(userName);

        assertTrue(beforeUser.equals(afterUser));

    }

    @Test
    @Parameters({"laytonemerson1"})
    public void deleteUser(String userName) throws Exception {

        User userToDelete = dao.getUser(userName);
        dao.deleteUser(userName);

        List<User> users = dao.getAllUsers();
        assertFalse(users.contains(userToDelete));
    }

    @Test
    @Parameters({"jamie, NewFirst"})
    public void updateUser(String userName, String firstName) throws Exception {

        User user = dao.getUser(userName);
        user.setFirstName(firstName);
        dao.updateUser(user);

        User user2 = dao.getUser(userName);
        assertTrue(user.getFirstName().equals(user2.getFirstName()));
    }

    @Test
    @Parameters({"jamie, NewFirst"})
    public void addFriend() throws Exception {

    }

    @Test
    @Parameters({"jamie, NewFirst"})
    public void deleteFriend() throws Exception {

    }

    @Test
    @Parameters({"jamie, NewFirst"})
    public void addMovie() throws Exception {

    }

    @Test
    @Parameters({"jamie, NewFirst"})
    public void deleteMovie() throws Exception {

    }

    @Test
    @Parameters({"socialmedia.entjava@gmail.com,entjavaf2017,laytonemerson@gmail.com,Subject,Body"})
    public void sendEmail(String from, String password, String to, String subject, String body) throws Exception {
        Mailer.send(from, password, to, subject, body);
        assertTrue(1==1);
    }

}