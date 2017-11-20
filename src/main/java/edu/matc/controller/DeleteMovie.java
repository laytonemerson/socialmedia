package edu.matc.controller;

import edu.matc.entity.Movie;
import edu.matc.entity.User;
import edu.matc.persistence.UserDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Set;

/**
 * This is the ShowEmployeeSearchServlet. It will set the page title and forward
 * to the employeeSearch.jsp page.
 *
 *@author lemerson
 */
@WebServlet(
        name = "deleteMovie",
        urlPatterns = {"/deleteMovie"}
) public class DeleteMovie extends HttpServlet {
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
        UserDao dao = new UserDao();
        User user = dao.getUser(userName);

        user.getUserMovies().remove(movieToDelete(request));
        user.setMovieCount(user.getMovieCount() - 1);
        dao.updateUser(user);
        request.setAttribute("movies",user.getUserMovies());

        String url = "/myMovies.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }

    private Movie movieToDelete(HttpServletRequest request) {

        Integer movieId = Integer.parseInt(request.getParameter("movie_id"));
        String movieTitle = request.getParameter("movie_title");
        String moviePlot = request.getParameter("movie_plot");
        String movieDate = request.getParameter("movie_date");
        String posterPath = request.getParameter("poster_path");
        Movie deleteMovie = new Movie(movieId,movieDate,moviePlot,movieTitle,posterPath);

        return deleteMovie;

    }
}