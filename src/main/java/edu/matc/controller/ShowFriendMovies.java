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
import java.util.HashSet;
import java.util.Set;

/**
 * This is the ShowFriendMovies servlet. It will create and forward a friend list to the friendMovies.jsp
 *
 *@author lemerson
 */
@WebServlet(
        name = "showFriendMovies",
        urlPatterns = {"/showFriendMovies"}
) public class ShowFriendMovies extends HttpServlet {

    private final Logger log = Logger.getLogger(this.getClass());

    /**
    *  Handles HTTP GET requests.
    *
    *@param  request               the HttpRequest
    *@param  response              the HttpResponse
    *@exception  ServletException  if there is a general servlet exception
    *@exception  IOException       if there is a general I/O exception
    */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the user name
        String userName = request.getRemoteUser();

        // Try to get a list of the friends to pass to the friendsmovies jsp page. This will allow the page
        // to display all of the friends movies.
        try {
            UserDao dao = new UserDao();
            User user = dao.getUser(userName);
            Set<User> friends = makeUserSet(user.getUserFriends());
            request.setAttribute("friends",friends);
            request.setAttribute("user",user);
        } catch (HibernateException he) {
            HttpSession session = request.getSession();
            log.error("Error while attempting to retrieve friend list for " + userName, he);
            session.setAttribute("ErrorMessage","Error while attempting to retrieve friend list for " + userName);
        }

        request.setAttribute("title", "My Friends' Movies");
        String url = "/friendMovies.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }

    /**
     * Return a set of users, that the logged in user is friends with.
     *
     * @param friendSet  the list of friends that the user is friends with
     * @return friends the list of users that the logged in user is not friends with
     */
    private Set<User> makeUserSet (Set<Friend> friendSet) {

        Set<User> friends = new HashSet<User>();
        UserDao dao = new UserDao();
        for (Friend current: friendSet) {
            User makeUser = dao.getUser(current.getFriendUserName());
            friends.add(makeUser);
        }
        return friends;
    }

}