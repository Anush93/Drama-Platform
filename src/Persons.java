/**
 * Created by Anush on 12/9/2017.
 */
public class Persons {
    private String name;
    private String profession;
    private String profileImageUrl;
    private String personId;

    public Persons(String personId, String name, String profession,  String profileImageUrl){
        this.name = name;
        this.profession = profession;
        this.profileImageUrl = profileImageUrl;
        this.personId = personId;
    }


    public Persons(){


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

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getPersonId() {
        return personId;
    }

    public void setPersonId(String personId) {
        this.personId = personId;
    }



}
