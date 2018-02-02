import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

/**
 * Created by Hashan on 8/22/2017.
 */
@WebServlet(name = "/FileUpload" , urlPatterns = {"/FileUpload"})
public class FileUpload extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

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

                if (!item.isFormField()) {
                    item.write(new File("C:/Users/Dell/IdeaProjects/DramaPlatform/web/creative-feed/" + item.getName()));
                    path = item.getName();
                    continue;
                }
                if (item.isFormField()) {
                    value = item.getString();
                }

                PrintWriter out = response.getWriter();

                Connection connection = CreateConnection.getConnection();
                Statement st = connection.createStatement();
                ResultSet rst =st.executeQuery("SELECT COUNT(*) FROM item");
                int number = 0;
                while (rst.next()){
                    number = Integer.parseInt(rst.getString("COUNT(*)"));
                }
                String itemId = "ITM" + ( number + 1 );
                PreparedStatement ps = connection.prepareStatement("INSERT INTO item VALUES (?,?,?)");
                ps.setString(1,itemId);
                ps.setString(2,"../creative-feed/"+path);
                ps.setString(3,value);
                int k = ps.executeUpdate();

                PreparedStatement pst = connection.prepareStatement("INSERT INTO creation VALUES (?,?,?)");
                pst.setString(1,itemId);
                pst.setString(2, (String) request.getSession().getAttribute("userId"));
                pst.setInt(3, 0);
                int j = pst.executeUpdate();

                if (k == 1 && j == 1){
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
}
