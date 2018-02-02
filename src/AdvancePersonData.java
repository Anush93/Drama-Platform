import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by Anush on 12/10/2017.
 */
public class AdvancePersonData {
    private static Connection connection = null;



    public static ArrayList<Persons> getAllPerson(String profession, String district){
        connection = CreateConnection.getConnection();
        ArrayList<Persons>  advancepersonList = new ArrayList<>(); //create array list
        try{
            Statement statement = connection.createStatement();
            // System.out.println("awa 1");
            Connection connection = CreateConnection.getConnection();


            // System.out.println(firstName + lastName);


             if (district.equals("Any")){
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM person WHERE profession = ? ");
            ps.setString(1, profession);

            ResultSet rs = ps.executeQuery();



            while (rs.next()){

                String personId = rs.getString("personId");

                PreparedStatement pst = connection.prepareStatement("SELECT personId, firstName , lastName , imageUrl , profession FROM person where personId = ?");
                pst.setString(1,personId);


                ResultSet rst = pst.executeQuery();
                rst.next();
                Persons advanceperson = new Persons();
                advanceperson.setName(rst.getString("firstName") +" "+ rst.getString("lastName"));
                advanceperson.setProfileImageUrl(rst.getString("imageUrl"));
                advanceperson.setProfession(rst.getString("profession"));
                advanceperson.setPersonId(rst.getString("personId"));



                advancepersonList.add(advanceperson);
            }
             }
             else{
                 System.out.println(profession);
                 System.out.println(district);
                 //select persons their profession and district equal to searching value
                 PreparedStatement ps = connection.prepareStatement("SELECT * FROM person WHERE profession = ? AND district = ?");
                 ps.setString(1, profession);
                 ps.setString(2, district);
                 ResultSet rs = ps.executeQuery();



                 while (rs.next()){

                      //get person id
                     String personId = rs.getString("personId");

                     PreparedStatement pst = connection.prepareStatement("SELECT personId, firstName , lastName , imageUrl , profession FROM person where personId = ?");
                     pst.setString(1,personId);


                     ResultSet rst = pst.executeQuery();
                     rst.next();
                     //create new person
                     Persons advanceperson = new Persons();
                     advanceperson.setName(rst.getString("firstName") +" "+ rst.getString("lastName"));
                     advanceperson.setProfileImageUrl(rst.getString("imageUrl"));
                     advanceperson.setProfession(rst.getString("profession"));
                     advanceperson.setPersonId(rst.getString("personId"));



                     advancepersonList.add(advanceperson);
                 }

             }
        }catch (Exception e){
            System.out.println("This error : " + e);

        }
        return advancepersonList;
    }
}
