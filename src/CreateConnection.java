import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Created by Hashan on 8/19/2017.
 */
public class CreateConnection {
    private static Connection connection = null;

    public static Connection getConnection(){
        if (connection != null){
            return connection;
        }else{
            try {
                Class.forName("com.mysql.jdbc.Driver");

                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/drama.lk", "root", "");
                System.out.println("connected");
            } catch (Exception ex) {
                System.out.println("Database not connected");
            }
            return connection;
        }
    }
}
