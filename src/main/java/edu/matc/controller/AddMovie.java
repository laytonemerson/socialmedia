package edu.matc.controller;

import edu.matc.entity.Movie;
import edu.matc.entity.User;
import edu.matc.entity.UserRole;
import edu.matc.persistence.UserDao;
import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.json.JSONObject;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * This is the ShowEmployeeSearchServlet. It will set the page title and forward
 * to the employeeSearch.jsp page.
 *
 *@author lemerson
 */
@WebServlet(
        name = "addMovie",
        urlPatterns = {"/addMovie"}
) public class AddMovie extends HttpServlet {

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
        Integer movieId = Integer.parseInt(request.getParameter("movie_id"));
        String movieTitle = request.getParameter("movie_title");
        String moviePlot = request.getParameter("movie_plot");
        String movieDate = request.getParameter("movie_date");
        String posterPath = request.getParameter("poster_path");

        try {
            UserDao dao = new UserDao();
            User user = dao.getUser(userName);
            Movie movie = new Movie(movieId, movieDate, moviePlot, movieTitle, posterPath);
            movie.setUser(user);
            user.getUserMovies().add(movie);
            user.setMovieCount(user.getMovieCount() + 1);
            dao.updateUser(user);
        }
        catch (HibernateException e) {
            log.error("Error while attempting to save movie " + movieId, e);
            HttpSession session = request.getSession();
            session.setAttribute("Error Message","Error while attempting to save movie " + movieId);
        }
    }
}