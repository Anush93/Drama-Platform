import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

/**
 * Created by Anush on 12/10/2017.
 */
@WebServlet(name = "/UserUpdate", urlPatterns = {"/UserUpdate"})
public class UserUpdate extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            System.out.println("success");

            HttpSession session = request.getSession();
            String userId = session.getAttribute("userId").toString();

            System.out.println("hbhygb:"+userId);
            Connection connection = CreateConnection.getConnection();
            Statement st = connection.createStatement();




            String firstName = request.getParameter("fname");
            String lastName = request.getParameter("lname");
            String profession = request.getParameter("type");
            String password = request.getParameter("password");
            String district = request.getParameter("district");

            PreparedStatement ps = connection.prepareStatement("UPDATE person SET firstName = ? ,lastName = ?, password = ? , profession = ? , district = ?  WHERE personId = ?");
            ps.setString(1, firstName);
            ps.setString(2, lastName);

            ps.setString(3, password);
            ps.setString(4, profession);

            ps.setString(5, district);
            ps.setString(6, userId);
            int k = ps.executeUpdate();
            if (k == 1){
                System.out.println("success");
            }else{
                System.out.println("failed");
            }
            response.sendRedirect("user-profile.jsp");

        } catch (Exception e) {
            System.out.println(e);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
