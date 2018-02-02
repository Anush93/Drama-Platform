import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;

/**
 * Created by Hashan on 12/10/2017.
 */
@WebServlet(name = "/TutorshipDecision" , urlPatterns = {"/TutorshipDecision"})
public class TutorshipDecision extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String adminId = session.getAttribute("userId").toString();
        int type = Integer.parseInt(request.getParameter("type"));
        String userId = request.getParameter("userId");
        Connection con = CreateConnection.getConnection();
        //System.out.println(userId);
        //System.out.println("11");

        try{
            if(type == 1){
                //System.out.println("22");
                PreparedStatement ps = con.prepareStatement("UPDATE tutorship SET acceptPersonId = ? , status = ? , grantDate = ? , grantTime = ? WHERE requestPersonId = ?");
                ps.setString(1,adminId);
                ps.setString(2,"approved");
                ps.setString(3,new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new java.util.Date()));
                ps.setString(4,new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new java.util.Date()));
                ps.setString(5,userId);
                int rs = ps.executeUpdate();

                PreparedStatement pst = con.prepareStatement("UPDATE person SET type = ?  WHERE personId = ?");
                pst.setString(1,"tutor");
                pst.setString(2,userId);
                int js = pst.executeUpdate();
                //System.out.println("33");
                if (rs == 1 && js == 1){
                    response.getWriter().print("success");
                }else{
                    response.getWriter().print("failed");
                }

            }else if (type == 2){
                PreparedStatement ps = con.prepareStatement("DELETE FROM tutorship WHERE requestPersonId = ?");
                ps.setString(1,userId);
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
