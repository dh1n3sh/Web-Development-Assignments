import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.SimpleDateFormat;

public class delete extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{

		Connection conn;
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try
		{

			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				conn =  DriverManager.getConnection("jdbc:mysql://localhost:3308/stud","root","ssn");
			}
			catch(Exception e)
			{
				out.println(e.toString());
				return;
			}

			PreparedStatement st = conn.prepareStatement("delete from info where id = ?");
			st.setString(1,request.getParameter("id"));
			int rwcnt = st.executeUpdate();

			if(rwcnt>=1)
				out.println("Deleted successfully.!");
			else
				out.println("The row does not exist.!");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}
}