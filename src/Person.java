import java.util.ArrayList;

/**
 * Created by Hashan on 12/8/2017.
 */
public class Person {
    private String userId;
    private String firstName;
    private String lastName;
    private String type;
    private String dob;
    private String email;
    private String imageUrl;
    private String profession;
    private int followers;
    private int followings;
    private ArrayList<String> followerSet;
    private ArrayList<String> followingSet;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }


    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getFollowers() {
        return followers;
    }

    public void setFollowers(int followers) {
        this.followers = followers;
    }

    public int getFollowings() {
        return followings;
    }

    public void setFollowings(int followings) {
        this.followings = followings;
    }

    public ArrayList<String> getFollowerSet() {
        return followerSet;
    }

    public void setFollowerSet(ArrayList<String> followerSet) {
        this.followerSet = followerSet;
    }

    public ArrayList<String> getFollowingSet() {
        return followingSet;
    }

    public void setFollowingSet(ArrayList<String> followingSet) {
        this.followingSet = followingSet;
    }
}
