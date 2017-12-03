package edu.matc.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fasterxml.jackson.databind.ObjectMapper;
import edu.matc.entity.Movie;
import edu.matc.entity.User;
import edu.matc.persistence.UserDao;
import org.apache.log4j.Logger;
import org.themoviedb.Response;
import org.themoviedb.ResultsItem;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Set;

/**
 * This is the PerformMovieSearch Servlet. It will call theMovieDB.org api using the keyword provided by the user and
 * return a list of movies to display on the search results page.
 *
 *@author lemerson
 */
@WebServlet(
        name = "performMovieSearch",
        urlPatterns = {"/performMovieSearch"}
) public class PerformMovieSearch extends HttpServlet {

    private final Logger log = Logger.getLogger(this.getClass());

    /**
     *  Handles HTTP POST requests.
     *
     *@param  request               the HttpRequest
     *@param  response              the HttpResponse
     *@exception  ServletException  if there is a general servlet exception
     *@exception  IOException       if there is a general I/O exception
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the username and keyword, then create the search string to send to the API.
        String keyword = request.getParameter("keyword");
        String userName = request.getRemoteUser();

        HttpSession session = request.getSession();
        String searchString = "https://api.themoviedb.org/3/search/movie?api_key=946112c161527a3ca57ea2a7ba0f1766" +
                "&language=en-US&query=" + URLEncoder.encode(keyword, "UTF-8");

        try {
            // Call the API
            Client client = ClientBuilder.newClient();
            WebTarget target = client.target(searchString);

            // Create the user and work through the JSON response. We need the user, so we can see if
            // they already own the movie.
            UserDao dao = new UserDao();
            User user = dao.getUser(userName);
            String jsonResponse = target.request(MediaType.APPLICATION_JSON).get(String.class);

            // Create the final movieList that will be shown on the JSP page.
            List<ResultsItem> movieList;
            movieList = createMovieList(jsonResponse, user);
            request.setAttribute("movies", movieList);
        } catch (Exception e) {
            log.error("Error while attempting to search for movie keyword " + keyword, e);
            session.setAttribute("ErrorMessage","Error while attempting to search for movie keyword " + keyword);
        }

        request.setAttribute("searchPerformed",true);
        request.setAttribute("title", "Movie Search");
        session.setAttribute("keyword", keyword);
        String url = "/movieSearch.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    /**
     * Return a list of ResultsItem, which will contain all the movie details and a custom field to determine if
     * the user already owns the movie.
     *
     * @param jsonResponse the json used to create the objects
     * @param user  the current logged in user.
     * @return movieList the results returned from the API.
     */
    private  List<ResultsItem> createMovieList (String jsonResponse, User user) throws IOException {

        ObjectMapper mapper = new ObjectMapper();
        Response apiResponse = mapper.readValue(jsonResponse,Response.class);
        List<ResultsItem> movieList = apiResponse.getResults();
        Set<Movie> userMovies = user.getUserMovies();

        for (ResultsItem movie : movieList) {
            movie.setUserHas(false);
            for (Movie userMovie: userMovies) {
                if (userMovie.getMovieId() == movie.getId()){
                    movie.setUserHas(true);
                }
            }
        }

        return movieList;
    }
}