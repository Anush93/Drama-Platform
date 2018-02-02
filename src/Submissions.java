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
 * Created by Hashan on 12/7/2017.
 */
@WebServlet(name = "/Submissions" , urlPatterns = {"/Submissions"})
public class Submissions extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Connection connection = CreateConnection.getConnection();
        try{
            Statement statement = connection.createStatement();

            ResultSet rs = statement.executeQuery("SELECT COUNT(itemId) FROM creation WHERE approved = 0");

            if (rs.next()){
                response.getWriter().print(rs.getString("COUNT(itemId)"));
            }



        }catch (Exception e){
            System.out.println("This error : " + e);

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
