package edu.matc.controller;

import edu.matc.entity.Movie;
import edu.matc.entity.User;
import edu.matc.persistence.Mailer;
import edu.matc.persistence.UserDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Set;

/**
 * Thi
 *
 *@author lemerson
 */
@WebServlet(
        name = "sendEmail",
        urlPatterns = {"/sendEmail"}
) public class SendEmail extends HttpServlet {
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

        String subject = request.getParameter("email_subject");
        String body = request.getParameter("email_body");
        String toUserName = request.getParameter("to_user");

        UserDao dao = new UserDao();
        User toUser = dao.getUser(toUserName);
        String toEmail = toUser.getEmailAddress();

        Mailer.send("socialmedia.entjava@gmail.com","entjavaf2017",toEmail,subject,body);

    }
}