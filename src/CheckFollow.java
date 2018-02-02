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
 * Created by Hashan on 12/9/2017.
 */
@WebServlet(name = "/CheckFollow" , urlPatterns = {"/CheckFollow"})
public class CheckFollow extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            HttpSession session = request.getSession();
            String follower = session.getAttribute("userId").toString();
            String following = session.getAttribute("profileId").toString();
            Connection connection = CreateConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM connections where follower = ? and following = ?");
            ps.setString(1, follower);
            ps.setString(2, following);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                response.getWriter().write("connected");
            }else {
                response.getWriter().write("not-connected");
            }
        }catch (Exception e){
            System.out.println("Error :"  + e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
