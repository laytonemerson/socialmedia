package edu.matc.controller;

import edu.matc.entity.User;
import edu.matc.entity.UserRole;
import edu.matc.persistence.UserDao;
import org.apache.log4j.Logger;
import org.hibernate.HibernateException;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * This is the PerformSignup servlet. It will create a user object, add it to the database, and route the user to
 * the MyAccount page.
 *
 *@author lemerson
 */
@WebServlet(
        name = "performSignup",
        urlPatterns = {"/performSignup"}
) public class PerformSignup extends HttpServlet {

    private final Logger log = Logger.getLogger(this.getClass());

    /**
    *  Handles HTTP Post requests.
    *
    *@param  request               the HttpRequest
    *@param  response              the HttpResponse
    *@exception  ServletException  if there is a general servlet exception
    *@exception  IOException       if there is a general I/O exception
    */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Create a user ojbect based on all the parameters.
        User user = userToCreate(request);
        UserRole role = new UserRole("user");
        role.setUser(user);
        user.getUserRoles().add(role);

        // Attempt to save the user to the database
        try {
            UserDao dao = new UserDao();
            String name = dao.addUser(user);
        } catch(HibernateException he) {
            log.error("Error while attempting to add user " + user.getUserName(), he);
            HttpSession session = request.getSession();
            session.setAttribute("ErrorMessage","Error while attempting to add user " + user.getUserName());
            String url = "/generalError.jsp";
            response.sendRedirect(url);
        }

        // Set the user as logged in and Redirect to MyAccount Servlet.
        request.login(user.getUserName(),user.getPassword());
        String url = "showMyAccount";
        response.sendRedirect(url);
    }

    /**
     * Return a user object to add to the database
     *
     * @param request  the HttpRequest
     * @return user the user object to create
     */
    private User userToCreate (HttpServletRequest request) {

        String userName = request.getParameter("user_name");
        String emailAddress = request.getParameter("email");
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String password = request.getParameter("password");
        String picUrl = request.getParameter("picurl");
        String userBio = request.getParameter("bio");

        User user = new User(userName,password,emailAddress,firstName,lastName,picUrl,userBio,0);
        return user;
    }
}