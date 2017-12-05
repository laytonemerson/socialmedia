package edu.matc.controller;

import edu.matc.entity.Movie;
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
import java.util.Set;

/**
 * This is the ShowMyMovies Servlet. It will load the user movies and forward to myMovies.jsp page.
 *
 *@author lemerson
 */
@WebServlet(
        name = "showMyMovies",
        urlPatterns = {"/showMyMovies"}
) public class ShowMyMovies extends HttpServlet {

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

        // Make the user and create a list of all the users' movies to be display on myMovies.jsp
        try {
            UserDao dao = new UserDao();
            User user = dao.getUser(userName);
            Set<Movie> userMovies = user.getUserMovies();
            request.setAttribute("movies", userMovies);
        } catch (HibernateException he) {
            log.error("Error while attempting to load movies for " + userName, he);
            session.setAttribute("ErrorMessage","Error while attempting to load movies for " + userName);
            String url = "/generalError.jsp";
            response.sendRedirect(url);
        }

        request.setAttribute("title", "My Movies");
        String url = "/myMovies.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}