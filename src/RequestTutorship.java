import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;

/**
 * Created by Hashan on 12/10/2017.
 */
@WebServlet(name = "/RequestTutorship" , urlPatterns = {"/RequestTutorship"})
public class RequestTutorship extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            Connection connection = CreateConnection.getConnection();

            HttpSession session = request.getSession();
            String userId = session.getAttribute("userId").toString();
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM tutorship where requestPersonId = ?");
            ps.setString(1, userId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                //System.out.println("11");
                response.getWriter().write("requested");
            }else {
                //System.out.println("22");
                Statement st = connection.createStatement();
                ResultSet rst =st.executeQuery("SELECT COUNT(*) FROM tutorship");
                int number = 0;
                while (rst.next()){
                    number = Integer.parseInt(rst.getString("COUNT(*)"));
                }
                String tutorshipId = "TUTE" + ( number + 1 );
                PreparedStatement pst = connection.prepareStatement("INSERT INTO tutorship VALUES (?,?,?,?,?,?,?,?)");
                pst.setString(1,tutorshipId);
                pst.setString(2,userId);
                pst.setString(3,null);
                pst.setString(4,null);
                pst.setString(5,new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new java.util.Date()));
                pst.setString(6,new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new java.util.Date()));
                pst.setString(7,null);
                pst.setString(8,null);
                int k = pst.executeUpdate();

                //System.out.println("33");
                if (k == 1){
                    //out.println("File Uploaded... Go Back");
                    response.getWriter().write("success");
                }else{
                    //out.println("Failed");
                    response.getWriter().write("failed");
                }
                //System.out.println("44");
            }


        }catch(Exception e){
            System.out.println(e);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
