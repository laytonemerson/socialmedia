package edu.matc.controller;


import edu.matc.entity.Friend;
import edu.matc.entity.User;
import edu.matc.persistence.UserDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * This is the ShowEmployeeSearchServlet. It will set the page title and forward
 * to the employeeSearch.jsp page.
 *
 *@author lemerson
 */
@WebServlet(
        name = "showFriendManager",
        urlPatterns = {"/showFriendManager"}
) public class ShowFriendManager extends HttpServlet {
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

        request.setAttribute("title", "Friend Manager");
        String url = "/friendManager.jsp";

        UserDao dao = new UserDao();
        User loggedIn = dao.getUser(request.getRemoteUser());

        Set<Friend> friendSet = loggedIn.getUserFriends();

        List<User> nonFriends = dao.getAllUsers();
        List<User> friends = new ArrayList<User>();

        for (Friend current: friendSet) {
            User makeUser = dao.getUser(current.getFriendUserName());
            friends.add(makeUser);
            nonFriends.remove(makeUser);
        }

        nonFriends.remove(loggedIn);

        request.setAttribute("friends",friends);
        request.setAttribute("nonFriends",nonFriends);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }
}






