import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Hashan on 12/7/2017.
 */
@WebServlet(name = "/CommentList" , urlPatterns = {"/CommentList"})
public class CommentList extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        System.out.println(id);
        ArrayList<Comment> comment = new ArrayList<>();
        comment = FetchData.getCommentList(id);
        Gson gson = new Gson();
        JsonElement element = gson.toJsonTree(comment,new TypeToken<List<Comment>>() {}.getType());
        JsonArray jsonArray = element.getAsJsonArray();
        response.setContentType("application/json");
        response.getWriter().print(jsonArray);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
