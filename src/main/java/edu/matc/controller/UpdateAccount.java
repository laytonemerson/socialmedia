package edu.matc.controller;

import edu.matc.entity.User;
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
 * This is the UpdateAccount servlet. It will update the user on the database and redirect back to the
 * showMyAccount servlet
 *
 *@author lemerson
 */
@WebServlet(
        name = "updateAccount",
        urlPatterns = {"/updateAccount"}
) public class UpdateAccount extends HttpServlet {

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

        // Get the user name
        UserDao dao = new UserDao();
        String userName= request.getParameter("user_name");

        // Attempt to update all the user fields from the form.
        try {
            User user = dao.getUser(userName);
            user.setEmailAddress(request.getParameter("email"));
            user.setFirstName(request.getParameter("first_name"));
            user.setLastName(request.getParameter("last_name"));
            user.setPassword(request.getParameter("password"));
            user.setUserPicture(request.getParameter("picurl"));
            user.setUserBio(request.getParameter("bio"));
            user.setMovieCount(user.getMovieCount());
            dao.updateUser(user);
        } catch (HibernateException he) {
            log.error("Error while attempting to update user " + userName, he);
            HttpSession session = request.getSession();
            session.setAttribute("ErrorMessage","Error while attempting to add user " + userName);
        }

        String url = "showMyAccount";
        response.sendRedirect(url);
    }
}