import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Hashan on 12/8/2017.
 */
@WebServlet(name = "/GetProfileDetails" , urlPatterns = {"/GetProfileDetails"})
public class GetProfileDetails extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String profileId = request.getParameter("profileId");
        ArrayList<Person> person = new ArrayList<>();
        HttpSession session = request.getSession();
        //String userId = session.getAttribute("userId").toString();
        System.out.println("get details : " + profileId);
        person = FetchData.getProfileDetails(profileId);
        Gson gson = new Gson();
        JsonElement element = gson.toJsonTree(person,new TypeToken<List<Person>>() {}.getType());
        JsonArray jsonArray = element.getAsJsonArray();
        response.setContentType("application/json");
        response.getWriter().print(jsonArray);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
