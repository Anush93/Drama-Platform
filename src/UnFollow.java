import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Created by Hashan on 12/10/2017.
 */
@WebServlet(name = "/UnFollow" , urlPatterns = {"/UnFollow"})
public class UnFollow extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String follower = session.getAttribute("userId").toString();
            String following = session.getAttribute("profileId").toString();
            Connection connection = CreateConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement("DELETE FROM connections WHERE follower = ? and following = ?");
            ps.setString(1, follower);
            ps.setString(2, following);
            int s = ps.executeUpdate();
            if(s == 1){
                response.getWriter().write("success");
            }else {
                response.getWriter().write("failed");
            }
        }catch (Exception e){
            System.out.println("Error :"  + e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
