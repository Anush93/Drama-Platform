import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Created by Anush on 26/09/2017.
 */
@WebServlet(name = "/EmailVerify", urlPatterns = {"/EmailVerify"})
public class EmailVerify extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            Connection connection = CreateConnection.getConnection();
            Statement st = connection.createStatement();
            String email = request.getParameter("email");
            //System.out.println(email);
            PreparedStatement ps = connection.prepareStatement("SELECT email FROM person WHERE email = ? ");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {


                String un = rs.getString("email");

                if (email.equals(un)) {
                    System.out.println("hahaaa");
                    response.getWriter().write(un);

                }else{
                    System.out.println("no person");
                }



            }
          //  response.getWriter().print(personId);


        }catch (Exception e){
            System.out.println(e);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
