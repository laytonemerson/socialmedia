package edu.matc.controller;


import edu.matc.entity.Friend;
import edu.matc.entity.Movie;
import edu.matc.entity.User;
import edu.matc.persistence.UserDao;
import org.apache.log4j.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * This is the ShowEmployeeSearchServlet. It will set the page title and forward
 * to the employeeSearch.jsp page.
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

        UserDao dao = new UserDao();
        User user = dao.getUser(request.getRemoteUser());


        Set<Friend> friendSet = user.getUserFriends();
        Set<User> friends = new HashSet<User>();

        for (Friend current: friendSet) {
            User makeUser = dao.getUser(current.getFriendUserName());
            friends.add(makeUser);
        }

        request.setAttribute("friends",friends);
        request.setAttribute("user",user);
        request.setAttribute("title", "My Friends' Movies");
        String url = "/friendMovies.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }
}






