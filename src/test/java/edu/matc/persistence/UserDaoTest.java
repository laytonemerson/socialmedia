package edu.matc.persistence;

import edu.matc.entity.Friend;
import edu.matc.entity.Movie;
import edu.matc.entity.User;
import edu.matc.entity.UserRole;
import org.junit.Before;
import org.junit.Test;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
        User user = dao.getUser("12345");
        assertTrue(user.getEmailAddress().equals("laytonemerson@gmail.com"));
    }

    @Test
    public void getFriends() throws Exception {
        User loggedIn = dao.getUser("12345");

        Set<Friend> friendSet = loggedIn.getUserFriends();
        List<User> friends = new ArrayList<User>();
        for (Friend current: friendSet) {
            User makeUser = dao.getUser(current.getFriendUserName());
            friends.add(makeUser);
        }

        List<User> nonFriends = dao.getAllUsers();
        nonFriends.removeAll(friends);
        nonFriends.remove(loggedIn);

    }

    @Test
    public void addUser() throws Exception {


        User user = new User("laytonemerson4","password","laytonemerson@gmail.com","Layton","Emerson","","hi");

        UserRole role = new UserRole("user");
        Movie movie = new Movie(1234567890,"1","2","3","4");
        role.setUser(user);
        movie.setUser(user);

        user.getUserRoles().add(role);
        user.getUserMovies().add(movie);

        String name = dao.addUser(user);

        assertTrue(dao.getUser("laytonemerson4").equals("laytonemerson4"));


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


        User user = dao.getUser("12345");
        user.setFirstName("Not Layton3");

        Movie movie = new Movie(1234567890,"1","2","3","4");
        movie.setUser(user);
        user.getUserMovies().add(movie);

        dao.updateUser(user);




        User user2 = dao.getUser("laytonemerson4");
        assertTrue(user.getFirstName().equals(user2.getFirstName()));

    }

}