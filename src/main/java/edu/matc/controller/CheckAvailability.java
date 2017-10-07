package edu.matc.controller;

import edu.matc.entity.User;
import edu.matc.persistence.UserDao;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * This is the ShowEmployeeSearchServlet. It will set the page title and forward
 * to the employeeSearch.jsp page.
 *
 *@author lemerson
 */
@WebServlet(
        name = "checkAvailability",
        urlPatterns = {"/checkAvailability"}
) public class CheckAvailability extends HttpServlet {
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

        response.setContentType("application/json");

        PrintWriter out = response.getWriter();
        JSONObject json = new JSONObject();

        try {
            UserDao dao = new UserDao();
            User user2 = dao.getUser(request.getParameter("user_name"));


            if (user2 == null) {

                out.print("{\"valid\" : true }");
                json.put("valid", true);
            } else {

                out.print("{\"valid\" : false }");
                json.put("valid", false);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            out.close();
        }
    }
}