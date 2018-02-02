import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

/**
 * Created by Hashan on 12/11/2017.
 */
@WebServlet(name = "/UploadProfileImage" , urlPatterns = {"/UploadProfileImage"})
public class UploadProfileImage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            HttpSession session = request.getSession();
            String userId = session.getAttribute("userId").toString();

            //System.out.println("hihi");

            // Create a factory for disk-based file items
            DiskFileItemFactory factory = new DiskFileItemFactory();

            // Configure a repository (to ensure a secure temp location is used)
            ServletContext servletContext = this.getServletConfig().getServletContext();
            File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
            factory.setRepository(repository);

            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);

            // Parse the request
            List<FileItem> multipleFiles = upload.parseRequest(request);

            //String desc = request.getParameter("desc");
            String value = "";
            String path = "";
            for (FileItem item : multipleFiles){




                item.write(new File("C:/Users/Dell/IdeaProjects/DramaPlatform/web/profile-images/" + item.getName()));
                path = item.getName();



                PrintWriter out = response.getWriter();

                Connection connection = CreateConnection.getConnection();

                PreparedStatement ps = connection.prepareStatement("UPDATE person SET imageUrl = ? WHERE personId = ?");
                ps.setString(1,"../profile-images/"+path);
                ps.setString(2,userId);
                int k = ps.executeUpdate();


                if (k == 1){
                    //out.println("File Uploaded... Go Back");
                    response.getWriter().write("success");
                }else{
                    //out.println("Failed");
                    response.getWriter().write("failed");
                }


            }
        } catch (Exception e) {
            System.out.println("error : " + e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
