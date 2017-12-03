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

/**
 * This is the DeleteMovie Servlet. It will delete the selected movie to the database for the user.

 *
 *@author lemerson
 */
@WebServlet(
        name = "deleteMovie",
        urlPatterns = {"/deleteMovie"}
) public class DeleteMovie extends HttpServlet {

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

        // Get the user name and movie id to delete
        String userName = request.getRemoteUser();
        Integer movieId = Integer.parseInt(request.getParameter("movie_id"));

        try {
            // Create the user and movie object. Remove from the user. Update ths user.
            UserDao dao = new UserDao();
            User user = dao.getUser(userName);
            user.getUserMovies().remove(movieToDelete(request,movieId));
            user.setMovieCount(user.getMovieCount() - 1);
            dao.updateUser(user);
            request.setAttribute("movies",user.getUserMovies());
        } catch (HibernateException he) {
            log.error("Error while attempting to delete movie " + movieId, he);
            HttpSession session = request.getSession();
            session.setAttribute("ErrorMessage","Error while attempting to delete movie " + movieId);
        }

        String url = "/myMovies.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }

    /**
     * Return a movie object to be deleted from the users movie list.
     *
     * @param request  the HttpRequest
     * @param movieId  the movieId of the movie selected to be deleted
     * @return deleteMovie the movie object to delete
     */
    private Movie movieToDelete(HttpServletRequest request, Integer movieId) {

        String movieTitle = request.getParameter("movie_title");
        String moviePlot = request.getParameter("movie_plot");
        String movieDate = request.getParameter("movie_date");
        String posterPath = request.getParameter("poster_path");
        Movie deleteMovie = new Movie(movieId,movieDate,moviePlot,movieTitle,posterPath);

        return deleteMovie;

    }
}