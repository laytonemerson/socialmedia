package edu.matc.persistence;

import edu.matc.entity.Friend;
import edu.matc.entity.Movie;
import edu.matc.entity.User;
import edu.matc.entity.UserRole;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import junitparams.*;
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
        assertTrue(user.getEmailAddress().equals("laytonemerson@gmail.com"));
    }

    @Test
    @Parameters({"socialmedia.entjava@gmail.com,entjavaf2017,laytonemerson@gmail.com,Subject,Body"})
    public void sendEmail(String from, String password, String to, String subject, String body) throws Exception {
        Mailer.send(from, password, to, subject, body);
        assertTrue(1==1);
    }

    @Test
    @Parameters({"12345"})
    public void getFriends(String userName) throws Exception {
        User loggedIn = dao.getUser(userName);

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
    @Parameters({"newlayton, password, laytonemerson@gmail.com, Layton, Emerson, bioPictureUrl" +
            ", This is my bio for newlaytonemerson,0,user,1234567890,2017-12-02" +
            ",Aliens. Robots. Zombies...Oh My...,Totally Awesome Movie, moviePictureUrl"})
    public void addUser(String userName, String password, String email, String firstName, String lastName,
                        String picture, String bio, Integer movieCount, String userRole, Integer movieId,
                        String movieDate, String moviePlot, String movieTitle, String moviePoster) throws Exception {

        User beforeUser = new User(userName,password,email,firstName,lastName,picture,bio,movieCount);
        UserRole role = new UserRole(userRole);
        role.setUser(beforeUser);
        Movie movie = new Movie(movieId,movieDate,moviePlot,movieTitle,moviePoster);
        movie.setUser(beforeUser);
        beforeUser.getUserRoles().add(role);
        beforeUser.getUserMovies().add(movie);
        String name = dao.addUser(beforeUser);

        User afterUser = dao.getUser(userName);

        assertTrue(beforeUser.equals(afterUser));

    }

    @Test
    @Parameters({"laytonemerson"})
    public void deleteUser(String userName) throws Exception {

        User userToDelete = dao.getUser(userName);
        dao.deleteUser(userName);

        List<User> users = dao.getAllUsers();
        assertFalse(users.contains(userToDelete));
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