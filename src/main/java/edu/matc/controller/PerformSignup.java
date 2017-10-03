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
        HttpSession session = request.getSession();

        removeAttributes(session);

        String userName = request.getParameter("input_user_name");
        String emailAddress = request.getParameter("input_email");
        String firstName = request.getParameter("input_first_name");
        String lastName = request.getParameter("input_last_name");
        String password1 = request.getParameter("input_pass1");
        String password2 = request.getParameter("input_pass2");

        if (!password1.equals(password2)) {
            setPasswordErrorAttributes(session, userName, emailAddress, firstName, lastName);
        } else {
            User user = new User(userName,password1,emailAddress,firstName,lastName);
            boolean userExists = performExistenceCheck(user.getUserName());
            if (userExists) {
                setUserTakenErrorAttributes(session, userName, emailAddress, firstName, lastName, password1);
            } else {
                UserDao dao = new UserDao();
                String userNameReturn = dao.addUser(user);
            }
        }

        String url = "/signup.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);

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

    private void removeAttributes(HttpSession session){
        session.removeAttribute("userTakenError");
        session.removeAttribute("passwordError");
        session.removeAttribute("userName");
        session.removeAttribute("emailAddress");
        session.removeAttribute("firstName");
        session.removeAttribute("lastName");
        session.removeAttribute("password");
    }

    private void setPasswordErrorAttributes(HttpSession session, String userName, String emailAddress,
                                            String firstName, String lastName) {
        session.setAttribute("passwordError", true);
        session.setAttribute("userName", userName);
        session.setAttribute("emailAddress", emailAddress);
        session.setAttribute("firstName", firstName);
        session.setAttribute("lastName", lastName);
    }

    private void setUserTakenErrorAttributes(HttpSession session, String userName, String emailAddress,
                                            String firstName, String lastName, String password) {
        session.setAttribute("userTakenError", true);
        session.setAttribute("userName", userName);
        session.setAttribute("emailAddress", emailAddress);
        session.setAttribute("firstName", firstName);
        session.setAttribute("lastName", lastName);
        session.setAttribute("password", password);
    }

}






