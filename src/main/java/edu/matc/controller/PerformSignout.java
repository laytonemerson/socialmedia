package edu.matc.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * This is the PerformSignout servlet. It will invalidate the session and send a message back to the logout page
 * to confirm the user has been successfully logged out.
 *
 *@author lemerson
 */
@WebServlet(
        name = "performSignout",
        urlPatterns = {"/performSignout"}
) public class PerformSignout extends HttpServlet {

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

        // Get the user name and invalidate the session.
        HttpSession session = request.getSession();
        String userName = request.getRemoteUser();
        session.invalidate();

        session = request.getSession();
        session.setAttribute("logoutUserName", userName);
        String url = "/logout.jsp";

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

}