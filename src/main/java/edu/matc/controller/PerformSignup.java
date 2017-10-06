package edu.matc.controller;

import edu.matc.entity.User;
import edu.matc.persistence.UserDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userName = request.getParameter("user-name");
        String emailAddress = request.getParameter("email-address");
        String firstName = request.getParameter("first-name");
        String lastName = request.getParameter("last-name");
        String password = request.getParameter("password");


        User user = new User(userName,password,emailAddress,firstName,lastName);
        boolean userExists = performExistenceCheck(user.getUserName());
        if (userExists) {
            String url = "/signup.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        } else {
            UserDao dao = new UserDao();
            String userNameReturn = dao.addUser(user);
            String url = "showMyAccount";
            response.sendRedirect(url);
        }
    }

    private boolean performExistenceCheck(String userName) {
        boolean found = true;
        UserDao dao = new UserDao();
        User user2 = dao.getUser(userName);
        if (user2 == null) {
            found = false;
        }
        return found;
    }
}






