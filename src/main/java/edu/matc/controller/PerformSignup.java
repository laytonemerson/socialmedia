package edu.matc.controller;

import edu.matc.entity.User;
import edu.matc.persistence.UserDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * This is the ShowEmployeeSearchServlet. It will set the page title and forward
 * to the employeeSearch.jsp page.
 *
 *@author lemerson
 */
@WebServlet(
        name = "performSignup",
        urlPatterns = {"/performSignup"}
) public class PerformSignup extends HttpServlet {
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

        User user = new User();
        user.setUserName(request.getParameter("input_user_name"));
        user.setEmailAddress(request.getParameter("input_email"));
        user.setFirstName(request.getParameter("input_first_name"));
        user.setLastName(request.getParameter("input_last_name"));
        user.setPassword(request.getParameter("input_pass1"));

        UserDao dao = new UserDao();
        String userNameReturn  = dao.addUser(user);

        String url = "/signup.jsp";
        request.setAttribute("pageTitle", "Create an account");

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }
}





