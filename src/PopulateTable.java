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
 * Created by Hashan on 8/5/2017.
 */

@WebServlet(name = "/PopulateTable" , urlPatterns = {"/PopulateTable"})
public class PopulateTable extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ArrayList<Post> post = new ArrayList<>();
        post = FetchData.getAllPosts();
        Gson gson = new Gson();
        JsonElement element = gson.toJsonTree(post,new TypeToken<List<Post>>() {}.getType());
        JsonArray jsonArray = element.getAsJsonArray();
        response.setContentType("application/json");
        response.getWriter().print(jsonArray);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
