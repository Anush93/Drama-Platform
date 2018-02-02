import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Hashan on 12/9/2017.
 */
@WebServlet(name = "/MyProfile" , urlPatterns = {"/MyProfile"})
public class MyProfile extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("this is profile");
        HttpSession session = request.getSession();
        session.setAttribute("profileId",session.getAttribute("userId"));
        response.sendRedirect("user-profile.jsp");
    }
}
