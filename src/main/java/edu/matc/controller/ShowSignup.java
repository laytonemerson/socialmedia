package edu.matc.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

/**
 * This is the ShowSignup servlet. It will set the page title and forward to the signup.jsp page.
 *
 *@author lemerson
 */
@WebServlet(
        name = "showSignup",
        urlPatterns = {"/showSignup"}
) public class ShowSignup extends HttpServlet {

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

        String url = "/signup.jsp";
        request.setAttribute("title", "Sign up for SM");
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}