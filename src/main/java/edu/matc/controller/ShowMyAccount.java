package edu.matc.controller;


import com.fasterxml.jackson.databind.ObjectMapper;
import edu.matc.entity.Movie;
import edu.matc.entity.User;
import edu.matc.persistence.UserDao;
import org.themoviedb.MovieResponse;
import org.themoviedb.Response;
import org.themoviedb.ResultsItem;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import java.io.IOException;
import java.net.URLEncoder;
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
        name = "showMyAccount",
        urlPatterns = {"/showMyAccount"}
) public class ShowMyAccount extends HttpServlet {
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

        String url = "/myaccount.jsp";
        request.setAttribute("title", "My SM Account");
        HttpSession session = request.getSession();

        session.removeAttribute("newUser");
        session.removeAttribute("newUserName");
        session.setAttribute("loggedIn", true);

        UserDao dao = new UserDao();
        User user = dao.getUser(request.getRemoteUser());
        request.setAttribute("user",user);

        List posterLinks = new ArrayList();
        Set<Movie> userMovies = user.getUserMovies();
        for (Movie userMovie: userMovies) {

            String searchString = "https://api.themoviedb.org/3/movie/" + userMovie.getMovieId().toString() +
                    "?api_key=946112c161527a3ca57ea2a7ba0f1766&language=en-US";

            Client client = ClientBuilder.newClient();
            WebTarget target = client.target(searchString);
            String jsonResponse = target.request(MediaType.APPLICATION_JSON).get(String.class);
            ObjectMapper mapper = new ObjectMapper();
            MovieResponse movie = mapper.readValue(jsonResponse,MovieResponse.class);
            String poster = movie.getPosterPath();
            if (poster == null || poster.equals("")) {
                posterLinks.add("Images/noimagemd.png");
            } else {
                posterLinks.add("https://image.tmdb.org/t/p/w185" + poster);
            }
        }

        request.setAttribute("posterCount",posterLinks.size());
        request.setAttribute("posterLinks",posterLinks);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }
}






