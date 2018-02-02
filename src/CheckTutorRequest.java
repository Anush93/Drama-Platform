import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by Hashan on 12/10/2017.
 */
@WebServlet(name = "/CheckTutorRequest" , urlPatterns = {"/CheckTutorRequest"})
public class CheckTutorRequest extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            Connection connection = CreateConnection.getConnection();

            HttpSession session = request.getSession();
            String userId = session.getAttribute("userId").toString();
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM tutorship where requestPersonId = ?");
            ps.setString(1, userId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                response.getWriter().write("requested");
            }else {
                response.getWriter().write("not-requested");
            }
        }catch (Exception e){
            System.out.println(e);

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
