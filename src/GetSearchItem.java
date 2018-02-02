import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * Created by Anush on 8/19/2017.
 */
public class GetSearchItem {
    static Connection connection = CreateConnection.getConnection();

    public static ArrayList<SearchItem> getAllSearchItems(String name){
        ArrayList<SearchItem> searchList = new ArrayList<>();
        try{

            PreparedStatement ps = connection.prepareStatement("SELECT * FROM person WHERE firstName LIKE ? OR lastname LIKE ?");
            ps.setString(1,name + "%");
            ps.setString(2,name + "%");
            ResultSet rs = ps.executeQuery();



            while (rs.next()){
                SearchItem searchItem = new SearchItem();
                searchItem.setFirstName(rs.getString("firstName"));
                searchItem.setLastName(rs.getString("lastName"));
                searchItem.setId(rs.getString("personId"));

                //System.out.println("end");
                searchList.add(searchItem);
            }

        }catch (Exception e){
            System.out.println("This error : " + e);

        }
        return searchList;
    }
}


