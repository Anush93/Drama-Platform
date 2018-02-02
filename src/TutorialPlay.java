import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Hashan on 12/6/2017.
 */
@WebServlet(name = "/TutorialPlay" , urlPatterns = {"/TutorialPlay"})
public class TutorialPlay extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String url = request.getParameter("url");
        String desc = request.getParameter("description");
        String name = request.getParameter("name");
        String proUrl = request.getParameter("proUrl");
        //System.out.println(id);
        //System.out.println(url);
        HttpSession session = request.getSession();
        session.setAttribute("playId", id);
        session.setAttribute("playUrl", url);
        session.setAttribute("playDesc", desc);
        session.setAttribute("playName", name);
        session.setAttribute("playProUrl", proUrl);

        //CommentTable cl = new CommentTable();
        //System.out.println(cl.getComments(id).getClass());
        //session.setAttribute("playCommentList",cl.getComments(id));

        response.sendRedirect("tutorial-player.jsp?user="+id);
    }
}
