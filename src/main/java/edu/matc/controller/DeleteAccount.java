package edu.matc.controller;

import edu.matc.persistence.UserDao;
import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * This is the Delete Account servlet. It will delete the user from the database and send back to the home page.
 *
 *@author lemerson
 */
@WebServlet(
        name = "deleteAccount",
        urlPatterns = {"/deleteAccount"}
) public class DeleteAccount extends HttpServlet {

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

        // Get the user name
        String userName = request.getRemoteUser();
        HttpSession session = request.getSession();

        try {
            // Create and delete the user. Also invalidate the session to force the logout.
            UserDao dao = new UserDao();
            dao.deleteUser(userName);
            session.invalidate();
        } catch (HibernateException he) {
            log.error("Error while attempting to delete user " + userName, he);
            session.setAttribute("ErrorMessage","Error while attempting to delete user " + userName);
            String url = "/generalError.jsp";
            response.sendRedirect(url);
        }

        String url = "/socialmedia";
        response.sendRedirect(url);
    }
}