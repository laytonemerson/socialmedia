package edu.matc.controller;

import edu.matc.entity.User;
import edu.matc.persistence.Mailer;
import edu.matc.persistence.UserDao;
import org.apache.log4j.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * This is the SendEmail servlet. It will send an email to the selected user with the text provided by the logged in
 * user on the previous form.
 *
 *@author lemerson
 */
@WebServlet(
        name = "sendEmail",
        urlPatterns = {"/sendEmail"}
) public class SendEmail extends HttpServlet {

    private final Logger log = Logger.getLogger(this.getClass());

    /**
     * Handles HTTP POST requests.
     *
     * @param request  the HttpRequest
     * @param response the HttpResponse
     * @throws ServletException if there is a general servlet exception
     * @throws IOException if there is a general I/O exception
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Pull the email parameters from the jsp page.
        String subject = request.getParameter("email_subject");
        String body = request.getParameter("email_body");
        String toUserName = request.getParameter("to_user");
        String toEmail = "";

        // Attempt to send the email that was drafted by the user.
        try {
            UserDao dao = new UserDao();
            User toUser = dao.getUser(toUserName);
            toEmail = toUser.getEmailAddress();
            Mailer.send("socialmedia.entjava@gmail.com","entjavaf2017",toEmail,subject,body);
        } catch (Exception e) {
            log.error("Error while attempting to send email to " + toEmail, e);
            HttpSession session = request.getSession();
            session.setAttribute("ErrorMessage","Error while attempting to send email to " + toEmail);
            String url = "/generalError.jsp";
            response.sendRedirect(url);
        }
    }
}