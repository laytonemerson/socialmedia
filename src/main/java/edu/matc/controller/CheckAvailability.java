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
import java.io.PrintWriter;

/**
 * This is the Check Availability Servlet. It's called asynchronously when the user is creating an account to check if
 * the username they entered is available.
 *
 *@author lemerson
 */
@WebServlet(
        name = "checkAvailability",
        urlPatterns = {"/checkAvailability"}
) public class CheckAvailability extends HttpServlet {

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

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            // Given the user name that was typed, check if the user name exists. If null, the user name
            // doesnt exist, so return true (available0
            UserDao dao = new UserDao();
            User user2 = dao.getUser(request.getParameter("user_name"));
            if (user2 == null) {
                out.print("{\"valid\" : true }");
            } else {
                out.print("{\"valid\" : false }");
            }
        } catch (HibernateException he) {
            HttpSession session = request.getSession();
            log.error("Error while checking user name availability", he);
            session.setAttribute("ErrorMessage","Error while checking user name availability");
        } finally {
            out.close();
        }
    }
}