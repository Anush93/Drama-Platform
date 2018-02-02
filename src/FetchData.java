import java.sql.*;
import java.util.ArrayList;

/**
 * Created by Hashan on 8/5/2017.
 */
public class FetchData {
    private static Connection connection = null;



        public static ArrayList<Post> getAllPosts(){
            connection = CreateConnection.getConnection();
            ArrayList<Post>  postList = new ArrayList<>();
            try{
                Statement statement = connection.createStatement();

                ResultSet rs = statement.executeQuery("SELECT * FROM creation WHERE approved = 1 limit 10");



                while (rs.next()){
                    String itemId = rs.getString("itemId");
                    String personId = rs.getString("personId");

                    PreparedStatement pst = connection.prepareStatement("SELECT firstName , lastName , imageUrl FROM person where personId = ?");
                    pst.setString(1,personId);
                    ResultSet rst = pst.executeQuery();
                    rst.next();
                    Post post = new Post();
                    post.setName(rst.getString("firstName") + rst.getString("lastName"));
                    post.setProfileImageUrl(rst.getString("imageUrl"));

                    PreparedStatement prst = connection.prepareStatement("SELECT url , description  FROM item where itemId = ?");
                    prst.setString(1,itemId);
                    ResultSet rest = prst.executeQuery();
                    rest.next();

                    post.setDescription(rest.getString("description"));
                    post.setUrl(rest.getString("url"));

                    postList.add(post);
                }

            }catch (Exception e){
                System.out.println("This error : " + e);

            }
            return postList;
        }

    public static ArrayList<Tutorial> getRecommended(){
        connection = CreateConnection.getConnection();
        ArrayList<Tutorial>  recommendedList = new ArrayList<>();
        try{
            Statement statement = connection.createStatement();

            ResultSet rs = statement.executeQuery("SELECT * FROM tutorial WHERE rateAverage >= 4 limit 5 ");



            while (rs.next()){
                String itemId = rs.getString("itemId");
                String personId = rs.getString("personId");
                String thumbnail = rs.getString("thumbnail");
                String rateAverage = rs.getString("rateAverage");

                PreparedStatement pst = connection.prepareStatement("SELECT firstName , lastName , imageUrl FROM person where personId = ?");
                pst.setString(1,personId);
                ResultSet rst = pst.executeQuery();
                rst.next();
                Tutorial tutorial = new Tutorial();
                tutorial.setName(rst.getString("firstName") + rst.getString("lastName"));
                tutorial.setId(itemId);
                tutorial.setProUrl(rst.getString("imageUrl"));

                PreparedStatement prst = connection.prepareStatement("SELECT url , description  FROM item where itemId = ?");
                prst.setString(1,itemId);
                ResultSet rest = prst.executeQuery();
                rest.next();

                tutorial.setDescription(rest.getString("description"));
                tutorial.setUrl(rest.getString("url"));
                tutorial.setThumbnail(thumbnail);
                tutorial.setRate(Integer.parseInt(rateAverage));

                recommendedList.add(tutorial);
            }

        }catch (Exception e){
            System.out.println("This error : " + e);

        }
        return recommendedList;
    }

    public static ArrayList<Tutorial> getRecent(){
        connection = CreateConnection.getConnection();
        ArrayList<Tutorial>  recentList = new ArrayList<>();
        try{
            Statement statement = connection.createStatement();

            ResultSet rs = statement.executeQuery("SELECT * FROM tutorial ORDER BY itemId DESC limit 5");

            while (rs.next()){
                String itemId = rs.getString("itemId");
                String personId = rs.getString("personId");
                String thumbnail = rs.getString("thumbnail");
                String rateAverage = rs.getString("rateAverage");

                PreparedStatement pst = connection.prepareStatement("SELECT firstName , lastName FROM person where personId = ?");
                pst.setString(1,personId);
                ResultSet rst = pst.executeQuery();
                rst.next();
                Tutorial tutorial = new Tutorial();
                tutorial.setName(rst.getString("firstName") + rst.getString("lastName"));
                tutorial.setId(itemId);

                PreparedStatement prst = connection.prepareStatement("SELECT url , description  FROM item where itemId = ?");
                prst.setString(1,itemId);
                ResultSet rest = prst.executeQuery();
                rest.next();

                tutorial.setDescription(rest.getString("description"));
                tutorial.setUrl(rest.getString("url"));
                tutorial.setThumbnail(thumbnail);
                tutorial.setRate(Integer.parseInt(rateAverage));

                recentList.add(tutorial);
            }

        }catch (Exception e){
            System.out.println("This error : " + e);

        }
        return recentList;
    }

    public static ArrayList<Tutorial> getMiming(){
        connection = CreateConnection.getConnection();
        ArrayList<Tutorial>  mimingList = new ArrayList<>();
        try{
            Statement statement = connection.createStatement();

            ResultSet rs = statement.executeQuery("SELECT * FROM tutorial WHERE personId = 'USR1' limit 5");

            while (rs.next()){
                String itemId = rs.getString("itemId");
                String personId = rs.getString("personId");
                String thumbnail = rs.getString("thumbnail");
                String rateAverage = rs.getString("rateAverage");

                PreparedStatement pst = connection.prepareStatement("SELECT firstName , lastName FROM person where personId = ?");
                pst.setString(1,personId);
                ResultSet rst = pst.executeQuery();
                rst.next();
                Tutorial tutorial = new Tutorial();
                tutorial.setName(rst.getString("firstName") + rst.getString("lastName"));
                tutorial.setId(itemId);

                PreparedStatement prst = connection.prepareStatement("SELECT url , description  FROM item where itemId = ?");
                prst.setString(1,itemId);
                ResultSet rest = prst.executeQuery();
                rest.next();

                tutorial.setDescription(rest.getString("description"));
                tutorial.setUrl(rest.getString("url"));
                tutorial.setThumbnail(thumbnail);
                tutorial.setRate(Integer.parseInt(rateAverage));

                mimingList.add(tutorial);
            }

        }catch (Exception e){
            System.out.println("This error : " + e);

        }
        return mimingList;
    }

    public static ArrayList<Comment> getCommentList(String tutorialId){
        connection = CreateConnection.getConnection();
        ArrayList<Comment>  commentList = new ArrayList<>();
        try{
            Statement statement = connection.createStatement();

            PreparedStatement prst = connection.prepareStatement("SELECT * FROM comment WHERE tutorial_itemId = ? limit 5");
            prst.setString(1,tutorialId);
            ResultSet rs = prst.executeQuery();


            while (rs.next()){
                String comment = rs.getString("comment");
                String time = rs.getString("time");
                String date = rs.getString("date");
                String personId = rs.getString("personId");

                PreparedStatement pst = connection.prepareStatement("SELECT firstName , lastName , imageUrl FROM person where personId = ?");
                pst.setString(1,personId);
                ResultSet rst = pst.executeQuery();
                rst.next();
                Comment cmt = new Comment();
                cmt.setUserName(rst.getString("firstName") + rst.getString("lastName"));
                cmt.setProUrl(rst.getString("imageUrl"));
                cmt.setComment(comment);
                cmt.setDate(date);
                cmt.setTime(time);

                commentList.add(cmt);
            }

        }catch (Exception e){
            System.out.println("This error : " + e);

        }
        return commentList;
    }

    public static ArrayList<Person> getProfileDetails(String userId){
        connection = CreateConnection.getConnection();
        ArrayList<Person>  detailList = new ArrayList<>();
        try{
            Statement statement = connection.createStatement();

            PreparedStatement prst = connection.prepareStatement("SELECT * FROM person WHERE personId = ?");
            prst.setString(1,userId);
            ResultSet rs = prst.executeQuery();


            while (rs.next()){
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String type = rs.getString("type");
                String dob = rs.getString("dob");
                String email = rs.getString("email");
                String imageUrl = rs.getString("imageUrl");
                String profession = rs.getString("profession");

                PreparedStatement pst = connection.prepareStatement("SELECT COUNT(following) FROM connections where following = ?");
                pst.setString(1,userId);
                ResultSet rst = pst.executeQuery();
                rst.next();

                PreparedStatement ppst = connection.prepareStatement("SELECT COUNT(follower) FROM connections where follower = ?");
                ppst.setString(1,userId);
                ResultSet rrst = ppst.executeQuery();
                rrst.next();

                Person newPerson = new Person();

                newPerson.setUserId(userId);
                newPerson.setFirstName(firstName);
                newPerson.setLastName(lastName);
                newPerson.setType(type);
                newPerson.setDob(dob);
                newPerson.setEmail(email);
                newPerson.setImageUrl(imageUrl);
                newPerson.setProfession(profession);
                newPerson.setFollowings(rst.getInt("COUNT(following)"));
                newPerson.setFollowers(rrst.getInt("COUNT(follower)"));


                PreparedStatement pstt = connection.prepareStatement("SELECT follower FROM connections where following = ?");
                pstt.setString(1,userId);
                ResultSet rstt = pstt.executeQuery();
                ResultSetMetaData rsmd = rstt.getMetaData();

                System.out.println(rstt);
                int columnCount = rsmd.getColumnCount();

                ArrayList<String> followingList = new ArrayList<>(columnCount);
                while (rstt.next()) {
                    int i = 1;
                    while(i <= columnCount) {
                        followingList.add(rstt.getString(i++));
                    }
                }
                newPerson.setFollowingSet(followingList);

                PreparedStatement psttt = connection.prepareStatement("SELECT following FROM connections where follower = ?");
                psttt.setString(1,userId);
                ResultSet rsttt = psttt.executeQuery();
                ResultSetMetaData rsmdd = rsttt.getMetaData();
                int columnCountt = rsmdd.getColumnCount();
                //System.out.println(columnCountt);
                //System.out.println(columnCount);

                ArrayList<String> followerList = new ArrayList<>(columnCountt);
                while (rsttt.next()) {
                    int i = 1;
                    while(i <= columnCountt) {
                        followerList.add(rsttt.getString(i++));
                    }
                }
                newPerson.setFollowerSet(followerList);

                detailList.add(newPerson);
            }

        }catch (Exception e){
            System.out.println("This error : " + e);

        }
        return detailList;
    }

    public static ArrayList<Submission> getSubmissions(){
        connection = CreateConnection.getConnection();
        ArrayList<Submission>  submissionList = new ArrayList<>();
        try{
            Statement statement = connection.createStatement();

            ResultSet rs = statement.executeQuery("SELECT * FROM creation WHERE approved = 0");



            while (rs.next()){
                String itemId = rs.getString("itemId");
                String personId = rs.getString("personId");

                PreparedStatement pst = connection.prepareStatement("SELECT firstName , lastName , type, imageUrl FROM person where personId = ?");
                pst.setString(1,personId);
                ResultSet rst = pst.executeQuery();
                rst.next();
                Submission submission = new Submission();
                submission.setUserId(personId);
                submission.setFirstName(rst.getString("firstName"));
                submission.setLastName(rst.getString("lastName"));
                submission.setType(rst.getString("type"));
                submission.setItemId(itemId);
                //submission.setProfileImageUrl(rst.getString("imageUrl"));

                PreparedStatement prst = connection.prepareStatement("SELECT url , description  FROM item where itemId = ?");
                prst.setString(1,itemId);
                ResultSet rest = prst.executeQuery();
                rest.next();

                submission.setDesc(rest.getString("description"));
                //submission.setUrl(rest.getString("url"));

                submissionList.add(submission);
            }

        }catch (Exception e){
            System.out.println("This error : " + e);

        }
        return submissionList;
    }

    public static ArrayList<TutorRequest> getTutorRequests(){
        connection = CreateConnection.getConnection();
        ArrayList<TutorRequest>  requestList = new ArrayList<>();
        try{
            Statement statement = connection.createStatement();

            ResultSet rs = statement.executeQuery("SELECT * FROM tutorship WHERE acceptPersonId is NULL");



            while (rs.next()){
                String personId = rs.getString("requestPersonId");

                PreparedStatement pst = connection.prepareStatement("SELECT firstName , lastName , type, email FROM person where personId = ?");
                pst.setString(1,personId);
                ResultSet rst = pst.executeQuery();
                rst.next();
                TutorRequest tutorRequest = new TutorRequest();
                tutorRequest.setUserId(personId);
                tutorRequest.setFirstName(rst.getString("firstName"));
                tutorRequest.setLastName(rst.getString("lastName"));
                tutorRequest.setType(rst.getString("type"));
                tutorRequest.setEmail(rst.getString("email"));
                //submission.setProfileImageUrl(rst.getString("imageUrl"));

                /*PreparedStatement prst = connection.prepareStatement("SELECT url , description  FROM item where itemId = ?");
                prst.setString(1,itemId);
                ResultSet rest = prst.executeQuery();
                rest.next();

                submission.setDesc(rest.getString("description"));
                //submission.setUrl(rest.getString("url"));*/

                requestList.add(tutorRequest);
            }

        }catch (Exception e){
            System.out.println("This error : " + e);

        }
        return requestList;
    }

}
