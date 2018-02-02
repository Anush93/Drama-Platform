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
 * Created by Anush on 8/19/2017.
 */
@WebServlet(name = "/Search" , urlPatterns = "/Search")
public class Search extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<SearchItem> searchItem = new ArrayList<>();
        if(request.getParameter("name") != ""){
            searchItem = GetSearchItem.getAllSearchItems(request.getParameter("name"));
            Gson gson = new Gson();
            JsonElement element = gson.toJsonTree(searchItem,new TypeToken<List<SearchItem>>() {}.getType());
            JsonArray jsonArray = element.getAsJsonArray();
            response.setContentType("application/json");
            response.getWriter().print(jsonArray);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
