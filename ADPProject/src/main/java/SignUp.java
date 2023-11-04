import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import sql.InitDatabase;

@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
    private static final long serialVersionUID = 1L;
  
    protected void doPost(HttpServletRequest request, 
HttpServletResponse response)
        throws ServletException, IOException
    {
        try {
  
            Connection con=InitDatabase.Getconnector();
  
            PreparedStatement st = con.prepareStatement("insert into users values(?, ?, ?, ?)");
  
            st.setString(1, request.getParameter("uname"));
            st.setString(2, request.getParameter("mail"));
            st.setString(3, request.getParameter("pwd"));
            st.setString(4, request.getParameter("number"));
  
            st.executeUpdate();
  
            st.close();
            con.close();
  
            HttpSession session=request.getSession();
            session.setAttribute("user", request.getParameter("uname"));
            response.sendRedirect("userPage.jsp");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}