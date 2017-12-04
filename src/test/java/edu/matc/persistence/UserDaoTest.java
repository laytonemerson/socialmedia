package edu.matc.persistence;

import edu.matc.entity.Friend;
import edu.matc.entity.Movie;
import edu.matc.entity.User;
import edu.matc.entity.UserRole;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import junitparams.*;
import java.util.List;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

@RunWith(JUnitParamsRunner.class)
public class UserDaoTest {

    UserDao dao;
    List<User> allUsers;

    // Make a dao and an all Users list.
    @Before
    public void setup() {
        dao = new UserDao();
        allUsers = dao.getAllUsers();
    }

    // Get a list of all users and make sure it matches the before list.
    @Test
    public void getAllUsers() throws Exception {
        List<User> users = dao.getAllUsers();
        assertTrue(users.size() == allUsers.size());
    }

    // Get user from database. Then find the same user in the All Users list from @Before. Make sure they are equal.
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

    // add new user to database.
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

    // delete user from database
    @Test
    @Parameters({"laytonemerson1"})
    public void deleteUser(String userName) throws Exception {

        User userToDelete = dao.getUser(userName);
        dao.deleteUser(userName);

        List<User> users = dao.getAllUsers();
        assertFalse(users.contains(userToDelete));
    }

    // update a user on the datbase.
    @Test
    @Parameters({"jamie, NewFirst"})
    public void updateUser(String userName, String firstName) throws Exception {

        User user = dao.getUser(userName);
        user.setFirstName(firstName);
        dao.updateUser(user);

        User user2 = dao.getUser(userName);
        assertTrue(user.getFirstName().equals(user2.getFirstName()));
    }

    // add a friend to a user on the database
    @Test
    @Parameters({"jamie, 12345"})
    public void addFriend(String userName, String friendUserName) throws Exception {

        User user = dao.getUser(userName);
        Friend friend = new Friend(friendUserName);
        friend.setUser(user);
        user.getUserFriends().add(friend);
        dao.updateUser(user);

        User user2 = dao.getUser(userName);
        assertTrue(user2.getUserFriends().contains(friend));

    }

    // delete a friend from a user on the database
    @Test
    @Parameters({"12345, jamie"})
    public void deleteFriend(String userName, String friendUserName) throws Exception {

        User user = dao.getUser(userName);
        Friend deleteFriend = new Friend(friendUserName);
        deleteFriend.setUser(user);
        user.getUserFriends().remove(deleteFriend);
        dao.updateUser(user);

        User user2 = dao.getUser(userName);
        assertFalse(user2.getUserFriends().contains(deleteFriend));
    }

    // add a movie to a user on the database
    @Test
    @Parameters({"jamie, 11111, 2017-12-03, This is the plot, This is the title, This is the poster"})
    public void addMovie(String userName, Integer movieId, String movieDate, String moviePlot,
                         String movieTitle, String posterPath) throws Exception {

        User user = dao.getUser(userName);
        Movie addMovie = new Movie(movieId,movieDate,moviePlot,movieTitle,posterPath);
        addMovie.setUser(user);
        user.getUserMovies().add(addMovie);
        dao.updateUser(user);

        User user2 = dao.getUser(userName);
        assertTrue(user2.getUserMovies().contains(addMovie));
    }

    // delete a movie from a user on the database
    @Test
    @Parameters({"jamie, 999, 2017-12-03, plot 999, title 999, poster 999"})
    public void deleteMovie(String userName, Integer movieId, String movieDate, String moviePlot,
                            String movieTitle, String posterPath) throws Exception {
        User user = dao.getUser(userName);
        Movie deleteMovie = new Movie(movieId,movieDate,moviePlot,movieTitle,posterPath);
        deleteMovie.setUser(user);
        user.getUserMovies().remove(deleteMovie);
        dao.updateUser(user);

        User user2 = dao.getUser(userName);
        assertFalse(user2.getUserMovies().contains(deleteMovie));

    }

    // send an email using Mailer
    @Test
    @Parameters({"socialmedia.entjava@gmail.com,entjavaf2017,laytonemerson@gmail.com,Subject,Body"})
    public void sendEmail(String from, String password, String to, String subject, String body) throws Exception {
        Mailer.send(from, password, to, subject, body);
        assertTrue(1==1);
    }

}