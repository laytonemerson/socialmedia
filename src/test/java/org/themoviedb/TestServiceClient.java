package org.themoviedb;

import com.fasterxml.jackson.databind.ObjectMapper;
import edu.matc.entity.Movie;
import edu.matc.entity.User;
import edu.matc.persistence.UserDao;
import org.junit.Test;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import static org.junit.Assert.assertEquals;

public class TestServiceClient {

    @Test
    public void testMovieApiJSON() throws Exception {
        Client client = ClientBuilder.newClient();
        WebTarget target =
                client.target("https://api.themoviedb.org/3/search/movie?api_key=946112c161527a3ca57ea2a7ba0f1766" +
                                "&language=en-US&query=It&page=1");
        String jsonResponse = target.request(MediaType.APPLICATION_JSON).get(String.class);

        ObjectMapper mapper = new ObjectMapper();
        Response response = mapper.readValue(jsonResponse,Response.class);
        List<ResultsItem> resultItem = response.getResults();


        assertEquals("???",resultItem.get(0).getTitle());

    }

    @Test
    public void testMovie() throws Exception{
        UserDao dao = new UserDao();
        User user = dao.getUser("laytonemerson");

        List<String> posterLinks = new ArrayList<String>();
        Set<Movie> userMovies = user.getUserMovies();
        for (Movie userMovie: userMovies) {

            String searchString = "https://api.themoviedb.org/3/movie/" + userMovie.getMovieId().toString() +
                    "?api_key=946112c161527a3ca57ea2a7ba0f1766&language=en-US";

            Client client = ClientBuilder.newClient();
            WebTarget target = client.target(searchString);
            String jsonResponse = target.request(MediaType.APPLICATION_JSON).get(String.class);
            ObjectMapper mapper = new ObjectMapper();
            MovieResponse movie = mapper.readValue(jsonResponse,MovieResponse.class);
            posterLinks.add("https://image.tmdb.org/t/p/w185" + movie.getPosterPath());
        }
    }
}