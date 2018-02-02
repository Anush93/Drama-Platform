import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Created by Hashan on 12/7/2017.
 */
@WebServlet(name = "/SubmissionDecision" , urlPatterns = {"/SubmissionDecision"})
public class SubmissionDecision extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int type = Integer.parseInt(request.getParameter("type"));
        Connection con = CreateConnection.getConnection();

        try{
            if(type == 1){
                PreparedStatement ps = con.prepareStatement("UPDATE creation SET approved = 1 WHERE itemId = ?");
                ps.setString(1,request.getParameter("itemId"));
                int rs = ps.executeUpdate();

                if (rs == 1){
                    response.getWriter().print("success");
                }else{
                    response.getWriter().print("failed");
                }

            }else if (type == 2){
                PreparedStatement ps = con.prepareStatement("DELETE FROM item WHERE itemId = ?");
                ps.setString(1,request.getParameter("itemId"));
                int rs = ps.executeUpdate();

                if (rs == 1){
                    response.getWriter().print("success");
                }else{
                    response.getWriter().print("failed");
                }
            }



        }catch (Exception e){
            System.out.println("This error : " + e);

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
