package org.themoviedb;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.Test;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;

import java.util.List;

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
}