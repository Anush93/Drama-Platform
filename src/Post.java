/**
 * Created by Hashan on 8/5/2017.
 */
public class Post {

    private String name;
    private String description;
    private String url;
    private String profileImageUrl;

    public Post(String name, String description, String url, String profileImageUrl){
        this.name = name;
        this.description = description;
        this.url = url;
        this.profileImageUrl = profileImageUrl;
    }


    public Post(){


    }

    public String getProfileImageUrl() {
        return profileImageUrl;
    }

    public void setProfileImageUrl(String profileImageUrl) {
        this.profileImageUrl = profileImageUrl;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

}
