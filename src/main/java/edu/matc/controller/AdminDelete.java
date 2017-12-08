package edu.matc.controller;

import edu.matc.entity.Friend;
import edu.matc.entity.User;
import edu.matc.persistence.UserDao;
import org.apache.log4j.Logger;
import org.hibernate.HibernateException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * This is the Admin Delete servlet. It will delete the selected user from the database.
 *
 *@author lemerson
 */
@WebServlet(
        name = "adminDelete",
        urlPatterns = {"/adminDelete"}
) public class AdminDelete extends HttpServlet {

    private final Logger log = Logger.getLogger(this.getClass());

    /**
     * Handles HTTP GET requests.
     *
     * @param request  the HttpRequest
     * @param response the HttpResponse
     * @throws ServletException if there is a general servlet exception
     * @throws IOException      if there is a general I/O exception
     */

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the user name of the user to delete and send back list of users to admin page.

        String deleteUserName = request.getParameter("user_name_del");
        String url = "";
        try {
            //
            UserDao dao = new UserDao();
            dao.deleteUser(deleteUserName);
            List<User> users = dao.getAllUsers();
            User user = dao.getUser(request.getRemoteUser());
            users.remove(user);
            request.setAttribute("users",users);
            request.setAttribute("title", "Admin Acct Delete");
            url = "/adminpage.jsp";

        } catch (HibernateException he) {
            HttpSession session = request.getSession();
            log.error("Error while attempting to delete user " + deleteUserName, he);
            session.setAttribute("ErrorMessage","Error while attempting to delete user " + deleteUserName);
            url = "/generalError.jsp";
            response.sendRedirect(url);
        }

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

}