package edu.matc.controller;

import edu.matc.entity.User;
import edu.matc.persistence.UserDao;

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
        name = "updateAccount",
        urlPatterns = {"/updateAccount"}
) public class updateAccount extends HttpServlet {
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

        String userName = request.getParameter("user_name");
        String emailAddress = request.getParameter("email");
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String password = request.getParameter("password");
        String picUrl = request.getParameter("picurl");
        String bio = request.getParameter("bio");

        UserDao dao = new UserDao();
        User user = dao.getUser(userName);
        user.setEmailAddress(emailAddress);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setPassword(password);
        user.setUserPicture(picUrl);
        user.setUserBio(bio);
        user.setMovieCount(user.getMovieCount());
        dao.updateUser(user);

        String url = "showMyAccount";
        response.sendRedirect(url);

    }
}






