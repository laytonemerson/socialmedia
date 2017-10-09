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
        name = "showMyAccount",
        urlPatterns = {"/showMyAccount"}
) public class ShowMyAccount extends HttpServlet {
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

        String url = "/myaccount.jsp";
        request.setAttribute("title", "My SM Account");
        HttpSession session = request.getSession();

        session.removeAttribute("newUser");
        session.removeAttribute("newUserName");
        session.setAttribute("loggedIn", true);

        UserDao dao = new UserDao();
        User user = dao.getUser(request.getRemoteUser());
        request.setAttribute("user",user);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }
}






