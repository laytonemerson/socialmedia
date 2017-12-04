package edu.matc.controller;

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

/**
 * This is the ShowMyAccount servlet. It will load the user information to the request and forward to the
 * myAccount.jsp page.
 *
 *@author lemerson
 */
@WebServlet(
        name = "showMyAccount",
        urlPatterns = {"/showMyAccount"}
) public class ShowMyAccount extends HttpServlet {

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
        HttpSession session = request.getSession();
        String userName = request.getRemoteUser();

        // Get the user and try to set some attributes about the user to be used on the myaccount page
        try {
            UserDao dao = new UserDao();
            User user = dao.getUser(userName);
            request.setAttribute("user",user);
            request.setAttribute("movieCount",user.getUserMovies().size());
            request.setAttribute("friendCount",user.getUserFriends().size());
            request.setAttribute("movies",user.getUserMovies());
            session.setAttribute("loggedIn", true);
        } catch (HibernateException he) {
            log.error("Error while attempting to load account details for " + userName, he);
            session.setAttribute("Error Message","Error while attempting to load account details for " + userName);
            String url = "/generalError.jsp";
            response.sendRedirect(url);
        }

        String url = "/myaccount.jsp";
        request.setAttribute("title", "My SM Account");
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}