package edu.matc.controller;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.themoviedb.Response;
import org.themoviedb.ResultsItem;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;

import java.io.IOException;
import java.util.List;


/**
 * This is the ShowEmployeeSearchServlet. It will set the page title and forward
 * to the employeeSearch.jsp page.
 *
 *@author lemerson
 */
@WebServlet(
        name = "performMovieSearch",
        urlPatterns = {"/performMovieSearch"}
) public class PerformMovieSearch extends HttpServlet {
    /**
     *  Handles HTTP GET requests.
     *
     *@param  request               the HttpRequest
     *@param  response              the HttpResponse
     *@exception  ServletException  if there is a general servlet exception
     *@exception  IOException       if there is a general I/O exception
     */

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");
        String year = request.getParameter("year");

        StringBuilder searchString = new StringBuilder("https://api.themoviedb.org/3/search/movie?api_key=946112c161527a3ca57ea2a7ba0f1766&language=en-US&query=" + keyword);
        if (!year.equals("")) {
            searchString.append("&year=");
            searchString.append(year);
        }

        Client client = ClientBuilder.newClient();
        WebTarget target = client.target(searchString.toString());
        String jsonResponse = target.request(MediaType.APPLICATION_JSON).get(String.class);
        ObjectMapper mapper = new ObjectMapper();
        Response apiResponse = mapper.readValue(jsonResponse,Response.class);
        List<ResultsItem> movieList = apiResponse.getResults();

        request.setAttribute("movies", movieList);
        request.setAttribute("searchPerformed",true);

        String url = "/movieSearch.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }
}