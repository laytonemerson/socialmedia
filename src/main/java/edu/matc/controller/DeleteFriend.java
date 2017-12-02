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
 * This is the DeleteFriend servlet. It will delete the selected user as a friend and then send back
 * an updated friend/non friend list.
 *
 *@author lemerson
 */
@WebServlet(
        name = "deleteFriend",
        urlPatterns = {"/deleteFriend"}
) public class DeleteFriend extends HttpServlet {

    private final Logger log = Logger.getLogger(this.getClass());

    /**
     * Handles HTTP GET requests.
     *
     * @param request  the HttpRequest
     * @param response the HttpResponse
     * @throws ServletException if there is a general servlet exception
     * @throws IOException      if there is a general I/O exception
     */

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userName = request.getRemoteUser();
        String friendUserName = request.getParameter("user_name_del");

        try {
            UserDao dao = new UserDao();
            User user = dao.getUser(userName);
            Set<Friend> userFriends = user.getUserFriends();
            Friend deleteFriend = findFriendToDelete(userFriends,friendUserName);
            user.getUserFriends().remove(deleteFriend);
            dao.updateUser(user);
            userFriends = user.getUserFriends();
            List<User> friends = friendList(userFriends);
            List<User> nonFriends = nonFriendList(userFriends,user);
            request.setAttribute("friends",friends);
            request.setAttribute("nonFriends",nonFriends);
        } catch (HibernateException he) {
            HttpSession session = request.getSession();
            log.error("Error while attempting to delete friend " + friendUserName, he);
            session.setAttribute("ErrorMessage","Error while attempting to delete friend " + friendUserName);
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

    /**
     * Return a friend object to be deleted from the users friend list.
     *
     * @param friendSet  the list of friends that the user is friends with
     * @param userName  the userName of the friend to delete
     * @return deleteFriend the friend object to delete
     */
    private Friend findFriendToDelete (Set<Friend> friendSet, String userName) {
        Friend deleteFriend = new Friend();

        for(Friend current : friendSet) {
            if (current.getFriendUserName().equals( userName)) {
                deleteFriend = current;
            }
        }
        return deleteFriend;
    }
}