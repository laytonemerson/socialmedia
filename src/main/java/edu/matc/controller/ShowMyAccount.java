package edu.matc.controller;

import edu.matc.entity.User;
import edu.matc.entity.UserRole;
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
import java.util.List;
import java.util.Set;

/**
 * This is the ShowMyAccount servlet. It will load the user information to the request and forward to the
 * myAccount.jsp page.
 *
 *@author lemerson
 */
@WebServlet(
        name = "showMyAccount",
        urlPatterns = {"/showMyAccount"}
) public class ShowMyAccount extends HttpServlet {

    private final Logger log = Logger.getLogger(this.getClass());

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

        // Get the user name
        HttpSession session = request.getSession();
        String userName = request.getRemoteUser();
        String url = "";

        // Get the user. If the user is an admin, send all users to the admin page. If the user is a user, send
        // some attributes about the user to be used on the myaccount page.

        try {
            UserDao dao = new UserDao();
            User user = dao.getUser(userName);
            String roleName = returnRoleName(user);

            if (roleName.equals("admin")) {
                List<User> users = dao.getAllUsers();
                users.remove(user);
                request.setAttribute("users",users);
                request.setAttribute("title", "Admin Acct Delete");
                url = "/adminpage.jsp";
            } else {
                request.setAttribute("user",user);
                request.setAttribute("movieCount",user.getUserMovies().size());
                request.setAttribute("friendCount",user.getUserFriends().size());
                request.setAttribute("movies",user.getUserMovies());
                request.setAttribute("title", "My SM Account");
                url = "/myaccount.jsp";
            }
            session.setAttribute("loggedIn", true);
        } catch (HibernateException he) {
            log.error("Error while attempting to load account details for " + userName, he);
            session.setAttribute("ErrorMessage","Error while attempting to load account details for " + userName);
            url = "/generalError.jsp";
            response.sendRedirect(url);
        }

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    /**
     * Return what role the user is currently in.
     *
     * @param user  the user logging in
     * @return the role code of the user.
     */
    private String returnRoleName (User user) {
        Set<UserRole> roles = user.getUserRoles();
        for (UserRole role: roles ) {
            if (role.getRoleName().equals("admin")) {
                return "admin";
            } else {
                return "user";
            }
        }
        return "user";
    }
}