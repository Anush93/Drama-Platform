import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Hashan on 12/6/2017.
 */
public class CommentTable {

    public ArrayList<Comment> getComments(String id){
        ArrayList<Comment> comment = new ArrayList<>();
        comment = FetchData.getCommentList(id);
        Gson gson = new Gson();
        JsonElement element = gson.toJsonTree(comment,new TypeToken<List<Comment>>() {}.getType());
        JsonArray jsonArray = element.getAsJsonArray();
        return comment;
    }


}
