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
 * Created by Anush on 12/9/2017.
 */
@WebServlet(name = "/PeopleSearch", urlPatterns = {"/PeopleSearch"})
public class PeopleSearch extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //get first name and last name from searching bar
            String firstName = request.getParameter("fname");
            String lastName = request.getParameter("lname");
            //create person array list
            ArrayList<Persons> person = new ArrayList<>();
            person = PersonData.getAllPerson(firstName,lastName);
            //create gson array
            Gson gson = new Gson();
            JsonElement element = gson.toJsonTree(person,new TypeToken<List<Persons>>() {}.getType());
            JsonArray jsonArray = element.getAsJsonArray();

            HttpSession session = request.getSession();
            session.setAttribute("searchList",jsonArray);
            //send the data to ajax
            response.setContentType("application/json");
            response.getWriter().print(jsonArray);















           // System.out.println("success");
           // Connection connection = CreateConnection.getConnection();





           /* PreparedStatement ps = connection.prepareStatement("SELECT * FROM person WHERE firstName = ? AND lastname = ?");
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ResultSet rs = ps.executeQuery();
            System.out.println(rs);
            while (rs.next()){

            } */
        }
        catch (Exception e) {
            System.out.println(e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
