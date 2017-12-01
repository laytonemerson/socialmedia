package edu.matc.controller;

import edu.matc.entity.Friend;
import edu.matc.entity.User;
import edu.matc.persistence.UserDao;
import org.apache.log4j.Logger;
import org.hibernate.HibernateException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * This is the AddFriend Servlet. It will add the selected user as a friend and then send back
 * an updated friend/non friend list.
 *
 *@author lemerson
 */
@WebServlet(
        name = "addFriend",
        urlPatterns = {"/addFriend"}
) public class AddFriend extends HttpServlet {

    private final Logger log = Logger.getLogger(this.getClass());

    /**
     * Handles HTTP POST requests.
     *
     * @param request  the HttpRequest
     * @param response the HttpResponse
     * @throws ServletException if there is a general servlet exception
     * @throws IOException      if there is a general I/O exception
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userName = request.getRemoteUser();
        String friendUserName = request.getParameter("user_name_add");
        UserDao dao = new UserDao();

        try{
            User user = dao.getUser(userName);
            Friend friend = new Friend(friendUserName);
            friend.setUser(user);
            user.getUserFriends().add(friend);
            dao.updateUser(user);
            Set<Friend> friendSet = user.getUserFriends();
            List<User> friends = friendList(friendSet);
            List<User> nonFriends = nonFriendList(friendSet,user);
            request.setAttribute("friends",friends);
            request.setAttribute("nonFriends",nonFriends);
        } catch (HibernateException he) {
            HttpSession session = request.getSession();
            log.error("Error while attempting to save friend " + friendUserName, he);
            session.setAttribute("ErrorMessage","Error while attempting to save friend " + friendUserName);
        }

        request.setAttribute("title", "Friend Manager");
        String url = "/friendManager.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }

    /**
     * Return a list of users, that the logged in user is friends with.
     *
     * @param friendSet  the list of friends that the user is friends with
     * @return friends the list of users that the logged in user is not friends with
     */
    private List<User> friendList (Set<Friend> friendSet) {
        List<User> friends = new ArrayList<User>();
        UserDao dao = new UserDao();
        for (Friend current: friendSet) {
            User makeUser = dao.getUser(current.getFriendUserName());
            friends.add(makeUser);
        }
        return friends;
    }

    /**
     * Return a list of users, that the logged in user is not friends with.
     *
     * @param friendSet  the list of friends that the user is friends with
     * @param user  the current user
     * @return nonFriends the list of users that the logged in user is not friends with
     */
    private List<User> nonFriendList (Set<Friend> friendSet, User user) {
        List<User> nonFriends = new ArrayList<User>();
        UserDao dao = new UserDao();
        nonFriends.remove(user);

        for (Friend current: friendSet) {
            User makeUser = dao.getUser(current.getFriendUserName());
            nonFriends.remove(makeUser);
        }
        return nonFriends;
    }

}