import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Created by Hashan on 7/17/2017.
 */
@WebServlet(name = "/Login" , urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    private Connection con;
    private Statement st;
    private ResultSet rs;

    public Login(){
        try {
            Class.forName("com.mysql.jdbc.Driver");

            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/drama.lk", "root", "");
            System.out.println("connected");
        } catch (Exception ex) {
            System.out.println("Database not connected");
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            st = con.createStatement();
            String query = "select * from person";
            rs = st.executeQuery(query);

            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");

           // System.out.println("inn");

            while(rs.next()) {

              //  System.out.println("in in");

                String un = rs.getString("email");
                String pw = rs.getString("password");
                String firstName = rs.getString("firstName");
                String userId = rs.getString("personId");
                String type = rs.getString("type");

                System.out.println("typeof : " +  type);

              //  System.out.println("first " + un);

                if (username.equals(un)) {

                   /// System.out.println(username);


                    if (password.equals(pw)) {
                       // System.out.println("final : " +password);
                        HttpSession session = request.getSession();
                        session.setAttribute("user", firstName);
                        session.setAttribute("userId",userId);
                        session.setAttribute("type",type);
                        session.setAttribute("profileId",userId);

                        response.getWriter().write(type);
                        break;
                    }else{
                        response.getWriter().write(username);
                        break;
                    }
                }


            }

        } catch (Exception ex) {
            System.out.println("DB Error" + ex);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
