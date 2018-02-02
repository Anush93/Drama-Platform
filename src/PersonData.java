import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by Anush on 10/9/2017.
 */
public class PersonData {
    private static Connection connection = null;



    public static ArrayList<Persons> getAllPerson(String firstName,String lastName){
        //create connection with database
        connection = CreateConnection.getConnection();
        //create person list array
        ArrayList<Persons>  personList = new ArrayList<>();
        try{
            Statement statement = connection.createStatement();

            Connection connection = CreateConnection.getConnection();


            // System.out.println(firstName + lastName);



            PreparedStatement ps = connection.prepareStatement("SELECT * FROM person WHERE firstName = ? AND lastname = ?");
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ResultSet rs = ps.executeQuery();



            while (rs.next()){

                String personId = rs.getString("personId");

                PreparedStatement pst = connection.prepareStatement("SELECT personId , firstName , lastName , imageUrl , profession FROM person where personId = ?");
                pst.setString(1,personId);


                ResultSet rst = pst.executeQuery();
                rst.next();
                //create new person
                Persons person = new Persons();
                person.setName(rst.getString("firstName") +" "+ rst.getString("lastName"));
                person.setProfileImageUrl(rst.getString("imageUrl"));
                person.setProfession(rst.getString("profession"));
                person.setPersonId(rst.getString("personId"));



                personList.add(person);
            }

        }catch (Exception e){
            System.out.println("This error : " + e);

        }
        return personList;
    }
}
