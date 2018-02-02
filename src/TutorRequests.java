import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Created by Hashan on 12/10/2017.
 */
@WebServlet(name = "/TutorRequests" , urlPatterns = {"/TutorRequests"})
public class TutorRequests extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection connection = CreateConnection.getConnection();
        try{
            Statement statement = connection.createStatement();

            ResultSet rs = statement.executeQuery("SELECT COUNT(tutorshipId) FROM tutorship WHERE acceptPersonId is NULL ");

            if (rs.next()){
                response.getWriter().print(rs.getString("COUNT(tutorshipId)"));
            }



        }catch (Exception e){
            System.out.println("This error : " + e);

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
